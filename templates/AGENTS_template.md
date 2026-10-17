# [Nombre del Proyecto] - Reglas para Agentes IA

## Autonomía (ITSD-A)

- **Nivel de autonomía:** L0 (ITSD clásico) | L1 | L2 | L3 — ver `ITSD-A.md`
- **Reglas de parada:** irreversible, dinero, secretos, checkpoint fallido > K, nueva bloqueante, presupuesto agotado
- **Git:** L0 sin commits de la IA; L1+ rama `agent/<tarea>` + PR; `main` protegido
- **Verificación:** `./verify.sh`
- **Estado / lock:** `docs/03_state.md`, `.itsd/lock`
- **Presupuestos:** tiempo por fase ___ · intentos por checkpoint K=3 · costo máx. ___

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

- Nunca hacer commits
- No usar `any`
- ...

## Reglas Obligatorias

1. **Lectura de Documentos Base**  
   Antes de cualquier acción, leer siempre:
   - `docs/00_spec.md`
   - `docs/01_plan.md`
   - `docs/02_decisions.md`

2. **Autorización para Cuestionar**  
   Tienes permiso explícito para alertar sobre inconsistencias, riesgos o mejoras.

3. ...
