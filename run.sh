#!/usr/bin/env bash
# Jednorazowa sesja Chromium w przeglądarce. Kontener jest kasowany po zakończeniu (Ctrl+C).
set -euo pipefail
PORT="${PORT:-3000}"
NAME="disposable-chromium-$$"
trap 'docker rm -f "$NAME" >/dev/null 2>&1 || true; echo "Sesja usunięta."' EXIT INT TERM
echo "Otwórz: http://localhost:${PORT}  (Ctrl+C kończy i kasuje sesję)"
docker run --rm --name "$NAME" \
  --shm-size=1g --security-opt seccomp=unconfined \
  -e PUID=1000 -e PGID=1000 -e TZ="${TZ:-Europe/Warsaw}" \
  -p "127.0.0.1:${PORT}:3000" \
  lscr.io/linuxserver/chromium:latest
