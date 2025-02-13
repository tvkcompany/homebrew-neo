require_relative "../lib/private_strategy"

class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.1.0"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.0/neo_cli_0_1_0_macos_universal.tar.gz",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "8c6bc19897bda278e23cf952ffe07da3f308f3b240398c9689624c4efcb0f861"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.0/neo_cli_0_1_0_linux_amd64.tar.gz",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "7937edcc30b7622c9d8cf6cb00ba0a90f4b1e8f968d57c8a57cd3595da6ba4bb"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.0/neo_cli_0_1_0_linux_arm64.tar.gz",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "c493b0d64947ffa5353bd7317ffbe550601cbd9ffbde8ff32079e50b76a09b44"
    end
  end

  def install
    bin.install "neo"
  end
end
