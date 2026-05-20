# Truenex Memory Desktop — Releases

Questo repo pubblico contiene solo i metadati di aggiornamento per l'app desktop Truenex Memory.

## File

- `version.json` — versione corrente e URL download (letto dall'app all'avvio)

## Come pubblicare un aggiornamento

```powershell
.\publish-release.ps1 -Version "0.3.0" -DownloadUrl "https://github.com/marcomnit/truenex-memory-desktop/releases/download/v0.3.0/truenex-memory-desktop-setup.exe"
```

Lo script aggiorna `version.json`, committa e pusha su `main`.
