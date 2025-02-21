class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.3.2"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_macos_universal.tar.gz"
    sha256 "d9602de58e9d3e654842f904a5b8ffe7f9ca617cfbdac2ead75955273e16d53a"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_linux_amd64.tar.gz"
      sha256 "180bcc9e15756e6630baf7880c27ac6f073a4d3f7ad3422d5e42e8a1abb5444a"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_linux_arm64.tar.gz"
      sha256 "7f7ac81e75700d45ef5fe571db2f73bfdd12dd9d1dbf3945e1ca8a8e584ad101"
    end
  end

  def install
    bin.install "neo"
  end
end
