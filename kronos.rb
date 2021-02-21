class Kronos < Formula
  desc "Cross-platform job scheduler for cronjobs"
  homepage "https://github.com/taciomcosta/kronos"
  url "https://github.com/taciomcosta/kronos/releases/download/0.1.0/kronos-0.1.0-darwin_amd64.tar.gz"
  sha256 "3fd0e9a19a00aef2390d132605b154b5af98dd99a80523adffcf30e15c5c4742"
  license "MIT"
  bottle :unneeded

  def install
    bin.install "kronosd"
    bin.install "kronos"
    prefix.install "com.taciomcosta.kronos.plist"
  end

  def caveats
    system "sudo mkdir -p /etc/kronos"
    system "sudo mkdir -p /var/lib/kronos"
    system "sudo cp #{prefix}/com.taciomcosta.kronos.plist /Library/LaunchDaemons/com.taciomcosta.kronos.plist"
    system "sudo launchctl load /Library/LaunchDaemons/com.taciomcosta.kronos.plist"
  end
end
