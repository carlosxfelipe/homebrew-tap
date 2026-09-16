cask "video-downloader" do
  version "1.0.1"
  sha256 "a41121a53294d33b5d5db032428b9e385bf9b0dae676eb7ce5617f132bc987b8"

  url "https://github.com/carlosxfelipe/video-downloader/releases/download/v#{version}/VideoDownloader-1.0-1.dmg"
  name "VideoDownloader"
  desc "Native macOS GUI for yt-dlp to download videos and audio from YouTube and hundreds of other sites"
  homepage "https://github.com/carlosxfelipe/video-downloader"

  app "VideoDownloader.app"

  postflight_steps do
    # Removes the quarantine attribute before moving to Applications
    run "/usr/bin/xattr",
        args:         ["-cr", "/Applications/VideoDownloader.app"],
        must_succeed: false
  end
end
