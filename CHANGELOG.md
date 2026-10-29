# Changelog

## Unreleased

- Una sola lectura por regla. Fase ITSD (0–4) y fase del plan quedan como numeraciones distintas. La fase ITSD 0 deja `docs/00_intent.md` en todos los niveles. La fase ITSD 3 hace el scaffold mínimo y después `AGENTS.md`.
- Compuertas, git, ADR y largo de sesión: L0 queda en la documentación clásica. L1–L3 mandan la tabla de `ITSD-A.md`. L1 no abre PR. El release público es de la persona, salvo que `AGENTS.md` diga `Release público: L3`.
- Con ciclos, `docs/02_decisions.md` se lee siempre. `docs/decisions/archive.md` no. Cada requisito tiene un solo archivo vigente. La fase del plan en curso incluye la casilla en progreso.
- Plantillas alineadas con esas reglas. El `verify.sh` de ejemplo termina en rojo mientras conserva `pending`. Los templates con ejemplos de comandos usan una cerca que no se cierra antes de tiempo.
- Modo opcional ITSD-C (producto por ciclos). Núcleo corto, par spec/plan por ciclo, plan vivo sin checklists cerrados, lectura del ciclo en curso, índice de ADR con el ADR en juego. Al abrir el segundo ciclo, el expediente del primero sale del núcleo. Los `RF-XXX` no se reinician. No cambia las fases 0–4 ni los niveles L0–L3. Sin la declaración en `AGENTS.md`, la lectura clásica sigue igual.
- El skill `itsd-dev` deja de ser exclusivo de opencode y pasa a ser genérico (agnóstico de agente/harness).
- `SKILL.md`: frontmatter ampliado (`when-to-use`, `argument-hint`, `user-invocable`, `license`, `metadata`); nueva sección *Archivos del skill* con rutas relativas al directorio del skill y enlace al modo ITSD-A.
- `README.md`: la sección *Skill para opencode* se reemplaza por *Skill para agentes de IA*, con estructura, tabla de instalación (Grok Build, Claude Code, Cursor, opencode, `.agents`), instalación por `git clone` y uso.
- Nuevo `CHANGELOG.md`.
- Conteo de fases unificado: ITSD tiene **5 fases, numeradas de la Fase 0 a la Fase 4** (antes el README decía "4 fases"). Ajustado en `README.md`, `SKILL.md` e `Intent-To-Spec-Development.md`.

## Historial previo

- Modo autónomo ITSD-A (niveles L0–L3, suficiencia de intención, templates) — PR #2.
- Licencia MIT — PR #3.
