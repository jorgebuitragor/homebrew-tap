# Tap de Homebrew de jorgebuitragor

```bash
brew install --cask jorgebuitragor/tap/margin
```

| Cask | Qué es |
| --- | --- |
| [`margin`](Casks/margin.rb) | [Margin](https://github.com/jorgebuitragor/margin): libera espacio en el Mac sin sorpresas. Instala la app y el comando `margin`. |

Margin no está notarizada por Apple: la primera vez ábrela con clic derecho › Abrir. Después se actualiza sola, y `brew upgrade` la deja en paz (`auto_updates`). El cask lo actualiza `scripts/release.sh` de Margin en cada versión.
