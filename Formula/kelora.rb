# Homebrew Formula for Kelora
# This file is automatically updated by the release workflow
# Do not edit manually - changes will be overwritten

class Kelora < Formula
  desc "Command-line log analysis tool with embedded Rhai scripting"
  homepage "https://github.com/dloss/kelora"
  version "1.4.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dloss/kelora/releases/download/v1.4.10/kelora-aarch64-apple-darwin.tar.gz"
      sha256 "409018677ce04459f600eb8516acc4de98ae3c2bc55650aca4155d7c5f423e0e"
    else
      url "https://github.com/dloss/kelora/releases/download/v1.4.10/kelora-x86_64-apple-darwin.tar.gz"
      sha256 "0d55367bdbb3df00980244135219ae6b7f6a6a9b952f13a0df128027b42b89e6"
    end
  end

  def install
    bin.install "kelora"
  end

  test do
    # Test basic functionality
    assert_match "kelora 1.4.10", shell_output("#{bin}/kelora --version")

    # Test help output
    assert_match "Command-line log analysis", shell_output("#{bin}/kelora -h")

    # Test with a simple echo pipe
    output = pipe_output("#{bin}/kelora -f json --filter 'true'", '{"level":"info","msg":"test"}')
    assert_match "test", output
  end
end
