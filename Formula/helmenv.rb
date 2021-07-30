class Helmenv < Formula
  desc "Helm version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.3.1.tar.gz"
  sha256 "2515c1f34a351a8b5275d7e6126365cb79546b907adb567fb2a29f4b796b27ce"

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
