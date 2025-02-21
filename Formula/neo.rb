class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.3.2"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_macos_universal.tar.gz"
    sha256 "ee2c23ba24ee545ff81e9b34420b88728668d50c48e45c8211c6d574dc4a1d39"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_linux_amd64.tar.gz"
      sha256 "b427123853fd413b15c020e5647e378205f9855bab5875ecc1dc938f9851b268"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_linux_arm64.tar.gz"
      sha256 "5316619970da80c3e6c3981c6b17f8243acc7ef41896767dbbec3f843718de12"
    end
  end

  def install
    bin.install "neo"
  end
end
