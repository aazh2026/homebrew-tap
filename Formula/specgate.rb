class Specgate < Formula
  desc "Requirement coverage for your codebase — like test coverage, but for acceptance criteria"
  homepage "https://github.com/aazh2026/specgate"
  url "https://github.com/aazh2026/specgate/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "2af989a20a2325136a6cad29eb09c9acfaf03738f6e2d86179d9438b71397bac"
  license "MIT"
  version "0.1.1"

  depends_on "node"

  def install
    # Preserve the repository layout so the CLI can resolve package.json
    # relative to both bin/ and src/.
    prefix.install Dir["bin", "src", "assets", "package.json"]

    # The upstream entry point is bin/specgate.js; expose it as `specgate`.
    (bin/"specgate").write <<~SH
      #!/bin/sh
      exec "#{libexec}/bin/specgate.js" "$@"
    SH
  end

  test do
    assert_match "specgate", shell_output("#{bin}/specgate --help")
    assert_match "0.1.1", shell_output("#{bin}/specgate --version")
  end
end
