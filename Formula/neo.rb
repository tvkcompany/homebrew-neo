class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.1.3"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.3/neo_cli_0_1_3_macos_universal.tar.gz"
    sha256 "2bc89c6effea54011b9d7f311f4f2f87cd9c3ce82d8c58a5d1081bdc777fdee9"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.3/neo_cli_0_1_3_linux_amd64.tar.gz"
      sha256 "8c4bef130a1682e46284fad349acd43ede64621c2e9d3314305d319954fc92de"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.3/neo_cli_0_1_3_linux_arm64.tar.gz"
      sha256 "742f82a7cc4b724429d5ea6cf432f74f3ff3b7b565e6acd937ea84f7e8799aea"
    end
  end

  def install
    bin.install "neo"
  end
end
