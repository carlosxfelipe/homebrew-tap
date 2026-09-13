cask "mov2gif" do
  version "1.1.0"
  sha256 "ed6c5f3da3fa81387bcabb89befcb2d63b9a0f323c66f311bf8cbd7ac6804833"

  url "https://github.com/carlosxfelipe/Mov2Gif/releases/download/v#{version}/Mov2Gif-1.1-2.dmg"
  name "Mov2Gif"
  desc "Native macOS application to convert .mov videos into .gif animated images"
  homepage "https://github.com/carlosxfelipe/Mov2Gif"

  depends_on macos: :monterey

  app "Mov2Gif.app"

  postflight_steps do
    # Removes the quarantine attribute so macOS doesn't block the unsigned/unnotarized app if not from App Store
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Mov2Gif.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Scripts/com.carlosaraujo.Mov2Gif",
    "~/Library/Containers/com.carlosaraujo.Mov2Gif",
  ]
end
