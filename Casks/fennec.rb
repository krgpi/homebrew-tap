cask "fennec" do
  version "1.0.0"
  sha256 "f091ebc527709c79436e3c96034a66c1f45c4e58eecba4329154bc0ab8c8edd3"

  url "https://github.com/krgpi/fennec/releases/download/v#{version}/Fennec.zip"
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
