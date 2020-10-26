class Kbenv < Formula
  desc "Kubectl version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.2.5.tar.gz"
  sha256 "90de0b88585f11f6e136346c12d65e5e3a8ce175ea992b522a4e54f4fea3a358"

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
