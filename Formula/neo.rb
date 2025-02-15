class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.1.3"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.3/neo_cli_0_1_3_macos_universal.tar.gz"
    sha256 "9c1f2fdd041ffe72408ff1b69692df1155dae223daaf438d9d0b330427c678b7"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.3/neo_cli_0_1_3_linux_amd64.tar.gz"
      sha256 "0680421ff20c00e82b30e7a9342fef0f5cfadce545ddc93aac88c58a0970db1a"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.3/neo_cli_0_1_3_linux_arm64.tar.gz"
      sha256 "6c8535482e7227d516b7b34d3c9783ddc03245898059965d7d982d96c4b049fb"
    end
  end

  def install
    bin.install "neo"
  end
end
