# Homebrew Formula for Kelora
# This file is automatically updated by the release workflow
# Do not edit manually - changes will be overwritten

class Kelora < Formula
  desc "Command-line log analysis tool with embedded Rhai scripting"
  homepage "https://github.com/dloss/kelora"
  version "2.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dloss/kelora/releases/download/v2.1.1/kelora-aarch64-apple-darwin.tar.gz"
      sha256 "9765c8439f592f8f5ffea3421135f1b312da780b997898618a2aee6eff59dfd5"
    else
      url "https://github.com/dloss/kelora/releases/download/v2.1.1/kelora-x86_64-apple-darwin.tar.gz"
      sha256 "5169aa7c157b7dbea8a029794ce878189e2cd495ba4f3f4d63c2b397fa6b2260"
    end
  end

  def install
    bin.install "kelora"
  end

  test do
    # Test basic functionality
    assert_match "kelora 2.1.1", shell_output("#{bin}/kelora --version")

    # Test help output
    assert_match "Command-line log analysis", shell_output("#{bin}/kelora -h")

    # Test with a simple echo pipe
    output = pipe_output("#{bin}/kelora -f json --filter 'true'", '{"level":"info","msg":"test"}')
    assert_match "test", output
  end
end
