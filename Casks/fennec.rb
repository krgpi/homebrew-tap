cask "fennec" do
  version "0.0.1"
  sha256 "cbe3afc1eeba1b00d4b9b8926147794de98de8d42156ac429c434a6f72e847a2"

  url "https://github.com/krgpi/fennec/releases/download/v#{version}/Fennec_#{version}_arm64.zip"
  name "Fennec"
  desc "Local transcription & AI meeting notes for macOS"
  homepage "https://github.com/krgpi/fennec"

  depends_on macos: ">= :tahoe"

  app "Fennec.app"
  binary "#{appdir}/Fennec.app/Contents/MacOS/fennec"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Fennec.app"]
  end

  zap trash: [
    "~/Library/Application Support/io.github.krgpi.Fennec",
    "~/Library/Preferences/io.github.krgpi.Fennec.plist",
    "~/Library/Caches/io.github.krgpi.Fennec",
  ]

  caveats <<~EOS
    This app is not signed.
    You may need to allow it in System Settings > Privacy & Security.
  EOS
end
