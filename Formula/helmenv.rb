class Helmenv < Formula
  desc "Helm version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.2.5.tar.gz"
  sha256 "89fc3cbd2e51245bac87302bbedc6c81864df961ae25ca45d41f2ec65930b16d"

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
