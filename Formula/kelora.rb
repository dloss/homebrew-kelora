# Homebrew Formula for Kelora
# This file is automatically updated by the release workflow
# Do not edit manually - changes will be overwritten

class Kelora < Formula
  desc "Command-line log analysis tool with embedded Rhai scripting"
  homepage "https://github.com/dloss/kelora"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dloss/kelora/releases/download/v2.0.1/kelora-aarch64-apple-darwin.tar.gz"
      sha256 "d6336e778a1725004037f62332eb2dd4caa1061d6fbd7935d03433c08e4ebf97"
    else
      url "https://github.com/dloss/kelora/releases/download/v2.0.1/kelora-x86_64-apple-darwin.tar.gz"
      sha256 "7cfd5b906e27e71d884214e9ebd91a23c0a949b2cb95d3ed35173bc690956203"
    end
  end

  def install
    bin.install "kelora"
  end

  test do
    # Test basic functionality
    assert_match "kelora 2.0.1", shell_output("#{bin}/kelora --version")

    # Test help output
    assert_match "Command-line log analysis", shell_output("#{bin}/kelora -h")

    # Test with a simple echo pipe
    output = pipe_output("#{bin}/kelora -f json --filter 'true'", '{"level":"info","msg":"test"}')
    assert_match "test", output
  end
end
