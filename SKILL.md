---
name: itsd-dev
description: >-
  Intent-to-Spec Development (ITSD): metodología estructurada para desarrollo de
  software asistido por IA. Convierte una idea vaga en un producto funcional en 5 fases
  (Fase 0 a Fase 4): Captura de Intención, Especificación (docs/00_spec.md), Plan de Implementación
  (docs/01_plan.md), Reglas para Agentes (AGENTS.md) y Ejecución con registro de
  decisiones (docs/02_decisions.md). Incluye templates, el modo autónomo ITSD-A
  (niveles L0-L3) y el modo opcional por ciclos ITSD-C. Use when starting a new project from an idea, writing a project
  specification, building an implementation plan, or defining AI agent rules.
when-to-use: >-
  "tengo una idea", "nuevo proyecto", "crear app", "empezar desde cero", "definir
  especificación", "plan de implementación", "metodología de desarrollo", "reglas para
  agentes", "AGENTS.md", "new project from an idea", "write a spec", "structured
  software development", "ITSD", "ITSD-A", "modo autónomo", "ITSD-C",
  "producto por ciclos", "segundo ciclo".
argument-hint: "[fase|continuar]"
user-invocable: true
license: MIT
metadata:
  author: jmdevilleros
  short-description: Idea → spec → plan → AGENTS.md → ejecución, con templates, ITSD-A y ciclos ITSD-C.
---

# Intent-to-Spec Development (ITSD)

**Metodología de desarrollo asistido por IA**

Transforma ideas vagas en productos funcionales mediante especificaciones claras, planes detallados y reglas explícitas para agentes de código.

---

## Archivos del skill

Este skill funciona con cualquier agente o harness que lea `SKILL.md` (Grok Build, Claude Code, Cursor, opencode, `.agents`, etc.). Las instrucciones son independientes de la herramienta: donde se dice "leer", "crear" o "ejecutar", usa las herramientas equivalentes de tu entorno.

| Archivo | Uso |
|---------|-----|
| `Intent-To-Spec-Development.md` | Documentación completa de la metodología |
| `ITSD-A.md` | Modo autónomo: niveles L0–L3, compuertas, `verify.sh`, estado y bloqueo multi-agente |
| `ITSD-C.md` | Modo opcional por ciclos: núcleo corto, par spec/plan por ciclo, lectura del ciclo en curso |
| `templates/` | Plantillas de `00_spec`, `01_plan`, `02_decisions`, `AGENTS.md`, las de ITSD-A (`00_intent`, `03_state`, `04_acceptance`, `verify_template.sh`, `lock_spec.md`) y las de ITSD-C (`cycle_spec_template.md`, `cycle_plan_template.md`) |

Las rutas de esta tabla son relativas al directorio de este skill; resuélvelas antes de usarlas. Las rutas `docs/...` y `AGENTS.md` de las fases se refieren al **proyecto del usuario**. Si los archivos de `templates/` no están disponibles, usa los templates incluidos en este documento.

El nivel se lee así. Si existe `AGENTS.md`, manda ese archivo. Si no existe, manda `docs/00_intent.md`. Si no existe ninguno, el nivel es L0. En L0, los cierres son los de esta página. En L1–L3, las compuertas, los supuestos, el git y el largo de sesión los define `ITSD-A.md`.

Si `AGENTS.md` declara ciclos, la lectura de sesión y el lugar de los RF siguen `ITSD-C.md`. Declarar ciclos no cambia el nivel. Sin esa declaración hay un solo spec, un solo plan y un solo registro de ADR, y se leen enteros. Si ITSD-C y el nivel discrepan en la lectura, manda ITSD-C. Si discrepan en commits o compuertas, manda el nivel.

**Dos numeraciones.** Fase ITSD es la 0, la 1, la 2, la 3 o la 4 del método. Fase del plan es un heading de `docs/01_plan.md` o del plan del ciclo, y su número es el del producto. Una regla operativa nombra cuál de las dos es. «Fase 0» a «Fase 4» nombran solo fases ITSD.

---

## Filosofía

El desarrollo con IA alcanza su máximo potencial cuando se elimina la ambigüedad antes de escribir una sola línea de código.

**Tres pilares fundamentales:**

1. La IA debe entender **qué** se debe construir (Especificación)
2. La IA debe saber **cómo** construirlo de forma ordenada (Plan de Implementación)
3. La IA debe respetar consistentemente **las reglas** del proyecto (Agentes)

Sin especificación, la IA adivina. Sin plan, improvisa. Sin reglas, genera inconsistencias.

---

## Pipeline de Fases

