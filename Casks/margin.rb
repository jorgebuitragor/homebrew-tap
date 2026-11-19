cask "margin" do
  version "0.10.0"
  sha256 "4211ec5dd398297af0e31517d9805df9490542bf0c56d632e5263e1a76676c58"

  url "https://github.com/jorgebuitragor/margin/releases/download/v#{version}/Margin.dmg"
  name "Margin"
  desc "Disk space manager that explains what can be removed and asks before deleting"
  homepage "https://github.com/jorgebuitragor/margin"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Margin se actualiza sola con Sparkle desde GitHub Releases.
  auto_updates true
  depends_on macos: :tahoe

  app "Margin.app"
  binary "#{appdir}/Margin.app/Contents/Helpers/margin"

  uninstall launchctl: "local.margin.aviso",
            quit:      "local.margin.mac"

  zap trash: [
    "~/Library/Application Support/Margin",
    "~/Library/Caches/local.margin.mac",
    "~/Library/HTTPStorages/local.margin.mac",
    "~/Library/LaunchAgents/local.margin.aviso.plist",
    "~/Library/Preferences/local.margin.mac.plist",
  ]

  caveats <<~EOS
    Margin no está notarizada por Apple: la primera vez ábrela con clic derecho › Abrir.
  EOS
end
