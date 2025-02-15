class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "0.1.2"
  license "Proprietary"

  on_macos do
    url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.2/neo_cli_0_1_2_macos_universal.tar.gz"
    sha256 "48fe5ec4ba1809fc052feb577e8b3cf889066ddee3571f7e9d0c02c1a5e5893d"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.2/neo_cli_0_1_2_linux_amd64.tar.gz"
      sha256 "c3aab1dad6a3eca81188fe984ea4e2ebc01c7eaa3ef90018479490c647c4e413"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/0.1.2/neo_cli_0_1_2_linux_arm64.tar.gz"
      sha256 "784350e9635ef0e02c10162b514d8cb9575b11be015d96a8db445ec2dd35b96b"
    end
  end

  def install
    bin.install "neo"
  end
end
