class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.11/qurry-cli_0.2.11_aarch64-apple-darwin.tar.gz"
      sha256 "fd7f58c7180da1ff2a4ac0882f43d53286dcadc64f35bacd39a9e5fb5ae61f91"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.11/qurry-cli_0.2.11_x86_64-apple-darwin.tar.gz"
      sha256 "234a31dc23a60aa227faf3f389e493e0308020be2220a0b0c5b39dc737aaab9d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.11/qurry-cli_0.2.11_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b4af4c0662e37841289e8b8b8642be33cbfa6c89aad481722316b698a342460e"
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
