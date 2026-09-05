cask "thunder" do
  version "2.0.1,2.1-2"
  sha256 "d6c7b72a9cf98bec14ee7742f64839c34f88b8cbfb296e6827e551c05dfdbf15"

  # Tratamento dinâmico: o tag é v2.0.1, mas o DMG de release é 2.1-2.
  url "https://github.com/carlosxfelipe/thunder/releases/download/v#{version.csv.first}/Thunder-#{version.csv.second}.dmg"
  name "Thunder"
  desc "File manager written in Swift with SwiftUI"
  homepage "https://github.com/carlosxfelipe/thunder"

  depends_on :macos

  app "Thunder.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Thunder.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Thunder",
    "~/Library/Caches/com.example.thunder",
    "~/Library/Preferences/com.example.thunder.plist",
    "~/Library/Saved Application State/com.example.thunder.savedState",
  ]

  caveats <<~EOS
    #{token} requires Full Disk Access to manage files and directories.
    To grant this permission, go to:
      System Settings > Privacy & Security > Full Disk Access
    and enable #{token}.
  EOS
end
