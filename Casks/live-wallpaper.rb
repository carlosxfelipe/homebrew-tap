cask "live-wallpaper" do
  version "1.0.2"
  sha256 "e9657f14039020df488dc2729afcc32f1f0116b7858432338321d4ecfd8767e7"

  url "https://github.com/carlosxfelipe/live-wallpaper/releases/download/v#{version}/LiveWallpaper-#{version}-5.dmg"
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
