class Ocenv < Formula
  desc "Helm version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.3.1.tar.gz"
  sha256 "2515c1f34a351a8b5275d7e6126365cb79546b907adb567fb2a29f4b796b27ce"

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
