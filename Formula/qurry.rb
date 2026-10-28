class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.6/qurry-cli_0.2.6_aarch64-apple-darwin.tar.gz"
      sha256 "e7929205819b9eace090be968be927c11fd3a8db9fdee2d858becba1e165f8f4"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.6/qurry-cli_0.2.6_x86_64-apple-darwin.tar.gz"
      sha256 "07568ad8c27daf5578cb9ecad4363c573aabae9426d47fa458f3128d4150a0c6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.6/qurry-cli_0.2.6_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d33873285532231aeb36a8a40dd164d88849de1421cbe390f78e1ae33e23c459"
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
