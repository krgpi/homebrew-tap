cask "fennec" do
  version "0.0.6"
  sha256 "f049d96ed89b3cbe6621c68dafed2aa8581228979a9f67e4dafdbcbff6e409da"

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
