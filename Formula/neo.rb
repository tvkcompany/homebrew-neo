class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.3.0"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.0/neo_cli_0_3_0_macos_universal.tar.gz"
    sha256 "e1cdd7c260c513e0682fbb343070af3bb19a623c63d1e6097953c7c233740181"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.0/neo_cli_0_3_0_linux_amd64.tar.gz"
      sha256 "c3b32b3ca10537b1d85b43525337122f93b60306e57fe13c10e40958b0132d46"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.0/neo_cli_0_3_0_linux_arm64.tar.gz"
      sha256 "c8acfa19080d993d221cd7f69151aa80abbd37142e831e2ebd3d429ebda7332c"
    end
  end

  def install
    bin.install "neo"
  end
end
