class Specgate < Formula
  desc "Requirement coverage for your codebase — like test coverage, but for acceptance criteria"
  homepage "https://github.com/aazh2026/specgate"
  url "https://github.com/aazh2026/specgate/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "2af989a20a2325136a6cad29eb09c9acfaf03738f6e2d86179d9438b71397bac"
  license "MIT"
  version "0.1.1"

  depends_on "node"

  def install
    libexec.install Dir["bin/*"]
    libexec.install Dir["src"]
    libexec.install Dir["assets"]
    libexec.install "package.json"
    bin.install_symlink libexec/"bin/specgate"
  end

  test do
    assert_match "specgate", shell_output("#{bin}/specgate --help")
  end
end
