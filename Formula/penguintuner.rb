class Penguintuner < Formula
  desc "GUI application to interact with CTRE CAN devices"
  homepage "https://penguintuner.tytan.rocks"
  url "https://github.com/TytanRock/PenguinTuner/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "2b2d9212c358bb40945d6911d3f079cbea04a4f267e191d379b42c6086386d9e"
  license "BSD-3-Clause"
  head "https://github.com/TytanRock/PenguinTuner.git"

  depends_on "meson" => [:build, "0.53.2"]
  depends_on "ninja" => [:build, "1.10.0"]
  depends_on "python3" => :build
  depends_on "cmake"
  depends_on "curl" => "7.68.0"
  depends_on "gtk+3" => "3.24.20"
  depends_on "libssh" => "0.9.3"
  depends_on "pkg-config" => "0.29.1"

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

    # Make the build directory
    mkdir "build"
    # Setup meson build
    system "meson", "-Darchitecture=#{arch}", "-Dprefix=#{prefix}", "build"
    cd "build" do
      system "ninja", "install"
    end
  end
end
