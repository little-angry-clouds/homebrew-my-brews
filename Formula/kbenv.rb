class Kbenv < Formula
  desc "Kubectl version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.2.1.tar.gz"
  sha256 "993b931d1fb6a294b711b1785e822ca980362d9bfde07e51b5ea883bf7e856b9"

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
