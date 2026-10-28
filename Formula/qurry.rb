class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.5/qurry-cli_0.2.5_aarch64-apple-darwin.tar.gz"
      sha256 "ea46e658217c6666ed17562927b728d8d2d5eced9449f38c72cce88fc5f79baf"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.5/qurry-cli_0.2.5_x86_64-apple-darwin.tar.gz"
      sha256 "23f00fb6b3164ae5b3c893adad9a3adad0b6a976dbe4ca30bed9260ff84eefa5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.5/qurry-cli_0.2.5_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c571c605a17097ef8ea0c13ecee932b00c50f01ec2d15b960fd80578ae214f2"
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
