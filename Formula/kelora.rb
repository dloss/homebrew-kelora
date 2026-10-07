# Homebrew Formula for Kelora
# This file is automatically updated by the release workflow
# Do not edit manually - changes will be overwritten

class Kelora < Formula
  desc "Command-line log analysis tool with embedded Rhai scripting"
  homepage "https://github.com/dloss/kelora"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dloss/kelora/releases/download/v2.2.0/kelora-aarch64-apple-darwin.tar.gz"
      sha256 "47ef5e926c9aa1631a331cdc5a8b0994a7edf51ce08175a3bfc4626bff1d43f2"
    else
      url "https://github.com/dloss/kelora/releases/download/v2.2.0/kelora-x86_64-apple-darwin.tar.gz"
      sha256 "272666e4ee3107aeadca948bf9b105cae68a5016d12bded36696ad5516901cc6"
    end
  end

  def install
    bin.install "kelora"
  end

  test do
    # Test basic functionality
    assert_match "kelora 2.2.0", shell_output("#{bin}/kelora --version")

    # Test help output
    assert_match "Command-line log analysis", shell_output("#{bin}/kelora -h")

    # Test with a simple echo pipe
    output = pipe_output("#{bin}/kelora -f json --filter 'true'", '{"level":"info","msg":"test"}')
    assert_match "test", output
  end
end
