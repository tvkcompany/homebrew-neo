class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "1.2.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.2.0/neo_cli_1_2_0_macos_amd64.tar.gz"
      sha256 "998aa0ee35046b25d8396b75dbe504f7a48c1093514009833c7485bf53bd35ba"
    else
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.2.0/neo_cli_1_2_0_macos_arm64.tar.gz"
      sha256 "264bfc1c1d6fe3ae05d80fe457f7513e60a0b771de81b5f17a947ff428adffb0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.2.0/neo_cli_1_2_0_linux_amd64.tar.gz"
      sha256 "2be0e54964ee0f1e6c7ce14b11567af2082ef214e13e302513a424cac7cfbcbb"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.2.0/neo_cli_1_2_0_linux_arm64.tar.gz"
      sha256 "afadbbbd3d3fa846f0a21387a42ccde630d08afdc4d7fff7c3751247c1653478"
    end
  end

  def install
    bin.install "neo"
  end
end
