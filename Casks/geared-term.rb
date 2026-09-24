cask "geared-term" do
  version "0.1.1-beta.23"
  # The nightly release replaces this artifact in place, so the release pipeline bumps the checksum
  # together with the version.
  sha256 "28c29e6bf342e11e2e27f72eec9330aa829f3cdf14ebb1471189484b66065410"

  url "https://github.com/lihaozhe013/geared-term/releases/download/nightly/geared-term-macos-arm64.dmg"
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
