class Neo < Formula
  desc "Neo CLI"
  homepage "https://tvk.company"
  version "1.1.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.1.0/neo_cli_1_1_0_macos_amd64.tar.gz"
      sha256 "3df4161ba7de2a87b9ad33d00c94ad70e67b47c1826a25dc7ab4299bf02b7bfd"
    else
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.1.0/neo_cli_1_1_0_macos_arm64.tar.gz"
      sha256 "2cd7b8ec33a1f52d8153710afe673e19227dbc190f26adbe3d9da391bdf04c77"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.1.0/neo_cli_1_1_0_linux_amd64.tar.gz"
      sha256 "f27170578fd6ea4cc301f94e13ccc53a818018f545fe079fe58d51ff2be86ba4"
    end
    
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tvkcompany/neo_cli/releases/download/1.1.0/neo_cli_1_1_0_linux_arm64.tar.gz"
      sha256 "2b47bf0de7922ea7bf0f3e85c2a925b42e1680abb942028910fd0aedd74be2f0"
    end
  end

  def install
    bin.install "neo"
  end
end
