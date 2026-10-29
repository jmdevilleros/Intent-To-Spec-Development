# ITSD-A: Modo Autónomo de Intent-to-Spec Development

**Modo de ITSD con niveles de autonomía para agentes de IA**  
Mantiene los artefactos y la filosofía de ITSD, pero cambia **quién cierra cada compuerta** y **cómo se verifica**: la persona aporta intención, gusto y la prueba final; el agente ejecuta, verifica y entrega.

> ITSD-A **no reemplaza** a ITSD. L0 conserva las compuertas y el git de ITSD clásico. El entregable de la fase ITSD 0 es `docs/00_intent.md` en todos los niveles.

El modo por ciclos (`ITSD-C.md`) es independiente de este nivel. Un proyecto L0 puede declarar ciclos. Un proyecto L2 también. ITSD-C cambia la lectura y el lugar de los RF. No cambia las compuertas de esta página.

**Dos numeraciones.** Fase ITSD es la 0, la 1, la 2, la 3 o la 4 del método. Fase del plan es un heading de `docs/01_plan.md` o del plan del ciclo, y su número es el del producto. Una regla operativa nombra cuál de las dos es. «Fase 0» a «Fase 4» nombran solo fases ITSD.

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
| **L0** (ITSD clásico) | Escribe código | Compuertas y git de L0: aprobación del spec y de cada fase del plan; commits de la persona |
| **L1** Asistido | Commits en `agent/<tarea>`, sin PR; fases del plan seguidas | Aprobación formal del spec, merge |
| **L2** Autónomo supervisado *(recomendado)* | + PR, pre-releases, instalación de SDKs y herramientas | Intención, decisiones de gusto, resumen de intención (con timeout), demo final, merge a `main` |
| **L3** Autónomo | + merge con CI verde, release interno | Intención y prueba final; recibe notificaciones y puede vetar |

**Reglas:**
- Hasta que existe `AGENTS.md`, el nivel es el de `docs/00_intent.md`. Desde que existe, el nivel es el de `AGENTS.md`.
- Bajar de nivel escribe el mismo valor en `docs/00_intent.md` y en `AGENTS.md` si ese archivo existe.
- Subir de nivel solo con autorización de la persona, escrita en los dos archivos.
- Si los dos existen y discrepan, no se escribe código: se muestran los dos valores y se deja el menor en los dos.

---

## Tabla de compuertas

Esta tabla es la única. El diagnóstico de abajo no añade otra política.

| Cierre | L0 | L1 | L2 | L3 |
|---|---|---|---|---|
| Intención | El usuario responde. Si no hay stack, se recomienda uno después de saber el alcance y se espera un sí. | Igual, con tope de 5–7 preguntas. Si quedan bloqueantes, se baja a L1 o a L0. | Igual, más el resumen con timeout. Sin respuesta se sigue con los supuestos. | El resumen se notifica y no se espera. |
| Spec | Aprobación explícita en el spec. | Aprobación explícita en el spec. | Notificación. El timeout ya ocurrió en el resumen. | Notificación. |
| Plan y `AGENTS.md` | Se muestran. La ejecución espera la casilla de cierre del plan. | Notificación. | Notificación. | Notificación. |
| Cada fase del plan | Checkpoint verde y aceptación del usuario antes de marcarla `[x]`. | Checkpoint verde. | Checkpoint verde. | Checkpoint verde. |
| Git | La persona hace los commits. | Commits en `agent/<tarea>`. Sin PR y sin merge. | Además, PR y pre-release. El merge lo hace la persona. | Además, merge con CI verde y release interno. |
| ADR | Se escribe antes de modificar código. | Se escribe y se continúa, salvo regla de parada. | Igual que L1. | Igual que L1. |
| Sesión | Una o dos fases del plan. | El tope es el presupuesto. La posición queda en `docs/03_state.md`. | Igual que L1. | Igual que L1. |

El release público lo hace la persona. `AGENTS.md` puede decir `Release público: L3`. Sin esa línea, L3 publica solo el release interno.

## Diagnóstico de Compuertas (ITSD → ITSD-A)

| Compuerta clásica | Dónde quedó |
|-------------------|-------------|
| Fase ITSD 0: entrevista | L0: las seis preguntas de ITSD. L1–L3: esta página, tope de 5–7 |
| Cerrar una tecnología | L0: con un sí. L1–L3: supuesto o ADR, según la tabla |
| Aprobación del spec, del plan y de cada fase del plan | La tabla |
| Checkpoint | `verify.sh` en L1–L3. En L0, el comando de la fase del plan y la aceptación del usuario |
| Commits | La fila Git de la tabla. `main` protegido |
| ADR antes de implementar | La fila ADR de la tabla |
| Una o dos fases del plan por sesión | La fila Sesión de la tabla |

---

## Fase 0-A: Captura de Intención y Criterio de "Intención Suficiente"

