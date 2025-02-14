require_relative "../lib/private_strategy"

class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.1.1"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.1/neo_cli_0_1_1_macos_universal.tar.gz",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "8e11bcd550b5ea7acc2f20bd42e01d710285a2929f5271bf03fe3369ea186d58"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.1/neo_cli_0_1_1_linux_amd64.tar.gz",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "48fe81631c03bbb22b12fac4fbd3456824cff021d026b3138824d32c217ece7b"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.1/neo_cli_0_1_1_linux_arm64.tar.gz",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "e01cb0cf641377017e7dbfbd6f061dc4b56ad4a7c75ef5050847374b543ef3c6"
    end
  end

  def install
    bin.install "neo"
  end
end
