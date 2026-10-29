class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.10/qurry-cli_0.2.10_aarch64-apple-darwin.tar.gz"
      sha256 "2ce344ccee27b011ccd05f0715193ffc13753c8bde1ce167633ec74cb32a9b1e"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.10/qurry-cli_0.2.10_x86_64-apple-darwin.tar.gz"
      sha256 "41cf93a74507dc7842bf94ef2f0111a3034218b247e92c36244b592934ea4631"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.10/qurry-cli_0.2.10_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a77ab68f8e88af3de1cff6ad92f597b029d93a6c2fa5ad893bba0b226d2e2825"
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
