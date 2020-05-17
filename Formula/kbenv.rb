class Kbenv < Formula
  desc "Kubectl version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.0.3.tar.gz"
  sha256 "869b1a710a38a7fb11f52a58511fb4535dcb60911f92752b350cd49ac37b6adf"

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
