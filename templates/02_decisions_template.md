# [Nombre del Proyecto] - Decisiones de Arquitectura y Diseño (ADR)

Registro de decisiones importantes tomadas durante el desarrollo del proyecto.

Un requisito vive en un solo archivo vigente. El ADR no copia el requisito. En la misma tarea se edita el archivo donde ese requisito vive.

El cuerpo de un ADR aceptado no se reescribe. Un cambio es un ADR nuevo. El ADR anterior pasa a Obsoleta. Ese ADR nuevo dice qué cláusula deja de mandar.

## Convenciones

- **ID**: ADR-XXX
- **Fecha**: YYYY-MM-DD
- **Estado**: Propuesta | Aceptada | Rechazada | Obsoleta

## Forma sin ciclos, o primer ciclo

ADR completos, uno tras otro.

## Decisiones

### ADR-001 - YYYY-MM-DD - Título corto de la decisión

**Estado**: Aceptada

**Contexto**:
Breve explicación del problema o situación que obligó a tomar esta decisión.

**Decisión**:
Qué se decidió exactamente.

**Alternativas consideradas**:
- Opción 1: ...
- Opción 2: ...

**Consecuencias**:
- **Positivas**:
- **Negativas / Riesgos**:
- **Requiere cambios en**:

---

(Agregar más ADRs a continuación)

## Forma con ciclos

Cuando el índice deja de leerse de un vistazo, `docs/02_decisions.md` queda así. No hay un número de ADR a partir del cual archivar sea obligatorio.

### Índice

- ADR-001 - YYYY-MM-DD - Título - Obsoleta - `docs/decisions/archive.md`
- ADR-00N - YYYY-MM-DD - Título - Aceptada - en juego

### ADR en juego

El bloque completo del ADR en juego, con el mismo formato de arriba.

**Histórico:** `docs/decisions/archive.md`. No entra en la lectura de inicio de sesión.
