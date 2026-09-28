# Homebrew Formula for Kelora
# This file is automatically updated by the release workflow
# Do not edit manually - changes will be overwritten

class Kelora < Formula
  desc "Command-line log analysis tool with embedded Rhai scripting"
  homepage "https://github.com/dloss/kelora"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dloss/kelora/releases/download/v2.1.0/kelora-aarch64-apple-darwin.tar.gz"
      sha256 "99e7fe2d474b223db4ac71fc08b73eb5ded5717642de131ab23be70161001c1b"
    else
      url "https://github.com/dloss/kelora/releases/download/v2.1.0/kelora-x86_64-apple-darwin.tar.gz"
      sha256 "77d207704e20ae5d3719d3eeda0128cefb6858ee0bf003cff9c6ede633a526b2"
    end
  end

  def install
    bin.install "kelora"
  end

  test do
    # Test basic functionality
    assert_match "kelora 2.1.0", shell_output("#{bin}/kelora --version")

    # Test help output
    assert_match "Command-line log analysis", shell_output("#{bin}/kelora -h")

    # Test with a simple echo pipe
    output = pipe_output("#{bin}/kelora -f json --filter 'true'", '{"level":"info","msg":"test"}')
    assert_match "test", output
  end
end
