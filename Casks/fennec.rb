cask "fennec" do
  version "0.0.3"
  sha256 "0684901ce65248721284851474ac1ac6b85879b90f2d6c9e1dbb618dd5f318ce"

  url "https://github.com/krgpi/fennec/releases/download/v#{version}/Fennec_#{version}_arm64.zip"
  name "Fennec"
  desc "Local transcription and AI meeting notes"
  homepage "https://github.com/krgpi/fennec"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Fennec.app"
  binary "#{appdir}/Fennec.app/Contents/MacOS/fennec"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Fennec.app"]
  end

  zap trash: [
    "~/Library/Application Support/io.github.krgpi.Fennec",
    "~/Library/Caches/io.github.krgpi.Fennec",
    "~/Library/Preferences/io.github.krgpi.Fennec.plist",
  ]

  caveats <<~EOS
    This app is not signed.
    You may need to allow it in System Settings > Privacy & Security.
  EOS
end