ITSD consta de **5 fases ITSD**, numeradas de la **Fase 0** a la **Fase 4**.

```
IDEA DEL USUARIO
       │
       ▼
┌─────────────┐
│  Fase 0     │  Captura de intención (preguntas)
│  Preguntas  │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Fase 1     │  00_spec.md (requerimientos)
│  Spec       │  ← usuario aprueba
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Fase 2     │  01_plan.md (fases del plan)
│  Plan       │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Fase 3     │  scaffold mínimo + AGENTS.md
│  Agents     │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Fase 4     │  Ejecución del plan
│  Build      │  ← fase del plan, verificando checkpoints
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Producto   │
└─────────────┘
```

Cierres de L0. En L1–L3 cierra la tabla de `ITSD-A.md`.

**Regla de progresión:** No se abre la fase ITSD siguiente con el entregable anterior vacío. Quién lo cierra lo dice la tabla de compuertas de `ITSD-A.md`. En L0, el cierre es el de esta página.

---

## Fase 0: Captura de Intención

**Objetivo:** Comprender la visión del usuario y dejarla escrita.

La fase ITSD 0 empieza por el nivel. Se anota en `docs/00_intent.md`. Si el usuario no lo elige, queda L0.

Con L1–L3, la entrevista es la de `ITSD-A.md`.

Con L0, estas preguntas:

1. **¿Qué problema resuelve tu producto?**
2. **¿Quiénes son los usuarios objetivo?**
3. **¿Qué stack tecnológico prefieres?** Si no tienes uno, se deja abierto.
4. **¿Cuál es el alcance?** MVP, prototipo o versión completa.
5. **¿Herramientas de build, test y despliegue?**
6. **¿Convenciones de código?** Nomenclatura, testing, linting.

Si el stack sigue abierto, se recomienda uno después de conocer el alcance y se espera un sí. En L0 la tecnología se cierra con un sí. Recomendar y esperar es parte de esta pregunta.

### Reglas

- No se abre la fase ITSD 1 sin `docs/00_intent.md`.
- La respuesta a cada pregunta se escribe en ese archivo.
- En L0 la tecnología se cierra con un sí. En L1–L3 los supuestos los define `ITSD-A.md`.

### Entregable

`docs/00_intent.md`. Alimenta la fase ITSD 1.

---

## Fase 1: Especificación Detallada

**Objetivo:** Crear el documento de requerimientos. Cada requisito tiene un solo archivo vigente.

**Archivo destino:** `docs/00_spec.md`

### Reglas

- Usar lenguaje claro y accesible. Incluir tablas, ejemplos y detalles visuales cuando aplique.
- Los RF describen comportamiento observable y su criterio de aceptación. Tecnologías, estructura de carpetas y restricciones son decisiones ya tomadas.
- En L0 y L1 el usuario aprueba el spec antes de seguir. En L2 y L3 se notifica y no se espera. La tabla de `ITSD-A.md` es el detalle.
- Definir todos los parámetros configurables.
- Si el proyecto declara ciclos, este archivo guarda solo las reglas que cruzan ciclos, con sus valores. Los RF del ciclo viven en su spec. Ver `ITSD-C.md`.

### Template — Genera este archivo en `docs/00_spec.md`

```markdown
# [Nombre del Proyecto] - Especificación Detallada

**Versión:** 1.0
**Fecha:** YYYY-MM-DD
**Estado:** [Borrador | Revisado | Aprobado]

Breve descripción del producto (una o dos oraciones).

Cada requisito tiene un solo archivo vigente. En un solo ciclo, los RF van en este archivo. Con ciclos declarados, aquí solo van las reglas que cruzan ciclos, con sus valores. Los RF del ciclo van en el spec de ese ciclo.

Los RF describen comportamiento observable y su criterio de aceptación. Tecnologías, estructura de carpetas y restricciones son decisiones ya tomadas.

## 1. Tecnologías

- Frontend:
- Backend:
- Base de datos:
- Otras herramientas / servicios:

## 2. Requerimientos Funcionales

### RF-001 - Nombre del requerimiento
**Descripción:**
**Criterios de aceptación:**
- ...
- ...

(Repetir por cada requerimiento funcional importante)

## 3. Requerimientos No Funcionales

- Rendimiento:
- Escalabilidad:
- Seguridad:
- Compatibilidad:
- Usabilidad:

## 4. Configuración y Parámetros

| Parámetro | Descripción | Valor por defecto | Rango / Opciones |
|-----------|-------------|-------------------|------------------|
| ...       | ...         | ...               | ...              |

## 5. Estructura de Archivos

Descripción general de la arquitectura de carpetas esperada.

## 6. Restricciones Técnicas

- ...

## 7. Criterios de Aceptación Generales

- ...

**Aprobación:**
- [ ] L0 y L1: aprobado por el usuario en fecha: _______________
- [ ] L2 y L3: notificado en fecha: _______________. No se espera aprobación.
```

