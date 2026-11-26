class Vlab < Formula
  desc "Vlab — zero-dependency portfolio backtesting lab with a look-ahead guard and out-of-sample validity checks"
  homepage "https://github.com/aazh2026/vlab"
  url "https://github.com/aazh2026/vlab/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "62ce32d6c3ee9357480f42ed531870213edb8a0eb16c1397842ce6535341a494"
  license "MIT"
  version "1.1.0"

  depends_on "python@3.12"

  def install
    # src-layout package: install the `vlab` package itself into libexec so
    # the CLI wrapper can put libexec on PYTHONPATH. No build step, no deps.
    libexec.install Dir["src/vlab"]

    (bin/"vlab").write <<~SH
      #!/bin/sh
      PYTHONPATH="#{libexec}" exec "#{Formula["python@3.12"].opt_bin}/python3" -m vlab "$@"
    SH
  end

  test do
    assert_match "vlab", shell_output("#{bin}/vlab --help")
    assert_match "validate", shell_output("#{bin}/vlab --help")
  end
end
