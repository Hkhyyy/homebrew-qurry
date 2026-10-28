class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.2/qurry-cli_0.2.2_aarch64-apple-darwin.tar.gz"
      sha256 "e3f2b8c59aa426b993ebcbd5570cf37360f2e0dd7b81caca90c2da032120410b"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.2/qurry-cli_0.2.2_x86_64-apple-darwin.tar.gz"
      sha256 "ef5d2d5bbeebe51f3b562ea2f10472d4aee1bf7c8037ddd7349b49acf1efeaeb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.2/qurry-cli_0.2.2_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5bc26be1489b63427135a864e908f061e1aae010bcf1eb179c295f652c7d13cc"
    end
  end

  def install
    bin.install "qurry-tui", "qurry-mcp"
  end

  def caveats
    <<~EOS
      Register the MCP server with Claude Code (read-only by default):
        claude mcp add qurry -- #{opt_bin}/qurry-mcp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qurry-tui --version")
  end
end
