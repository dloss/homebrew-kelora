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
      sha256 "9305ba295cd807331487f0d87d99ad191b96f98d7ccfd64628e1bfa7cb757358"
    else
      url "https://github.com/dloss/kelora/releases/download/v2.0.1/kelora-x86_64-apple-darwin.tar.gz"
      sha256 "3efc3f32cb91ba21fe096232d2c7104b37e3ec3acb098c9d21f327d889beceb0"
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
