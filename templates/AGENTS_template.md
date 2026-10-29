# [Nombre del Proyecto] - Reglas para Agentes IA

## Autonomía (ITSD-A)

- **Nivel de autonomía:** L0 (ITSD clásico) | L1 | L2 | L3 — ver `ITSD-A.md`
- **Reglas de parada:** irreversible, dinero, secretos, checkpoint fallido > K, nueva bloqueante, presupuesto agotado
- **Git:** L0 sin commits de la IA. L1 commits en `agent/<tarea>`, sin PR. L2 y L3 además PR. L3 además merge con CI verde. `main` protegido.
- **Release público:** persona | L3
- **Verificación:** `./verify.sh`
- **Estado / lock:** `docs/03_state.md`, `.itsd/lock`
- **Presupuestos:** tiempo por fase del plan ___ · intentos por checkpoint K=3 · costo máx. ___

## Ciclos (ITSD-C)

- **Modo:** un solo expediente | ciclos — ver `ITSD-C.md`
- **Carpeta:** `docs/cycles/`
- **Ciclo en curso:** (vacío si el modo es un solo expediente)

## Overview

Breve descripción del proyecto (1-2 párrafos).

## Tech Stack

- ...

## Commands

```bash
npm run dev
npm run build
npm test
# etc.
```

## Project Structure

Descripción de la estructura de carpetas principal.

## Code Conventions

- Naming: camelCase / PascalCase / etc.
- ...

## Testing Strategy

- Framework:
- Qué probar:
- Qué NO probar:

## Architecture Notes

Decisiones importantes de diseño.

## Prohibiciones

- Commits, PR y release: los de la sección Autonomía. Esta lista no los repite.
- No usar `any`
- ...

## Reglas Obligatorias

1. **Lectura de Documentos Base**
   Antes de cualquier acción, leer siempre:
   - `docs/00_spec.md`
   - `docs/01_plan.md`
   - `docs/02_decisions.md`

   Si el modo es **ciclos**, se lee el núcleo y el par del ciclo en curso. `docs/02_decisions.md` entra en esa lectura: índice y ADR en juego. `docs/decisions/archive.md` no entra, salvo que la tarea nombre ese archivo o un ADR cuyo texto ya no está en `docs/02_decisions.md`. El detalle está en `ITSD-C.md`.

2. **Autorización para Cuestionar**
   Tienes permiso explícito para alertar sobre inconsistencias, riesgos o mejoras.

3. ...
