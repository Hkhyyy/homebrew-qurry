class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.4/qurry-cli_0.2.4_aarch64-apple-darwin.tar.gz"
      sha256 "228a7d60f00a688261d8c0ba565609d4a8187016b034164dace930b6d6049584"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.4/qurry-cli_0.2.4_x86_64-apple-darwin.tar.gz"
      sha256 "62eba7702071c0bdfc19b1f00e322361c696305264a27d9927d50a0b2f1e71fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.4/qurry-cli_0.2.4_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e93a5599ae5aa4f9ef251ac0f5e785454a8eaf1ba8b7e53873f8b498d5c76686"
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
