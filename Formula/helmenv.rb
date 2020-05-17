class Helmenv < Formula
  desc "Helm version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.0.4.tar.gz"
  sha256 "62657bdce007b4b6a4f5c4b1055b79fcb53bcb982c8b3cd199dbd27961eeff61"

  depends_on "go" => :build

  def install
    ENV.prepend "CGO_ENABLED", "0"
    system "go", "build", "-a", "-o", "helmenv.bin", "cmd/helmenv/main.go"
    bin.install "helmenv.bin" => "#{bin}/helmenv"
    system "go", "build", "-a", "-o", "helm.bin", "cmd/helm-wrapper/main.go"
    bin.install "helm.bin" => "#{bin}/helm"
  end

  test do
    system "#{bin}/helmenv", "--help"
  end
end
