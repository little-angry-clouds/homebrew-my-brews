class Ocenv < Formula
  desc "Helm version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.3.0.tar.gz"
  sha256 "75dd0942d0f50042274afa7c2df3c2341954cc1c2b4017200ed31f9c27ecc6db"

  depends_on "go" => :build

  def install
    ENV.prepend "CGO_ENABLED", "0"
    system "go", "build", "-a", "-o", "ocenv.bin", "cmd/ocenv/main.go"
    bin.install "ocenv.bin" => "#{bin}/ocenv"
    system "go", "build", "-a", "-o", "oc.bin", "cmd/oc-wrapper/main.go"
    bin.install "oc.bin" => "#{bin}/oc"
  end

  test do
    system "#{bin}/ocenv", "--help"
  end
end
