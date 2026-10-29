# ITSD-A: Modo Autónomo de Intent-to-Spec Development

**Modo de ITSD con niveles de autonomía para agentes de IA**  
Mantiene los artefactos y la filosofía de ITSD, pero cambia **quién cierra cada compuerta** y **cómo se verifica**: la persona aporta intención, gusto y la prueba final; el agente ejecuta, verifica y entrega.

> ITSD-A **no reemplaza** a ITSD. El nivel **L0** es ITSD clásico, sin cambios. El nivel se declara en `AGENTS.md`.

El modo por ciclos (`ITSD-C.md`) es independiente de este nivel. Un proyecto L0 puede declarar ciclos. Un proyecto L2 también. ITSD-C cambia la lectura y el lugar de los RF. No cambia las compuertas de esta página.

---

## Filosofía

ITSD elimina la ambigüedad antes de escribir código. ITSD-A añade una premisa: **la persona no debe ser el cuello de botella de lo que una máquina puede verificar**.

- La persona decide lo que solo ella puede decidir: **intención**, **gusto** y **aceptación final**.
- Todo lo demás se **verifica automáticamente** o se **registra** (supuesto o ADR) y se **notifica**.
- El agente vuelve a la persona **solo** por reglas de parada explícitas.

---

## Niveles de Autonomía

| Nivel | El agente hace solo | La persona conserva |
|-------|---------------------|---------------------|
| **L0** (ITSD clásico) | Escribe código | Todo: aprobación de spec y fases, Git |
| **L1** Asistido | Commits en rama propia; ejecuta fases seguidas | Aprobación formal de spec, merge |
| **L2** Autónomo supervisado *(recomendado)* | + PR, pre-releases, instalación de SDKs y herramientas | Intención, decisiones de gusto, resumen de intención (con timeout), demo final, merge a `main` |
| **L3** Autónomo | + merge con CI verde, release interno | Intención y prueba final; recibe notificaciones y puede vetar |

**Reglas:**
- El nivel se declara en `AGENTS.md` (`Nivel de autonomía: L2`).
- El agente puede **bajar** de nivel por sí mismo (p. ej., si quedan bloqueantes); nunca **subir** sin autorización.

---

## Diagnóstico de Compuertas (ITSD → ITSD-A)

| Compuerta ITSD | Tratamiento en ITSD-A |
|----------------|----------------------|
| Fase 0: entrevista de intención | **Se mantiene, acotada**: máx. 5–7 preguntas por impacto (ver *Intención suficiente*) |
| "Nunca asumir tecnologías" | **Se reemplaza** por "asumir con evidencia y registrar" (supuesto o ADR) |
| Aprobación formal de la spec | L1: se mantiene. L2: resumen con timeout. L3: notificación sin espera |
| Plan y `AGENTS.md` | **Notificación** (incluidos en el reporte) |
| Aprobación por fase | **Se elimina**: la compuerta es el checkpoint automático |
| Checkpoints manuales | **Verificación automática** (`verify.sh`); solo *feel*/hardware quedan para la demo |
| "La IA no hace commits" | **Política de ramas**: el agente commitea en su rama y abre PR; `main` protegido |
| ADR antes de implementar | **Se mantiene, no bloqueante**: se registra y se continúa salvo regla de parada |
| "1–2 fases por sesión" | **Archivo de estado** (`docs/03_state.md`) para reanudar en cualquier sesión |

---

## Fase 0-A: Captura de Intención y Criterio de "Intención Suficiente"

**Archivo:** `docs/00_intent.md`

Toda pregunta abierta se clasifica:

| Clase | Cuándo | Quién resuelve | Dónde queda |
|-------|--------|----------------|-------------|
| **Bloqueante** | Define la experiencia central, es costosa de revertir o es de gusto | **La persona** (se pregunta) | `00_intent.md` → Decisiones |
| **Supuesta** | Tiene un default razonable y es reversible | **El agente** decide | `00_intent.md` → Supuestos (con justificación) |
| **Diferida** | Se resuelve mejor con evidencia durante la implementación | **El agente**, más tarde | `docs/02_decisions.md` (ADR) |

**Reglas de la entrevista:**
- Máximo **5–7 preguntas**, ordenadas por impacto (primero las bloqueantes de experiencia central).
- Si tras el tope **quedan bloqueantes**, el proyecto **baja a L1 o L0** (no se fuerza autonomía con ambigüedad crítica).

