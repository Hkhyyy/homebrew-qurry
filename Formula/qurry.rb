class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.1.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.18/qurry-cli_0.1.18_aarch64-apple-darwin.tar.gz"
      sha256 "16914d92f429de2f9d60e6166d254eddc99440325ca14e0ecce5e4bb53a8a64e"
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
