class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.1.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.24/qurry-cli_0.1.24_aarch64-apple-darwin.tar.gz"
      sha256 "5619ccb9ba7514c58ef9c2049f5e6beb10d62089e126a199839df21f429a09fe"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.24/qurry-cli_0.1.24_x86_64-apple-darwin.tar.gz"
      sha256 "94fab396dff0b4a55504f3dfa8c1a710007b7c74fa0f1c408af88a2450ce0acb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.24/qurry-cli_0.1.24_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98931888af99651308981d7e3765e9df77b3246ea5d059462290b6f5e202d3e5"
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
