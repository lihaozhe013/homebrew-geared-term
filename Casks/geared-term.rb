cask "geared-term" do
  version "0.1.1-beta.31"
  # Rendered by the geared-term nightly workflow; the URL pins the immutable versioned DMG so the
  # checksum cannot drift while the rolling release is replaced.
  sha256 "e092fd50f8edcd97072a925ed8a2b0c2cb19683b747708210d2ebd8171dfdd6e"

  url "https://github.com/lihaozhe013/geared-term/releases/download/nightly/geared-term-mac-arm64-#{version}.dmg"
  name "Geared Term"
  desc "Secure terminal workspace with local PTY, SSH, SFTP, and an AI assistant"
  homepage "https://github.com/lihaozhe013/geared-term"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Geared Term.app"

  zap trash: [
    "~/Library/Application Support/Geared Term",
    "~/Library/Caches/dev.gearedterm.desktop",
    "~/Library/HTTPStorages/dev.gearedterm.desktop",
    "~/Library/Preferences/dev.gearedterm.desktop.plist",
    "~/Library/Saved Application State/dev.gearedterm.desktop.savedState",
  ]

  caveats <<~EOS
    Nightly builds are unsigned development artifacts. On first launch macOS reports that Apple
    cannot check the app for malicious software; allow it once in System Settings -> Privacy &
    Security -> Open Anyway. The ad-hoc signature changes with every build, so macOS may ask
    again after each upgrade.
  EOS
end
