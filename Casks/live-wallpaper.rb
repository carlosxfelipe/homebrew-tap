cask "live-wallpaper" do
  version "1.0.1"
  sha256 "f84798a7566071303545b7d48ba3dd60a969f2a40679444e74473c08622f71fe"

  url "https://github.com/carlosxfelipe/live-wallpaper/releases/download/v#{version}/LiveWallpaper-#{version}-4.dmg"
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