**Archivo:** `docs/00_intent.md`

Toda pregunta abierta se clasifica:

| Clase | Cuándo | Quién resuelve | Dónde queda |
|-------|--------|----------------|-------------|
| **Bloqueante** | Define la experiencia central, es costosa de revertir o es de gusto | **La persona** (se pregunta) | `00_intent.md` → Decisiones |
| **Supuesta** | Tiene un default razonable y es reversible | **El agente** decide | `00_intent.md` → Supuestos (con justificación) |
| **Diferida** | Se resuelve mejor con evidencia durante la implementación | **El agente**, más tarde | `docs/02_decisions.md` (ADR) |

L0 no usa este tope. L0 usa las preguntas de la fase ITSD 0. En L0 la tecnología se cierra con un sí.

**Reglas de la entrevista (L1–L3):**
- Máximo **5–7 preguntas**, ordenadas por impacto (primero las bloqueantes de experiencia central).
- Si tras el tope **quedan bloqueantes**, el proyecto **baja a L1 o L0**. El nivel nuevo se escribe en `docs/00_intent.md` y, si existe, en `AGENTS.md`.

**En L1–L3, la entrevista termina cuando se cumplen las tres condiciones:**
1. No quedan preguntas **bloqueantes** abiertas.
2. Cada RF previsto se puede convertir en un **criterio de aceptación verificable**.
3. Se muestra a la persona un **resumen de una pantalla** (decidido vs. supuesto).

**Después del resumen:**
- **L1:** aprobación explícita requerida.
- **L2:** timeout (p. ej. **24 h**); sin respuesta → se procede con los supuestos.
- **L3:** sin espera; el resumen es solo notificación.

En L1–L3, una vez iniciada la ejecución, el agente **solo vuelve** a la persona por **reglas de parada**. En L0, además, espera la aceptación del usuario antes de marcar `[x]` cada fase del plan.

---

## Reglas de Parada y Escalamiento

En L1–L3 el agente se detiene y pregunta **solo** si:

| Regla | Ejemplos |
|-------|----------|
| **Irreversible** | Borrar datos, publicar en tienda, merge a `main` (L≤2), enviar a terceros |
| **Dinero** | Servicios de pago, cuentas, compras, APIs con costo |
| **Secretos** | Keystores de firma, tokens, credenciales |
| **Checkpoint fallido repetido** | El mismo checkpoint falla más de *K* intentos (default 3) |
| **Nueva bloqueante** | Aparece una pregunta que define la experiencia central, costosa de revertir o de gusto |
| **Presupuesto agotado** | Tiempo, intentos o costo superan los límites declarados |

En L1–L3, fuera de estas reglas, el agente **decide, registra (supuesto o ADR) y continúa**.

---

## Política de Git, Ramas y Releases

Repite la fila Git de la tabla de compuertas.

- L0: los commits los hace la persona.
- L1: el agente trabaja en `agent/<tarea>` (o un *git worktree* propio) y hace commits. No abre PR y no hace merge.
- L2: además, PR por hito con `verify.sh` en verde, y tags de pre-release `vX.Y.Z-rcN`. El merge lo hace la persona.
- L3: además, merge con CI verde y release interno.
- El release público lo hace la persona. Solo lo hace el agente si `AGENTS.md` dice `Release público: L3`.
- Commit que referencia la fase del plan y el RF: `feat(plan-2): RF-004 colisiones`.
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

Un `verify.sh` que todavía contiene `pending` no está verde.

---

## Bucle de Autocrítica

Antes de cerrar cada fase del plan:
- Diff contra la spec (¿se cumplen los RF de la fase del plan? ¿hay *features* fuera de spec?).
- `verify.sh` en verde.
- Revisión crítica (idealmente un segundo agente o checklist): RF incumplidos, deuda, riesgos.
- Hallazgos → se corrigen o se registran en `02_decisions.md`.

---

## Archivo de Estado

**Archivo:** `docs/03_state.md` (ver `templates/03_state_template.md`)

Lo actualiza el agente al cerrar cada tarea: fase del plan actual, ciclo en curso si lo hay, último checkpoint verde, tarea en curso, bloqueos, supuestos abiertos, siguiente paso y dueño del lock. Permite reanudar desde cualquier sesión o agente. Si el ciclo en curso difiere de `AGENTS.md`, manda `AGENTS.md` y se corrige el estado antes de editar código.

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
- Tiempo máximo por fase del plan.
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
│ Fase 2-3     │  plan, scaffold mínimo, AGENTS.md, verify.sh
└──────┬───────┘
       ▼
┌──────────────┐
│ Fase 4-A     │  Fase del plan: verify.sh → autocrítica → commit → 03_state
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

En las fases ITSD 2 y 3, el scaffold mínimo ocurre antes de escribir `AGENTS.md`. El scaffold no es la fase 1 del plan.

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
