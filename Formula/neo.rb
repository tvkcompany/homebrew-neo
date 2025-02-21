class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.3.2"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_macos_universal.tar.gz"
    sha256 "2065b656c9bec0741dd90b86ed3cd1be256ce4aca9c4c2cdd9f88581e6de0c04"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_linux_amd64.tar.gz"
      sha256 "6ed289208a18476186b71ac5e195099f1876aa12bbebb90a9b4b5daad47061f7"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_linux_arm64.tar.gz"
      sha256 "dbfb8b8bc533ad7473c58fb7283400c7de414f13d3fcbd4727fbad1929add05b"
    end
  end

  def install
    bin.install "neo"
  end
end
