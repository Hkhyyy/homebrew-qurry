class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.8/qurry-cli_0.2.8_aarch64-apple-darwin.tar.gz"
      sha256 "25e59f8e2cf1995f0719f00da0edfaabda50432309a1787ce3bc4fdd2a2fe778"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.8/qurry-cli_0.2.8_x86_64-apple-darwin.tar.gz"
      sha256 "33cafb1398c3651d672305a822b8699502dc8720a3519fc732cb70f8f060f296"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.8/qurry-cli_0.2.8_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6841b225c70aa662748c0d2f7ee502c8953852541664a690316d8fe193bc5108"
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
