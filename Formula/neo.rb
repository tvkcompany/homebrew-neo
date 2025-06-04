class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "1.0.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.0.1/neo_cli_1_0_1_macos_amd64.tar.gz"
      sha256 "06af06a4920baf49ed101252bd4d57a096a3d65c1a61dd234d81c4b8f54c8817"
    else
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.0.1/neo_cli_1_0_1_macos_arm64.tar.gz"
      sha256 "3ad881d6dd462a77fd888caacccb67fa7daee3b1b797d2b0a9743a9008a2574f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.0.1/neo_cli_1_0_1_linux_amd64.tar.gz"
      sha256 "4d428bb7b4e015abae46880597bcdb7afd60af98c2f49d349e77773a47a5c321"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.0.1/neo_cli_1_0_1_linux_arm64.tar.gz"
      sha256 "a9f013d6b2dbdc22a9371ebab7f1ab56cce0361c75f7267bbd1fbc67c670f336"
    end
  end

  def install
    bin.install "neo"
  end
end
