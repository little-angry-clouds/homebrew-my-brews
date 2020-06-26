class Kbenv < Formula
  desc "Kubectl version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.2.0.tar.gz"
  sha256 "2712b58f08dc8d0445038f2dfc6232831eb518eacf18b73aca3ad38d7f0b6daf"

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