---

## Fase 2: Plan de Implementación

**Objetivo:** Desglosar el producto en fases del plan, verificables y ordenadas.

**Archivo destino:** `docs/01_plan.md`

### Reglas

- Cada fase del plan debe generar algo **verificable** (un checkpoint).
- El orden es: preparación → comportamiento base → funcionalidades → pulido.
- Los checkpoints deben ser comandos ejecutables, no descripciones vagas.
- Si el proyecto declara ciclos, este archivo no conserva los checklists cerrados. Nombra el ciclo abierto, apunta a su plan y guarda «Última fase del plan cerrada». Ver `ITSD-C.md`.

### Template — Genera este archivo en `docs/01_plan.md`

````markdown
# [Nombre del Proyecto] - Plan de Implementación

**Versión:** 1.0
**Fecha:** YYYY-MM-DD
**Forma:** un solo ciclo

El orden de las fases del plan es: preparación → comportamiento base → funcionalidades → pulido.

## Cierre para ejecutar

- [ ] L0: el usuario aprobó este plan en fecha: _______________

L1–L3 no usan esta casilla y no esperan.

## Convenciones

- [ ] = Pendiente
- [x] = Completado
- [~] = En progreso

`[~]` pertenece a la fase del plan en curso. La fase del plan en curso es el primer bloque con alguna casilla distinta de `[x]`.

## Fase 1: Nombre de la Fase

**Objetivo:** Qué se logra al completar esta fase del plan.

### Archivos a crear / modificar

| Archivo              | Acción              |
|----------------------|---------------------|
| `src/...`            | Crear               |
| `...`                | Modificar           |

### Checklist

- [ ] Tarea 1
- [ ] Tarea 2
- [ ] ...

### Checkpoint

```bash
# Comando para verificar que la fase del plan funciona
```

---

## Fase 2: ...

(Repetir estructura por cada fase del plan)

---

# Forma con ciclos

Usar este texto en `docs/01_plan.md` cuando `AGENTS.md` declara ciclos. Esta forma no tiene checklists.

# [Nombre del Proyecto] - Plan de Implementación

**Versión:** 1.0
**Fecha:** YYYY-MM-DD
**Forma:** ciclos
**Ciclo en curso:** [nombre]
**Spec:** `docs/cycles/NN_spec.md`
**Plan:** `docs/cycles/NN_plan.md`
**Última fase del plan cerrada:** N

Los checklists de este ciclo viven en el plan nombrado arriba. Este archivo no los copia.
````

---

## Fase 3: Reglas para Agentes

**Objetivo:** Dejar el proyecto ejecutable y las normas escritas para los agentes.

**Archivo destino:** `AGENTS.md` (en la raíz del proyecto)

### Reglas

- Primero, el scaffold mínimo: la herramienta de build queda instalada y un comando de prueba ya corrió, aunque el producto aún no haga nada.
- Después, `AGENTS.md`, con esos comandos.
- El scaffold no es la fase 1 del plan. El plan empieza en el primer comportamiento del producto.
- Actualizar `AGENTS.md` cuando cambien convenciones o tecnologías.

### Template — Genera este archivo en `AGENTS.md`

````markdown
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
````

### Sugerencia de contenido para AGENTS.md del proyecto

Al generar el `AGENTS.md` del proyecto destino, incluir estas secciones basadas en lo capturado en las fases ITSD anteriores:

| Sección | Fuente |
|---------|--------|
| Overview | Fase ITSD 0 (descripción del proyecto) |
| Tech Stack | Fase ITSD 1 (sección Tecnologías) |
| Commands | Fase ITSD 3 (comandos del scaffold) |
| Project Structure | Fase ITSD 1 (sección Estructura de Archivos) |
| Code Conventions | Fase ITSD 0 (convenciones del usuario) |
| Testing Strategy | Fase ITSD 1 (requerimientos no funcionales) |
| Prohibiciones | Fase ITSD 1 (restricciones técnicas) |

---

## Fase 4: Ejecución

**Objetivo:** Implementar las fases del plan, verificando cada checkpoint.

**Archivo destino:** `docs/02_decisions.md`

### Reglas de ejecución

El procedimiento es el algoritmo de sesión. Estas reglas lo acotan.

