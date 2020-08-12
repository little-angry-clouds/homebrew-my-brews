class Kbenv < Formula
  desc "Kubectl version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.2.3.tar.gz"
  sha256 "502ba9aee5dc4fd5464f63c5414c0b1b55208f66cfcf61024881859aad22e5fa"

  depends_on "go" => :build

  def install
    ENV.prepend "CGO_ENABLED", "0"
    system "go", "build", "-a", "-o", "kbenv.bin", "cmd/kbenv/main.go"
    bin.install "kbenv.bin" => "#{bin}/kbenv"
    system "go", "build", "-a", "-o", "kubectl.bin", "cmd/kubectl-wrapper/main.go"
    bin.install "kubectl.bin" => "#{bin}/kubectl"
  end

  test do
    system "#{bin}/kbenv", "--help"
  end
end
