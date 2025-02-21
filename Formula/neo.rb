class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.3.2"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_macos_universal.tar.gz"
    sha256 "30dd2ab95622dd2718fea3300e90450c807db5161864e61427cf2c73b3dd7bcc"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_linux_amd64.tar.gz"
      sha256 "0ba9beef085209e8ba30053a7d568d34937075db482b0b731b5c87bd80ad9a8b"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.2/neo_cli_0_3_2_linux_arm64.tar.gz"
      sha256 "04f58c8c0d15d51655a5f5913cac1188604f746d1357727ea43025fc6a8f23bc"
    end
  end

  def install
    bin.install "neo"
  end
end
