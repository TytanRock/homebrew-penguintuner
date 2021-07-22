class Penguintuner < Formula
  desc "GUI application to interact with CTRE CAN devices"
  homepage "https://penguintuner.tytan.rocks"
  url "https://github.com/TytanRock/PenguinTuner/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "2b2d9212c358bb40945d6911d3f079cbea04a4f267e191d379b42c6086386d9e"
  license "BSD-3-Clause"
  head "https://github.com/TytanRock/PenguinTuner.git"

  depends_on "gcc@9" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "python3" => :build
  depends_on "cmake"
  depends_on "curl"
  depends_on "gtk+3"
  depends_on "libssh"
  depends_on "pkg-config"

  def install
    # Determine if Mac or Linux
    os = `uname -s`
    arch = case os
    when /Darwin$/
      # If OS is Mac, set arch to macos
      "macos"
    when /Linux$/
      # If Linux, use dpkg to determine architecture
      `dpkg --print-architecture`.strip
    else
      # Otherwise we don't know
      odie "Couldn't determine architecture"
    end
    ohai "Architecture is #{arch}"

    ENV["HOMEBREW_CC"] = "gcc-9"
    ENV["CC"] = "gcc-9"

    # Make the build directory
    mkdir "build"
    # Setup meson build
    system "meson", "-Darchitecture=#{arch}", "-Dprefix=#{prefix}", "build"
    cd "build" do
      system "ninja", "install"
    end
  end
end
