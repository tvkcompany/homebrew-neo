class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "1.0.0"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/1.0.0/neo_cli_1_0_0_macos_universal.tar.gz"
    sha256 "d0cf3c44e0aad090869f1b573f97a5795e34e3bf955763afeb66c6fdf1d62045"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.0.0/neo_cli_1_0_0_linux_amd64.tar.gz"
      sha256 "826db79a9d229f5ebb0f677419339ea00a0161611e3721d77a8925e9cf08b65a"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.0.0/neo_cli_1_0_0_linux_arm64.tar.gz"
      sha256 "49a70c5a21589c1b8b0f019023e37377f84ac04676446b9e5a1bb649aa0ffa3c"
    end
  end

  def install
    bin.install "neo"
  end
end
