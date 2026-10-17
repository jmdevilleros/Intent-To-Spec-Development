#!/usr/bin/env bash
# verify.sh - Arnés único de verificación (ITSD-A)
# Lo ejecutan el agente y el CI. Debe terminar con código != 0 ante cualquier fallo.
# Reemplazar los comandos de ejemplo por los reales del proyecto.
set -euo pipefail

step() { printf '\n==> %s\n' "$1"; }

step "1. Lint / análisis estático"
# flutter analyze | npm run lint | ruff check .

step "2. Tests unitarios"
# flutter test | npm test | pytest

step "3. Tests de flujo headless"
# flutter test test/game_flow_test.dart

step "4. Widget / E2E"
# npx playwright test

step "5. Builds"
# flutter build web --release
# flutter build apk --release

step "6. Capturas (opcional)"
# node scripts/screenshots.mjs

printf '\n✓ verify.sh OK\n'
