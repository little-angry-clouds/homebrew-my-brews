class Helmenv < Formula
  desc "Helm version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.2.2.tar.gz"
  sha256 "7065c1d50829a5135f67f37b8cdd80699f74da6b01c9f8daf7e96d3fe6ebca1c"

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
