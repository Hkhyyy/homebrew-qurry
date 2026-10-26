class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.1.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.23/qurry-cli_0.1.23_aarch64-apple-darwin.tar.gz"
      sha256 "4815bac58bebbe4d3733258d6861a4775965a8bf26a655217223b971fe2f2f91"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.23/qurry-cli_0.1.23_x86_64-apple-darwin.tar.gz"
      sha256 "95d234c96271cfcc50dabd93f79e6204a282ec862222a29fbedfd36a800cd34e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.1.23/qurry-cli_0.1.23_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f18eb83b0e083c16ef4bca5a60f479456f30ef861d300496feb162bddf0e8f7"
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
