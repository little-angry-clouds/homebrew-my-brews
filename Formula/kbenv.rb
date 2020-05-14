class Kbenv < Formula
  desc "Kubectl version manager inspired by tfenv"
  homepage "https://github.com/little-angry-clouds/kubernetes-binaries-managers/"
  url "https://github.com/little-angry-clouds/kubernetes-binaries-managers/archive/0.0.2.tar.gz"
  sha256 "92aec08db4dc05c745094b382313025624f843cabc4eb680873bf2fa610727c3"

  depends_on "go" => :build

  def install
    ENV.prepend "CGO_ENABLED", "0"
    system "go", "build", "-a", "-o", "kbenv.bin", "kbenv/main.go"
    bin.install "kbenv.bin" => "#{bin}/kbenv"
  end

  test do
    system "#{bin}/kbenv", "--help"
  end
end
