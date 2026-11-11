class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.3/qurry-cli_0.3.3_aarch64-apple-darwin.tar.gz"
      sha256 "5005f5f9ec109ea8011105ce9351f52b963f63be60966e736c1ca3ceeb1adf36"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.3/qurry-cli_0.3.3_x86_64-apple-darwin.tar.gz"
      sha256 "b4df491b8adffa7953402cc0d5429a475cb4bb0b31f9490a7438c8336f5bf4bd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.3/qurry-cli_0.3.3_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "764789ad69f296589dbcd502e56057af3e140732da4aac0da30795796b80c18e"
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
