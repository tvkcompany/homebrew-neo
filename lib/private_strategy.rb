require "download_strategy"
require "utils/github"
require "utils/formatter"

# This download strategy authenticates and downloads release assets
# from private GitHub repositories.
class GitHubPrivateRepositoryDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    parse_url_pattern
    set_github_token
  end

  def parse_url_pattern
    unless match = @url.match(%r{https://github.com/([^/]+)/([^/]+)/(\S+)})
      raise CurlDownloadStrategyError, "Invalid url pattern for GitHub Repository."
    end
    _, @owner, @repo, @filepath = *match
  end

  def download_url
    "https://#{@github_token}@github.com/#{@owner}/#{@repo}/#{@filepath}"
  end

  private

  def _fetch(url:, resolved_url:, timeout:)
    curl_download download_url, to: temporary_path
  end

  def set_github_token
    @github_token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    unless @github_token
      raise CurlDownloadStrategyError, "HOMEBREW_GITHUB_API_TOKEN environment variable is required."
    end
    validate_github_repository_access!
  end

  def validate_github_repository_access!
    GitHub.repository(@owner, @repo)
  rescue GitHub::API::HTTPNotFoundError
    message = <<~EOS
      HOMEBREW_GITHUB_API_TOKEN cannot access the repository: #{@owner}/#{@repo}
      This token may not have permission to access the repository or the URL may be incorrect.
    EOS
    raise CurlDownloadStrategyError, message
  end
end

# This subclass handles downloading release assets from private GitHub repositories.
class GitHubPrivateRepositoryReleaseDownloadStrategy < GitHubPrivateRepositoryDownloadStrategy
  def initialize(url, name, version, **meta)
    super
  end

  def parse_url_pattern
    url_pattern = %r{https://github.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(\S+)}
    unless @url =~ url_pattern
      raise CurlDownloadStrategyError, "Invalid url pattern for GitHub Release."
    end
    _, @owner, @repo, @tag, @filename = *@url.match(url_pattern)
  end

  def download_url
    "https://#{@github_token}@api.github.com/repos/#{@owner}/#{@repo}/releases/assets/#{asset_id}"
  end

  private

  def _fetch(url:, resolved_url:, timeout:)
    curl_download download_url, "--header", "Accept: application/octet-stream", to: temporary_path
  end

  def asset_id
    @asset_id ||= resolve_asset_id
  end

  def resolve_asset_id
    release_metadata = GitHub.get_release(@owner, @repo, @tag)
    assets = release_metadata["assets"].select { |a| a["name"] == @filename }
    if assets.empty?
      raise CurlDownloadStrategyError, "Asset file not found."
    end
    assets.first["id"]
  end
end
