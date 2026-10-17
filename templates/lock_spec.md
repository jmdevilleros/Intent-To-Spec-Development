# Especificación de `.itsd/lock` (ITSD-A)

Archivo de bloqueo del workspace para evitar que dos agentes escriban en la misma carpeta.

## Formato (JSON)

```json
{
  "owner": "agent-id o nombre",
  "task": "Fase 4 - RF-004 colisiones",
  "branch": "agent/rf-004",
  "started_at": "2026-10-16T20:00:00-05:00",
  "heartbeat_at": "2026-10-16T20:05:00-05:00",
  "ttl_minutes": 15
}
```

## Reglas

1. **Antes de escribir**, leer `.itsd/lock`.
   - No existe → crearlo con tus datos.
   - Existe, es tuyo → actualizar `heartbeat_at`.
   - Existe, es de otro y `heartbeat_at + ttl_minutes` no venció → **no escribir**: abortar o trabajar en otro worktree/rama.
   - Existe, es de otro y está vencido → tomarlo y registrar la toma en `docs/03_state.md`.
2. Actualizar `heartbeat_at` al menos cada `ttl_minutes / 2`.
3. **Liberar** (borrar) el lock al terminar la tarea.
4. `.itsd/lock` va en `.gitignore` (es estado local, no historia).
5. Preferir **un git worktree por agente**; el lock protege la carpeta compartida.
