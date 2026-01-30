class Ptop < Formula
  desc "Network latency monitor with terminal UI - htop for ping"
  homepage "https://github.com/freeeve/ptop"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/freeeve/ptop/releases/download/v0.1.3/ptop-macos-aarch64.tar.gz"
      sha256 "419b5362e6f4cfefdcfa6e7847094bfc3108f47cfe728d15e8555c70c0d4b04c"
    end
    on_intel do
      url "https://github.com/freeeve/ptop/releases/download/v#{version}/ptop-macos-x86_64.tar.gz"
      sha256 "23bc232919ce6ef8ae8a3da2c78c916b0fb883c2b6effd20498d7f3ab06672ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/freeeve/ptop/releases/download/v#{version}/ptop-linux-x86_64.tar.gz"
      sha256 "69e4f48c668d369185a471086082150e2fc22e721792d3220c6821288262d0b8"
    end
  end

  def install
    bin.install "ptop"
  end

  def caveats
    <<~EOS
      ptop requires elevated privileges to send ICMP packets.
      Run with sudo:
        sudo ptop

      Or on Linux, set capabilities:
        sudo setcap cap_net_raw=ep #{bin}/ptop
    EOS
  end

  test do
    assert_match "ptop #{version}", shell_output("#{bin}/ptop --version")
  end
end
