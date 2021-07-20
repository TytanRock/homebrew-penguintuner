class Penguintuner < Formula
  desc "GUI application to interact with CTRE CAN devices"
  homepage "https://penguintuner.tytan.rocks"
  head "https://github.com/TytanRock/PenguinTuner.git"
  url "https://github.com/TytanRock/PenguinTuner/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "dfa636173ad3a0f3ad1fe6c4aaa1b9c2a4fec926c24aee80fe407a9124a990e4"
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

