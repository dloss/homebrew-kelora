# Homebrew Formula for Kelora
# This file is automatically updated by the release workflow
# Do not edit manually - changes will be overwritten

class Kelora < Formula
  desc "Command-line log analysis tool with embedded Rhai scripting"
  homepage "https://github.com/dloss/kelora"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dloss/kelora/releases/download/v2.0.0/kelora-aarch64-apple-darwin.tar.gz"
      sha256 "cd34f01c680f4c0114d034d946309f2816730629cae0cbf64aab603a69871620"
    else
      url "https://github.com/dloss/kelora/releases/download/v2.0.0/kelora-x86_64-apple-darwin.tar.gz"
      sha256 "a0836fde6a32d5e3219524a0277f11c53c50bb6f56769b575907ac139a5b4c7e"
    end
  end

  def install
    bin.install "kelora"
  end

  test do
    # Test basic functionality
    assert_match "kelora 2.0.0", shell_output("#{bin}/kelora --version")

    # Test help output
    assert_match "Command-line log analysis", shell_output("#{bin}/kelora -h")

    # Test with a simple echo pipe
    output = pipe_output("#{bin}/kelora -f json --filter 'true'", '{"level":"info","msg":"test"}')
    assert_match "test", output
  end
end
