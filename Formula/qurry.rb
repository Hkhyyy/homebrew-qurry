class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.3/qurry-cli_0.2.3_aarch64-apple-darwin.tar.gz"
      sha256 "95972d16a2dbed8f2325d9dd6e8507f187c72e705c82e238e1076d03e21cc296"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.3/qurry-cli_0.2.3_x86_64-apple-darwin.tar.gz"
      sha256 "25e5943feff84cc0618f442f624588e33a22047df10e064e347b3c6a9d486f4b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.3/qurry-cli_0.2.3_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9964a7738a062c41743c9fb67ad7e9cf13eeb989eb0ffaf3f51f898c2d98af7"
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
