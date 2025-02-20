class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.3.1"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.1/neo_cli_0_3_1_macos_universal.tar.gz"
    sha256 "c4db99caade02eee78502fc0663e0522f97cc9ecbaf8507787cd98f0203785d6"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.1/neo_cli_0_3_1_linux_amd64.tar.gz"
      sha256 "81e829875c7849b5fcf4610f47fec0c1db62db69b93acbf3eddab25f3b84ddfd"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.3.1/neo_cli_0_3_1_linux_arm64.tar.gz"
      sha256 "176a59bafebad1e4acb2219e3c8fd1c266344db4098428c5bc991187ce0728d3"
    end
  end

  def install
    bin.install "neo"
  end
end
