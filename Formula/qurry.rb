class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.1.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.21/qurry-cli_0.1.21_aarch64-apple-darwin.tar.gz"
      sha256 "e3fdbcd0b8bf641ab015ac160e9779f584d2a2cca5371bc10f1e2106e0ca45df"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.21/qurry-cli_0.1.21_x86_64-apple-darwin.tar.gz"
      sha256 "1df4c4d15f3b68853a6cb14b0d257ad115797eef9b9f5479c018ef44b93e382a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.21/qurry-cli_0.1.21_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3042de1df6bd35669a898295fd2d665381acf80ba373d4f4e287b12adbf4a92"
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
