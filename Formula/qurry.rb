class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.1.25"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.25/qurry-cli_0.1.25_aarch64-apple-darwin.tar.gz"
      sha256 "1f4f395ab4854749d1aad4d1179d5ba1d1a467bf96c6d897a1f87b6a0704af65"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.25/qurry-cli_0.1.25_x86_64-apple-darwin.tar.gz"
      sha256 "6252f413540289f7b92d0dcf033c916aae708831242a1085deb1a2e5759f9249"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.25/qurry-cli_0.1.25_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e4fe4f80fc8df531863e72caa58cbf6e3fdb9bcd3d08218db439106ae955f7d"
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
