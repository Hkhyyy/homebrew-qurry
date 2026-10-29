class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.12/qurry-cli_0.2.12_aarch64-apple-darwin.tar.gz"
      sha256 "4b201a2e52d04a9c0c114549f1083f95baab3bec34dba9afd87b419e2bdc5452"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.12/qurry-cli_0.2.12_x86_64-apple-darwin.tar.gz"
      sha256 "6a4738186b55c920f305ab5c4016cecc9089ea1bdfd801faa2b8eb9f1533fb9b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.12/qurry-cli_0.2.12_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c6e9df48b7aa4445979ac503355e56aa329ed37e73d28b6a39b05843d32ab3f"
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
