cask "deskstick" do
  version "1.0.8"
  sha256 "8485bcf996d8c45593fdcafa2be7a1c719ad941818d5b7adf0fbb30a43957adf"

  url "https://github.com/krgpi/releases/releases/download/deskstick-v#{version}/DeskStick-#{version}.zip"
  name "DeskStick"
  desc "Sticky notes that sync through iCloud"
  homepage "https://krgpi.github.io/works/deskstick/"

  depends_on macos: :ventura

  app "DeskStick.app"

  zap trash: [
    "~/Library/Application Scripts/com.krgpi.stickies",
    "~/Library/Containers/com.krgpi.stickies",
  ]

  caveats <<~EOS
    DeskStick is also published on the Mac App Store. Do not run both:
    they share the bundle identifier com.krgpi.stickies and both install
    to /Applications/DeskStick.app.

    Notes live in iCloud, so switching between the two keeps your data.
  EOS
end
