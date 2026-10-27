class Qurry < Formula
  desc "Free DataGrip alternative: terminal UI and MCP server for PostgreSQL, MySQL and Redis"
  homepage "https://github.com/Hkhyyy/qurry"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.1/qurry-cli_0.2.1_aarch64-apple-darwin.tar.gz"
      sha256 "b21e6b580d6489e33a43e6ef2574b5cd0c41826b3456f04623bc9b374b24bdf5"
    end
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.1/qurry-cli_0.2.1_x86_64-apple-darwin.tar.gz"
      sha256 "0c5b9c97ab2fefb458bae78df270f2481d4f9b3f67952526b11b1bc2671f40db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hkhyyy/qurry/releases/download/v0.2.1/qurry-cli_0.2.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "839b3330e459451baa3be504641bc732c58c5be5ca33308ab4d070a84b5e9548"
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
