class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.1.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.20/qurry-cli_0.1.20_aarch64-apple-darwin.tar.gz"
      sha256 "033c975316f5671142df0a7f61ae47f5466a59f94a6e0d28d01292be931dfaba"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.20/qurry-cli_0.1.20_x86_64-apple-darwin.tar.gz"
      sha256 "3fb523d4dc8c40c8b00ac079127ad0a2c50962257a454363d7f7d7a5cd2ea849"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.20/qurry-cli_0.1.20_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b25478a7845830008ee844d4ef5287267865323f0341f9a314e1fe080ee89870"
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
