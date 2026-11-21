cask "margin" do
  version "0.10.6"
  sha256 "4bcd8562b9053f02f08ea2b4e67996bfc9ea03fd124c46312c512c72f487f5f5"

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
    Margin no está notarizada por Apple, así que macOS la deja en cuarentena:
      - La app: la primera vez ábrela con clic derecho › Abrir.
      - El comando `margin` (y su servidor MCP) no funciona mientras siga en cuarentena:
        macOS lo cierra o avisa de que no se pudo abrir. Si confías en Margin, antes de
        usarlo quítale la cuarentena:
          xattr -dr com.apple.quarantine "#{appdir}/Margin.app"
        Si ves ese aviso de macOS, pulsa «Aceptar»: «Mover a la Papelera» manda la app
        entera a la Papelera.
  EOS
end
