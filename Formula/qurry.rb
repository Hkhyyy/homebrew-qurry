class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.2/qurry-cli_0.3.2_aarch64-apple-darwin.tar.gz"
      sha256 "0c13e1f40512de276ec452b2af4b9c8f768e3b73ef8897e68bc5241651fe4197"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.2/qurry-cli_0.3.2_x86_64-apple-darwin.tar.gz"
      sha256 "27d759406352dea542515c15a768b39c368543bde0758677bf437fe6c568d3aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.2/qurry-cli_0.3.2_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12ee4761359d07967cce387219e9d885fa04065e874639342eebadb93256d41d"
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
