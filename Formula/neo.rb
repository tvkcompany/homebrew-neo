class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.2.0"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.2.0/neo_cli_0_2_0_macos_universal.tar.gz"
    sha256 "901c566752d7ca103aa389ff9e86b5c75096f7bb61838817fc83679791b1fa8c"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.2.0/neo_cli_0_2_0_linux_amd64.tar.gz"
      sha256 "95dfa84f7867fee4d1dd39816e7fbb60bd12cfa48664cdf340457c801aafe880"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.2.0/neo_cli_0_2_0_linux_arm64.tar.gz"
      sha256 "41d47d55c4e7cabaef78ebc27050c3864216817697d658bd1836f45852be82aa"
    end
  end

  def install
    bin.install "neo"
  end
end
