class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.1.22"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.22/qurry-cli_0.1.22_aarch64-apple-darwin.tar.gz"
      sha256 "9918702a4114077ff222f7e332e022e7ce44301ebca6fd8a0f9908691edf1dc2"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.22/qurry-cli_0.1.22_x86_64-apple-darwin.tar.gz"
      sha256 "be8275d16e2fdbc2935f5817cc3cc31e21d25bd8f4f331d18f6af0b7fced12ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.22/qurry-cli_0.1.22_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "030cd0702f7b2a04cb32a797bffd68a0f1345d2a0097ee8e86cc08cf21b24b0c"
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
