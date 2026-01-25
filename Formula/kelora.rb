# Homebrew Formula for Kelora
# This file is automatically updated by the release workflow
# Do not edit manually - changes will be overwritten

class Kelora < Formula
  desc "Command-line log analysis tool with embedded Rhai scripting"
  homepage "https://github.com/dloss/kelora"
  version "1.4.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dloss/kelora/releases/download/v1.4.9/kelora-aarch64-apple-darwin.tar.gz"
      sha256 "4c716b5f6c5a579ab6cfbf477200f6102a7f717249659dbcc4447b1e29716ba9"
    else
      url "https://github.com/dloss/kelora/releases/download/v1.4.9/kelora-x86_64-apple-darwin.tar.gz"
      sha256 "acfd9dde76dec3a90beba0723e5052fd58597ca48839158660929a394bcdb15c"
    end
  end

  def install
    bin.install "kelora"
  end

  test do
    # Test basic functionality
    assert_match "kelora 1.4.9", shell_output("#{bin}/kelora --version")

    # Test help output
    assert_match "Command-line log analysis", shell_output("#{bin}/kelora -h")

    # Test with a simple echo pipe
    output = pipe_output("#{bin}/kelora -f json --filter 'true'", '{"level":"info","msg":"test"}')
    assert_match "test", output
  end
end
