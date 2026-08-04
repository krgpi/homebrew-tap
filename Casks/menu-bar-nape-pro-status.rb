cask "menu-bar-nape-pro-status" do
  version "1.0.0"
  sha256 :no_check

  url "https://github.com/krgpi/menu-bar-nape-pro-status/releases/download/v#{version}/MenuBarNapeProStatus.zip"
  name "Menu Bar Nape Pro Status"
  desc "macOS menu bar app that displays Keychron Nape Pro trackball status"
  homepage "https://github.com/krgpi/menu-bar-nape-pro-status"

  depends_on macos: :sonoma

  app "Menu Bar Nape Pro Status.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Menu Bar Nape Pro Status.app"]
  end

  zap trash: [
    "~/Library/Preferences/io.github.krgpi.MenuBarNapeProStatus.plist",
  ]

  caveats <<~EOS
    This app is not signed.
    You may need to allow it in System Settings > Privacy & Security.
  EOS
end
