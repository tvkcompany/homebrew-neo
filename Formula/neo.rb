require_relative "../lib/private_strategy"

class Neo < Formula
  desc "Neo CLI"
  homepage "tvk.company"
  version "0.1.0"
  license "Proprietary"

  on_macos do
    url "example.com",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "example"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "example.com",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "example"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "example.com",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "example"
    end
  end

  def install
    bin.install "neo"
  end
end
