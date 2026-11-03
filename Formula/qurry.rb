class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.14/qurry-cli_0.2.14_aarch64-apple-darwin.tar.gz"
      sha256 "26030225a125d725b46f02ac50c00ffacf6ee22c048d6a79585c2bb5fcc3b695"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.14/qurry-cli_0.2.14_x86_64-apple-darwin.tar.gz"
      sha256 "fd594babe02535884471e5515cc5e99a799b5449777ce6e2cd193175f641bc0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.14/qurry-cli_0.2.14_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c80431930485d79dc6a235ec79546f4b5847f3ced6d90455e1a9cc91be957b9"
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
