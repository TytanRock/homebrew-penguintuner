class PenguinTuner < Formula
  desc "A GUI application to interact with CTRE CAN devices"
  homepage "https://penguintuner.tytan.rocks"
  head "https://github.com/TytanRock/PenguinTuner.git"
  url "https://github.com/TytanRock/PenguinTuner/archive/refs/tags/v0.4.3.tar.gz"
  sha256 ""
  license "BSD-3-Clause License"
  
  depends_on "pkg-config"
  depends_on "cmake"
  depends_on "python3"
  depends_on "curl"
  depends_on "libssh"
  depends_on "gtk+3"

  def install
    system "./configure.sh"
    system "./build.sh", "install"
  end
end

