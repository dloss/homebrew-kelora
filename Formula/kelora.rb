# Homebrew Formula for Kelora
# This file is automatically updated by the release workflow
# Do not edit manually - changes will be overwritten

class Kelora < Formula
  desc "Command-line log analysis tool with embedded Rhai scripting"
  homepage "https://github.com/dloss/kelora"
  version "2.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dloss/kelora/releases/download/v2.2.1/kelora-aarch64-apple-darwin.tar.gz"
      sha256 "487e772b1c6ee1eb8212814dda4eaf7ff545ef7d08e70270044a582136aa1569"
    else
      url "https://github.com/dloss/kelora/releases/download/v2.2.1/kelora-x86_64-apple-darwin.tar.gz"
      sha256 "1a048fed53c1d27474a4ef0e63494e1b588135652b4c6c0b86b94ce378f43bd5"
    end
  end

  def install
    bin.install "kelora"
  end

  test do
    # Test basic functionality
    assert_match "kelora 2.2.1", shell_output("#{bin}/kelora --version")

    # Test help output
    assert_match "Command-line log analysis", shell_output("#{bin}/kelora -h")

    # Test with a simple echo pipe
    output = pipe_output("#{bin}/kelora -f json --filter 'true'", '{"level":"info","msg":"test"}')
    assert_match "test", output
  end
end
