class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.7/qurry-cli_0.2.7_aarch64-apple-darwin.tar.gz"
      sha256 "4ed6a8e3144797e573745106046504973f0e23a96de6066e09a1678b5476b3af"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.7/qurry-cli_0.2.7_x86_64-apple-darwin.tar.gz"
      sha256 "cbb278942d887719381ab20f7fba813ae8d4212710717d0ca3a53472ecfa9e37"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.7/qurry-cli_0.2.7_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d2a222d53bb53b941445b7f8bda44f79fe60687883783bb491b464e2b3de8d2"
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