**La entrevista termina cuando se cumplen las tres condiciones:**
1. No quedan preguntas **bloqueantes** abiertas.
2. Cada RF previsto se puede convertir en un **criterio de aceptación verificable**.
3. Se muestra a la persona un **resumen de una pantalla** (decidido vs. supuesto).

**Después del resumen:**
- **L1:** aprobación explícita requerida.
- **L2:** timeout (p. ej. **24 h**); sin respuesta → se procede con los supuestos.
- **L3:** sin espera; el resumen es solo notificación.

Una vez iniciada la ejecución, el agente **solo vuelve** a la persona por **reglas de parada**.

---

## Reglas de Parada y Escalamiento

El agente se detiene y pregunta **solo** si:

| Regla | Ejemplos |
|-------|----------|
| **Irreversible** | Borrar datos, publicar en tienda, merge a `main` (L≤2), enviar a terceros |
| **Dinero** | Servicios de pago, cuentas, compras, APIs con costo |
| **Secretos** | Keystores de firma, tokens, credenciales |
| **Checkpoint fallido repetido** | El mismo checkpoint falla más de *K* intentos (default 3) |
| **Nueva bloqueante** | Aparece una pregunta que define la experiencia central, costosa de revertir o de gusto |
| **Presupuesto agotado** | Tiempo, intentos o costo superan los límites declarados |

Fuera de estas reglas, el agente **decide, registra (supuesto o ADR) y continúa**.

---

## Política de Git, Ramas y Releases

- El agente trabaja en una rama `agent/<tarea>` (o un *git worktree* propio).
- Commits pequeños que referencian fase o RF: `feat(F2): RF-004 colisiones`.
- **PR por hito**, con CI (`verify.sh`) obligatorio en verde.
- Tags de pre-release: `vX.Y.Z-rcN`. Releases públicos: solo la persona (o L3 si está autorizado).
- **Prohibido:** force-push a `main`, reescribir historia publicada, commitear secretos.

---

## Bloqueo de Workspace (multi-agente)

**Archivo:** `.itsd/lock` (ver `templates/lock_spec.md`)

- Antes de escribir, el agente lee el lock. Si existe uno de **otro dueño con latido vigente**, **no escribe**: aborta o usa otro worktree/rama.
- El dueño actualiza el latido periódicamente y libera el lock al terminar.
- Un lock con latido vencido puede tomarse, dejando registro en `03_state.md`.
- Regla de oro: **un dueño por tarea y por carpeta**.

---

## Arnés de Verificación: `verify.sh`

Un **único comando** usado por el agente y por el CI (ver `templates/verify_template.sh`):

1. Lint / análisis estático
2. Tests unitarios
3. Tests de flujo headless (loop de juego, lógica de negocio end-to-end sin UI)
4. Widget / E2E (p. ej. Playwright sobre build web)
5. Build de cada target
6. Capturas automáticas para revisión visual (opcional)

**Criterios de aceptación ejecutables:** cada `RF-XXX` del núcleo y, si el proyecto declara ciclos, cada `RF-XXX` del ciclo en curso debe mapear a uno o más tests, o declarar explícitamente "verificación manual en demo". Un RF sin verificación no está listo.

---

## Bucle de Autocrítica

Antes de cerrar cada fase:
- Diff contra la spec (¿se cumplen los RF de la fase? ¿hay *features* fuera de spec?).
- `verify.sh` en verde.
- Revisión crítica (idealmente un segundo agente o checklist): RF incumplidos, deuda, riesgos.
- Hallazgos → se corrigen o se registran en `02_decisions.md`.

---

## Archivo de Estado

**Archivo:** `docs/03_state.md` (ver `templates/03_state_template.md`)

Lo actualiza el agente al cerrar cada tarea: fase actual, último checkpoint verde, tarea en curso, bloqueos, supuestos abiertos, siguiente paso y dueño del lock. Permite reanudar desde cualquier sesión o agente.

---

## Definición de Hecho y Demo de Aceptación

El trabajo está **hecho** cuando:
- Todos los RF del núcleo y, si hay ciclos declarados, los del ciclo en curso están verdes en la matriz RF → verificación. Los de un ciclo cerrado no se vuelven a contar.
- `verify.sh` en verde.
- El artefacto está publicado (ver *Entrega*).
- `03_state.md` está cerrado.
- Existe `docs/04_acceptance.md` con el guion de la demo humana.

La **demo de aceptación** es la compuerta final humana: lo no automatizable (sensación, rendimiento en hardware, controles reales, estética).

---

## Entrega de Artefactos

