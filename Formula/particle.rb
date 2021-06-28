# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Particle < Formula
  desc "Particle is a project designed to aid in the development and testing of Helm charts and other kubernetes manifests."
  homepage "https://github.com/little-angry-clouds/particle/"
  version "0.0.1"
  license "GPL3"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/little-angry-clouds/homebrew-my-brewsv0.0.1/particle_0.0.1_darwin_amd64.tar.gz"
      sha256 "55dd74d1dbe5b0543db7a5e85f5160dac47055be9aeee83efa4191cae20da608"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/little-angry-clouds/homebrew-my-brewsv0.0.1/particle_0.0.1_linux_amd64.tar.gz"
      sha256 "414159fd6f14caf3525a5699e2607b79c64e20ceb88e72d8a2d534101e7d7f32"
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/little-angry-clouds/homebrew-my-brewsv0.0.1/particle_0.0.1_linux_armv6.tar.gz"
      sha256 "e0f38bf6f225c071a1200ca783946cb208a4f6d54319b96a1a935e92cf3e5430"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/little-angry-clouds/homebrew-my-brewsv0.0.1/particle_0.0.1_linux_arm64.tar.gz"
      sha256 "0022d4c56833cd890524bda54856adb4dcd753b8668283a407cd2fe7f2c681ff"
    end
  end

  depends_on "go"
  depends_on "helm" => :optional
  depends_on "kind" => :optional

  def install
    ENV.prepend "CGO_ENABLED", "0"
    system "go", "build", "-a", "-o", "particle.bin", "main.go"
    bin.install "particle.bin" => "#{bin}/particle"
  end
end
