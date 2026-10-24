cask "fennec" do
  version "0.0.7"
  sha256 "e380ebfb844a66e50333cda16cbdc0fa96d38162a2e6955e1bbb8f91d86545fb"

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
