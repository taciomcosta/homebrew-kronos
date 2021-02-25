class Kronos < Formula
  desc "Cross-platform job scheduler for cronjobs"
  homepage "https://github.com/taciomcosta/kronos"
  url "https://github.com/taciomcosta/kronos/releases/download/0.1.0/kronos-0.1.0-darwin_amd64.tar.gz"
  sha256 "4df4dbfa6df4aa963ee2a81fa2f73b205beba3d4dbcf59de367db65b8b537e05"
  license "MIT"
  bottle :unneeded

  def install
    bin.install "kronosd"
    bin.install "kronos"
    system "mkdir -p /etc/kronos"
    system "mkdir -p /var/lib/kronos"
    (var/"kronos").mkpath
    (etc/"kronos").mkpath
    print var
  end

  plist_options manual: "kronosd"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>KeepAlive</key> <true/>
        <key>Label</key> <string>#{plist_name}</string>
        <key>Program</key> <string>/usr/local/bin/kronosd</string>
        <key>RunAtLoad</key> <true/>
      </dict>
      </plist>
    EOS
  end
end
