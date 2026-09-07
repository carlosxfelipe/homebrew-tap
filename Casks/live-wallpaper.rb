cask "live-wallpaper" do
  version "1.0.0"
  sha256 "77917f7bda3b34dd66c89d94b39145e0666aae2fe64aafc80c28d06279f6a9bf"

  url "https://github.com/carlosxfelipe/live-wallpaper/releases/download/v#{version}/LiveWallpaper-1.0-1.dmg"
  name "LiveWallpaper"
  desc "Lightweight, native macOS menu bar app to set custom gradients and looping videos as your desktop wallpaper"
  homepage "https://github.com/carlosxfelipe/live-wallpaper"

  app "LiveWallpaper.app"

  postflight do
    # Removes the quarantine attribute so macOS doesn't block the unsigned/unnotarized app if not from App Store
    system_command "/usr/bin/xattr",
                   args: ["-cr", "/Applications/LiveWallpaper.app"],
                   sudo: false
  end
end