1. Seguir el orden de las fases del plan.
2. Verificar el checkpoint antes de avanzar. Si falla, no se sigue.
3. No agregar funcionalidades fuera del plan. Si hace falta otra, se crea una fase del plan nueva o un issue.
4. Un requisito vive en un solo archivo vigente. Si una decisión lo cambia, el ADR y la edición de ese archivo ocurren en la misma tarea. En L0 el ADR se escribe antes de modificar código. En L1–L3 se escribe y se continúa, salvo regla de parada.
5. En L0 los commits los hace la persona. En L1–L3 manda la fila Git de `ITSD-A.md`.
6. En L0, una o dos fases del plan por sesión. En L1–L3 el tope es el presupuesto y la posición queda en `docs/03_state.md`.
7. La IA tiene autorización explícita para cuestionar inconsistencias, riesgos o fallas detectadas.

### Cierres de L0

La tabla completa está en `ITSD-A.md`. En L0 se usa esta lista. En L1–L3 manda la tabla.

- **Intención.** El usuario responde. Si no hay stack, se recomienda uno después de saber el alcance y se espera un sí.
- **Spec.** Aprobación explícita en el spec.
- **Plan y `AGENTS.md`.** Se muestran. La ejecución espera la casilla de cierre del plan.
- **Cada fase del plan.** Checkpoint verde y aceptación del usuario antes de marcarla `[x]`.
- **Git.** La persona hace los commits.
- **ADR.** Se escribe antes de modificar código.
- **Sesión.** Una o dos fases del plan.

### Template — Genera este archivo en `docs/02_decisions.md`

```markdown
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
```

---

## Algoritmo de sesión

Cuando el usuario solicite continuar con la implementación:

1. Nivel. Si existe `AGENTS.md`, el nivel es el de ese archivo. Si no existe, el nivel es el de `docs/00_intent.md`. Si no existe ninguno, el nivel es L0. Si los dos existen y discrepan, no se escribe código: se muestran los dos valores y se deja el menor en los dos archivos.
2. Plan vigente. Sin ciclos, el plan es `docs/01_plan.md` y se leen enteros `docs/00_spec.md`, `docs/01_plan.md` y `docs/02_decisions.md`. Con ciclos declarados, se lee el núcleo descrito en `ITSD-C.md` y el par del ciclo en curso. `docs/02_decisions.md` entra en esa lectura. `docs/decisions/archive.md` entra solo si la tarea nombra ese archivo o un ADR cuyo texto ya no está en `docs/02_decisions.md`.
3. Fase del plan en curso. Es el primer bloque del plan vigente con alguna casilla distinta de `[x]`. Una casilla `[~]` hace corriente a ese bloque.
4. La fase del plan anterior está cerrada si sus casillas están en `[x]`, o si su número es menor o igual que «Última fase del plan cerrada» en `docs/01_plan.md`. No se abre un plan cerrado para comprobarlo.
5. Se ejecuta esa fase del plan. Si una decisión cambia un requisito, el ADR y la edición del único archivo donde vive ese requisito ocurren en la misma tarea.
6. El checkpoint se ejecuta antes de avanzar. Si falla, no se sigue. La fase se marca `[x]` cuando el checkpoint pasa y la compuerta de la tabla está cerrada.
7. Las casillas se escriben en el plan vigente. Con ciclos, `docs/01_plan.md` no recibe checklists.

---

## Mejores Prácticas

- **Menos es más**: Una especificación concisa es mejor que una extensa.
- **Checkpoints obligatorios**: Si no se puede verificar, la fase del plan no está lista.
- **AGENTS.md vivo**: Actualizarlo si cambian convenciones o comandos.
- **Autorización para Cuestionar**: La IA debe alertar sobre errores, inconsistencias o riesgos detectados.
- **Documentar decisiones**: Toda decisión significativa va en `docs/02_decisions.md`. Si cambia un requisito, el mismo paso edita el archivo donde ese requisito vive.
- **Sesiones enfocadas**: En L0, una o dos fases del plan por conversación. En L1–L3 el tope es el presupuesto.
- **Commits**: En L0 los commits los hace la persona. En L1–L3 manda la fila Git de `ITSD-A.md`.

---

## Estructura Recomendada del Proyecto

```
proyecto/
├── AGENTS.md
├── docs/
│   ├── 00_intent.md
│   ├── 00_spec.md
│   ├── 01_plan.md
│   └── 02_decisions.md
├── src/
├── tests/
└── README.md
```

Esa estructura es la de un producto de un solo ciclo. Con más de un ciclo, el árbol y la lectura están en `ITSD-C.md`.
