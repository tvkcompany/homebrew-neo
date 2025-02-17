class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.2.0"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.2.0/neo_cli_0_2_0_macos_universal.tar.gz"
    sha256 "274229049b41f70275ef09d2f968c615f899b6a4deb4c9a19531318dfe8e5311"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.2.0/neo_cli_0_2_0_linux_amd64.tar.gz"
      sha256 "0913a364bfa2a641d7acd6e3165a93141f7bd0be98441593bca32dce354b9b9b"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.2.0/neo_cli_0_2_0_linux_arm64.tar.gz"
      sha256 "cf2405dad3e124d2427132d5cc8d7e7c2c3d43e6fb7ab30a4d4c724e9d02af59"
    end
  end

  def install
    bin.install "neo"
  end
end
