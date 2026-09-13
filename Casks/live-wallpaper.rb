cask "live-wallpaper" do
  version "1.1.0"
  sha256 "1a37fc9e9ca7b303328e2b9719096a3cbaf39766652943f018723e22d6800a22"

  url "https://github.com/carlosxfelipe/live-wallpaper/releases/download/v#{version}/LiveWallpaper-1.1-6.dmg"
  name "LiveWallpaper"
  desc "Lightweight, native macOS menu bar app to set custom gradients and looping videos as your desktop wallpaper"
  homepage "https://github.com/carlosxfelipe/live-wallpaper"

  app "LiveWallpaper.app"

  postflight_steps do
    # Removes the quarantine attribute before moving to Applications
    run "/usr/bin/xattr",
        args:         ["-cr", "/Applications/LiveWallpaper.app"],
        must_succeed: false
  end
end
