class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.1.3"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.3/neo_cli_0_1_3_macos_universal.tar.gz"
    sha256 "b0662edd94c7b537591a615c1195e0cab99a0dd4ec30c70f11a6ea651ebe692f"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.3/neo_cli_0_1_3_linux_amd64.tar.gz"
      sha256 "ee14f226c7ba66c49b72037bf360a75f9a53075dbf9e65b44e8f8c39f3cfd137"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.3/neo_cli_0_1_3_linux_arm64.tar.gz"
      sha256 "d42a5a13bbab769cec34f701558bf35e96322fc8ae47265f31c63425059ea8a9"
    end
  end

  def install
    bin.install "neo"
  end
end
