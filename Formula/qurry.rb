class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.1.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.19/qurry-cli_0.1.19_aarch64-apple-darwin.tar.gz"
      sha256 "384ababafc5bc31d2f2fcdfdb9807e6a75d1d47a9d8771d593d8d3c890e5d710"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.19/qurry-cli_0.1.19_x86_64-apple-darwin.tar.gz"
      sha256 "f6c8474d942f7610e4850c216cca70fa381ba7e6e75b90e3e208dc714af1e33f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.19/qurry-cli_0.1.19_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "452da3a3a1cce0d9b263c1372d6cca5b7ec1aeb823fb74c7746a2e34954b964b"
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
