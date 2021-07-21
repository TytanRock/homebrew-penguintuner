class Penguintuner < Formula
  desc "GUI application to interact with CTRE CAN devices"
  homepage "https://penguintuner.tytan.rocks"
  url "https://github.com/TytanRock/PenguinTuner/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "dfa636173ad3a0f3ad1fe6c4aaa1b9c2a4fec926c24aee80fe407a9124a990e4"
  license "BSD-3-Clause"
  head "https://github.com/TytanRock/PenguinTuner.git"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "python3" => :build
  depends_on "cmake"
  depends_on "curl"
  depends_on "gtk+3"
  depends_on "libssh"
  depends_on "pkg-config"

  def install
    # Make the build directory
    mkdir "build"

    # Determine if Mac or Linux
    operating_system = `uname -s`

    puts operating_system
    puts RUBY_PLATFORM
    # Default arch to uknown
    arch = "unknown"
    case operating_system
    when "Darwin"
      # If OS is Mac, set arch to macos
      arch = "macos"
    when "Linux"
      # Otherwise, use dpkg to determine architecture
      arch = `dpkg --print-architecture`
    end
    # Setup meson build
    system "meson", "-Darchitecture=#{arch}", "build"
    cd "build" do
      system "ninja", "install"
    end
  end
end