- Binarios (APK, instaladores, builds) **nunca por chat**: **GitHub Releases** (pre-release), Drive o bucket.
- El reporte incluye: enlace, tamaño, SHA-256 y commit de origen.

---

## Presupuestos

Declarados en `AGENTS.md`:
- Tiempo máximo por fase.
- Intentos máximos por checkpoint (*K*).
- Tope de costo (tokens / dinero).

Al excederse → regla de parada.

---

## Formato de Reporte

Un reporte por hito:

```markdown
## Reporte - [Hito] - YYYY-MM-DD
- **Estado:** [En curso | Bloqueado | Hecho]
- **Fases cerradas:** ...
- **Verificación:** tests n/n, builds ok/fallo
- **Artefacto:** enlace · tamaño · SHA-256 · commit
- **Decisiones (ADR):** ...
- **Supuestos abiertos:** ...
- **Riesgos:** ...
- **Qué necesito de ti:** (vacío si nada)
```

---

## Estructura de Artefactos

```
proyecto/
├── AGENTS.md                # + nivel de autonomía, escalamiento, Git, presupuestos
├── verify.sh                # arnés único de verificación
├── .itsd/lock               # dueño del workspace
└── docs/
    ├── 00_intent.md         # visión, bloqueantes, supuestos, diferidas, nivel L
    ├── 00_spec.md           # RF + matriz RF → verificación
    ├── 01_plan.md           # checkpoints = comandos de verify.sh
    ├── 02_decisions.md      # ADR
    ├── 03_state.md          # estado para reanudar
    └── 04_acceptance.md     # guion de demo humana
```

Con ciclos declarados, el árbol de lectura pasa a ser el de `ITSD-C.md`. Este árbol sigue siendo el del primer ciclo y el de un proyecto sin ciclos.

## Flujo (L2)

```
IDEA DEL USUARIO
       │
       ▼
┌──────────────┐
│ Fase 0-A     │  00_intent.md: ≤7 preguntas, bloqueantes/supuestas/diferidas
│ Intención    │  ← resumen de una pantalla (timeout 24 h)
└──────┬───────┘
       ▼
┌──────────────┐
│ Fase 1       │  00_spec.md + matriz RF → test   (notificación)
└──────┬───────┘
       ▼
┌──────────────┐
│ Fase 2-3     │  01_plan.md, AGENTS.md, verify.sh, entorno (automático)
└──────┬───────┘
       ▼
┌──────────────┐
│ Fase 4-A     │  En rama: implementar → verify.sh → autocrítica → commit → 03_state
│ Ejecución    │  sin compuertas; solo reglas de parada
└──────┬───────┘
       ▼
┌──────────────┐
│ Entrega      │  PR + pre-release + reporte
└──────┬───────┘
       ▼
┌──────────────┐
│ Demo         │  04_acceptance.md ← la persona prueba y acepta → merge/release
└──────────────┘
```

---

## Riesgos y Mitigaciones

| Riesgo | Mitigación |
|--------|-----------|
| Supuestos erróneos generan retrabajo | Clasificación bloqueante/supuesta/diferida; resumen con timeout; supuestos con justificación |
| Tests que "pasan" sin validar (autoevaluación) | Matriz RF → test; crítico independiente; capturas; demo humana final |
| *Feel* no automatizable | Explícito en `04_acceptance.md`; parámetros en config para iterar rápido |
| Conflictos multi-agente | `.itsd/lock` con latido, worktrees/ramas, un dueño por tarea |
| Acciones irreversibles o fuga de secretos | Reglas de parada cerradas; `main` protegido; secretos fuera del repo |
| Costo/tiempo fuera de control | Presupuestos declarados con parada automática |
| Pérdida de trazabilidad por velocidad | Commits por RF, ADR no bloqueantes, reporte estándar |
| Confusión ITSD vs ITSD-A | Nivel declarado en `AGENTS.md`; L0 = ITSD clásico |
| Confusión entre ciclos y nivel de autonomía | Secciones distintas en `AGENTS.md`. ITSD-C no sube ni baja L |

---

## Templates de ITSD-A

| Template | Uso |
|----------|-----|
| `templates/00_intent_template.md` | Intención, preguntas clasificadas, supuestos, resumen |
| `templates/03_state_template.md` | Estado para reanudar |
| `templates/04_acceptance_template.md` | Guion de demo humana |
| `templates/verify_template.sh` | Esqueleto del arnés de verificación |
| `templates/lock_spec.md` | Especificación de `.itsd/lock` |
| `templates/AGENTS_template.md` | Incluye sección *Autonomía (ITSD-A)* |
