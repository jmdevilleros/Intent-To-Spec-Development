# [Nombre del Proyecto] - Estado (ITSD-A)

**Actualizado:** YYYY-MM-DD HH:MM (zona)
**Agente / dueño del lock:** ...
**Nivel de autonomía:** L_

El nivel se copia de `AGENTS.md` cuando ese archivo existe. Si difiere, no se escribe código: se muestran los dos valores y se deja el menor en los dos archivos.

## Posición

| Campo | Valor |
|-------|-------|
| Fase del plan actual | Fase N - Nombre |
| Ciclo en curso | Ruta del par, copia de `AGENTS.md`. Vacío si no hay ciclos. |
| Último checkpoint verde | Fase del plan N-1 · commit `abc1234` · `verify.sh` ok |
| Tarea en curso | ... |
| Rama | `agent/...` |

Si la ruta del ciclo difiere de `AGENTS.md`, manda `AGENTS.md`. Se corrige esta fila antes de editar código.

## Bloqueos

- (ninguno) / descripción + regla de parada activada

## Supuestos abiertos

- S-XX: ...

## Siguiente paso

- ...

## Historial breve

| Fecha | Evento |
|-------|--------|
| YYYY-MM-DD | Fase del plan N cerrada (tests n/n) |
