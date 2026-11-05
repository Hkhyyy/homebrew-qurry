class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.1/qurry-cli_0.3.1_aarch64-apple-darwin.tar.gz"
      sha256 "31a4bf19d91f48889fbd650ba332f8188d085e8000ad52e449d99b7498d53912"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.1/qurry-cli_0.3.1_x86_64-apple-darwin.tar.gz"
      sha256 "c3d428328c6d1c6f12a531383c072d5f45f18c0f269e6f5861cd782f27665222"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.1/qurry-cli_0.3.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85f372d005ac549907f76e357c1000dc072c68ff6b11ab61df46cdddc2875730"
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
