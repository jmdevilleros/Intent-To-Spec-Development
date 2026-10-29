#!/usr/bin/env bash
# verify.sh - Arnés único de verificación (ITSD-A)
# Lo ejecutan el agente y el CI. Debe terminar con código distinto de 0 ante cualquier fallo.
# Copiar al proyecto y sustituir cada llamada a pending por un comando real.
# Un verify.sh que todavía contiene pending no está verde.
set -euo pipefail

pending() { printf 'verify.sh sin configurar: %s\n' "$1" >&2; exit 1; }
step() { printf '\n==> %s\n' "$1"; }

step "1. Lint / análisis estático"
pending "1. lint"
# ejemplo: npm run lint

step "2. Tests unitarios"
pending "2. tests"
# ejemplo: npm test

step "3. Tests de flujo headless"
pending "3. flujo headless"
# ejemplo: npm run test:flow

step "4. Widget / E2E"
pending "4. e2e"
# ejemplo: npx playwright test

step "5. Builds"
pending "5. builds"
# ejemplo: npm run build

step "6. Capturas (opcional)"
# Si este paso no aplica, borrarlo. Si aplica, sustituir pending por un comando.
pending "6. capturas"
# ejemplo: node scripts/screenshots.mjs

printf '\n✓ verify.sh OK\n'
