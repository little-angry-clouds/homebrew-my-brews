class Helmenv < Formula
  desc "Helm version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.2.3.tar.gz"
  sha256 "502ba9aee5dc4fd5464f63c5414c0b1b55208f66cfcf61024881859aad22e5fa"

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
