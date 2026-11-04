class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.0/qurry-cli_0.3.0_aarch64-apple-darwin.tar.gz"
      sha256 "11d40f989cd0842e8673eeada86646e4cb2894ad75cb1cb45d4c33267f6ac48d"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.0/qurry-cli_0.3.0_x86_64-apple-darwin.tar.gz"
      sha256 "3aa25c50601e7bf8b5e7d8dcea26f0b6dd331d66771c28e2ccb15e5b9b390ee3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.3.0/qurry-cli_0.3.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68176d900013b8a2d6c72f09ecea4375ce190fc1a27e832d3d091d9a3ab5207d"
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
