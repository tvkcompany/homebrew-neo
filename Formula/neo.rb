class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.3.2"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_macos_universal.tar.gz"
    sha256 "caee68e6a2792c99b2fcacd5ed76aa9a035e0e236299553bbe880e52f042069f"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_linux_amd64.tar.gz"
      sha256 "2fedf55c51ab78402d4d3595b079273023e90b8c13b0558276b28f8b90319ee6"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_linux_arm64.tar.gz"
      sha256 "0d335c3d394c05aa6af0802894ad5be45c6368c38f85caf32f094695088b26c6"
    end
  end

  def install
    bin.install "neo"
  end
end
