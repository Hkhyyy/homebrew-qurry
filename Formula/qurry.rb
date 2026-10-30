class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.13/qurry-cli_0.2.13_aarch64-apple-darwin.tar.gz"
      sha256 "07d0978f31436bf36563cc56ff2c9c0e4fae763596e4d8e8d84858c2bf9da745"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.13/qurry-cli_0.2.13_x86_64-apple-darwin.tar.gz"
      sha256 "8ee3797230d4f2973a92a20f92df11e50d98f14cb762a3e8344f4ccdcc6fbb68"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.13/qurry-cli_0.2.13_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df805488100077daa90df33c79371c6f2c27777e1af813312e83ffe59411080e"
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
