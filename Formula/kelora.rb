# Homebrew Formula for Kelora
# This file is automatically updated by the release workflow
# Do not edit manually - changes will be overwritten

class Kelora < Formula
  desc "Command-line log analysis tool with embedded Rhai scripting"
  homepage "https://github.com/dloss/kelora"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dloss/kelora/releases/download/v1.5.0/kelora-aarch64-apple-darwin.tar.gz"
      sha256 "b4a3d1fd25c4d196501d5c41e617f5f453208257840f02923b32e584d08fd157"
    else
      url "https://github.com/dloss/kelora/releases/download/v1.5.0/kelora-x86_64-apple-darwin.tar.gz"
      sha256 "f456f9aabeb3c4270f6c28aef4adec015b45f725d414b124c61277ebfc25d101"
    end
  end

  def install
    bin.install "kelora"
  end

  test do
    # Test basic functionality
    assert_match "kelora 1.5.0", shell_output("#{bin}/kelora --version")

    # Test help output
    assert_match "Command-line log analysis", shell_output("#{bin}/kelora -h")

    # Test with a simple echo pipe
    output = pipe_output("#{bin}/kelora -f json --filter 'true'", '{"level":"info","msg":"test"}')
    assert_match "test", output
  end
end
