# Tap de Homebrew de jorgebuitragor

```bash
brew trust jorgebuitragor/tap
brew install --cask jorgebuitragor/tap/margin
```

Homebrew pide confiar una vez en un tap que no es oficial antes de instalar desde él (`brew trust`).

Margin no está notarizada por Apple, así que queda en cuarentena: la app se abre la primera vez con clic derecho › Abrir, y para usar el comando `margin` (o su servidor MCP) hay que quitársela antes, si confías en ella:

```bash
xattr -dr com.apple.quarantine /Applications/Margin.app
```

Si antes de eso macOS avisa de que no se pudo abrir `margin`, pulsa «Aceptar»: «Mover a la Papelera» manda la app entera a la Papelera.

| Cask | Qué es |
| --- | --- |
| [`margin`](Casks/margin.rb) | [Margin](https://github.com/jorgebuitragor/margin): libera espacio en el Mac sin sorpresas. Instala la app y el comando `margin`. |

Margin no está notarizada por Apple: la primera vez ábrela con clic derecho › Abrir. Después se actualiza sola, y `brew upgrade` la deja en paz (`auto_updates`). El cask lo actualiza `scripts/release.sh` de Margin en cada versión.
