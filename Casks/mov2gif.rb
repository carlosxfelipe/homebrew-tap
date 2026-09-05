cask "mov2gif" do
  version "1.0.0"
  sha256 "13309a48f074a2c815e31bf0aa6b95b0132b4c68d229c414e413164fd3514899"

  url "https://github.com/carlosxfelipe/Mov2Gif/releases/download/v#{version}/Mov2Gif-1.0-1.dmg"
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
