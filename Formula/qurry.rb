class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.9/qurry-cli_0.2.9_aarch64-apple-darwin.tar.gz"
      sha256 "2985a934018a0006120b33e03431e54a34f4637204295b829947cf56957947b2"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.9/qurry-cli_0.2.9_x86_64-apple-darwin.tar.gz"
      sha256 "d30eecaf927c2907611ab993d042e5e3e4977de15cf45dbba79d5d29568ee12f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.9/qurry-cli_0.2.9_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c961db9500b07bb3e70271962901cf4ac4c2045de33325feb95034ec61b8d2fb"
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
