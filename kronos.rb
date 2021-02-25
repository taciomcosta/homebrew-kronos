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
    system "mkdir -p /etc/kronos"
    system "mkdir -p /var/lib/kronos"
  end

  plist_options manual: "kronosd"

  def plist
    <<~EOS
      <?xml version='1.0' encoding='UTF-8'?>
      <!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\" >
      <plist version='1.0'>
        <dict>
          <key>Label</key><string>#{plist_name}</string>
          <key>Program</key><string>#{opt_bin}/kronosd</string>
          <key>RunAtLoad</key><true/>
        </dict>
      </plist>
    EOS
  end
end
