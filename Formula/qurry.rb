class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.0/qurry-cli_0.2.0_aarch64-apple-darwin.tar.gz"
      sha256 "9bf5b853bf6133da075d115ed2f72b923dc9fb100b96bc8943c4e32000668681"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.0/qurry-cli_0.2.0_x86_64-apple-darwin.tar.gz"
      sha256 "01d597842bedb32fee804596381cd1178aadb32bef508a031a9ac5ced786b7c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.0/qurry-cli_0.2.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ae5b0fbe619ca99d11b5d5c5f5efbf2fe625f76f00309f2d57905365d89b234c"
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
