cask "video-downloader" do
  version "1.1.0"
  sha256 "48625d90732fdaeab344c2146fe3ad489619881a8da22ad60abddeea4a0bdc71"

  url "https://github.com/carlosxfelipe/video-downloader/releases/download/v#{version}/VideoDownloader-1.1-2.dmg"
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
