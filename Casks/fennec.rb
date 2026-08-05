cask "fennec" do
  version "0.0.0"
  sha256 "PLACEHOLDER"

  url "https://github.com/krgpi/fennec/releases/download/v#{version}/Fennec.zip"
  name "Fennec"
  desc "Local transcription & AI meeting notes for macOS"
  homepage "https://github.com/krgpi/fennec"

  depends_on macos: ">= :tahoe"

  app "Fennec.app"

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
