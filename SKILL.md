---
name: itsd-dev
description: |
  Intent-to-Spec Development (ITSD) — Structured methodology for AI-assisted software development. Transforms vague ideas into working products through 5 phases: Intent Capture, Specification, Implementation Plan, Agent Rules, and Execution.
  Use when: starting a new project from an idea, creating a project specification, building an implementation plan, defining AI agent rules, structured software development, "tengo una idea", "nuevo proyecto", "crear app", "empezar desde cero", "definir especificación", "metodología de desarrollo".
---

# Intent-to-Spec Development (ITSD)

**Metodología de desarrollo asistido por IA**

Transforma ideas vagas en productos funcionales mediante especificaciones claras, planes detallados y reglas explícitas para agentes de código.

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
│  Fase 2     │  01_plan.md (fases + checklists)
│  Plan       │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Fase 3     │  AGENTS.md (reglas para agentes IA)
│  Agents     │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Fase 4     │  Ejecución del plan
│  Build      │  ← fase por fase, verificando checkpoints
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Producto   │
└─────────────┘
```

**Regla de progresión:** Nunca avanzar de fase sin completar la anterior. Cada fase tiene un entregable que debe ser aprobado antes de continuar.

---

## Fase 0: Captura de Intención

**Objetivo:** Comprender profundamente la visión del usuario sin hacer suposiciones. Comenzar una entrevista estructurada para aclarar:

- Tecnologías preferidas o si recomendar un stack
- Alcance del proyecto (MVP, versión completa, prototipo)
- Herramientas de build, testing y despliegue
- Convenciones deseadas (nomenclatura, testing, linting)

### Preguntas guía

Realiza las siguientes preguntas al usuario antes de continuar:

1. **¿Qué problema resuelve tu producto?**
2. **¿Quiénes son los usuarios objetivo?**
3. **¿Qué stack tecnológico prefieres?**
   - Si no sabe, recomienda uno basado en el alcance
4. **¿Cuál es el alcance?**
   - MVP / Prototipo / Versión completa
5. **¿Herramientas de build/test/despliegue?**
6. **¿Convenciones de código?**
   - Nomenclatura, testing, linting

### Reglas

- **NUNCA** asumir tecnologías ni decisiones técnicas. Siempre preguntar.
- No avanzar a implementación sin documentar la intención.
- Registrar todas las decisiones tomadas por el usuario.
- La respuesta a cada pregunta se documenta, no se ignora.

### Entregable

Conjunto de decisiones documentadas que alimentan la Fase 1.

---

## Fase 1: Especificación Detallada

**Objetivo:** Crear un documento claro de requerimientos que sirva como **fuente única de verdad**.

**Archivo destino:** `docs/00_spec.md`

### Reglas

- Usar lenguaje claro y accesible. Incluir tablas, ejemplos y detalles visuales cuando aplique.
- La especificación describe **qué** se necesita, **no cómo** implementarlo.
- El usuario debe revisar y **aprobar formalmente** la especificación antes de continuar.
- Definir todos los parámetros configurables.

### Template — Genera este archivo en `docs/00_spec.md`

```markdown
# [Nombre del Proyecto] - Especificación Detallada

**Versión:** 1.0
**Fecha:** YYYY-MM-DD
**Estado:** [Borrador | Revisado | Aprobado]

Breve descripción del producto (una o dos oraciones).

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

**Aprobación del Usuario:**
- [ ] Aprobado por el usuario en fecha: _______________
```

---

## Fase 2: Plan de Implementación

**Objetivo:** Desglosar el proyecto en incrementos lógicos, verificables y manejables.

**Archivo destino:** `docs/01_plan.md`

### Reglas

- Cada fase debe generar algo **verificable** (un checkpoint).
- Seguir un orden lógico: preparación → núcleo → funcionalidades → pulido.
- Los checkpoints deben ser comandos ejecutables, no descripciones vagas.

### Template — Genera este archivo en `docs/01_plan.md`

```markdown
# [Nombre del Proyecto] - Plan de Implementación

**Versión:** 1.0
**Fecha:** YYYY-MM-DD

## Convenciones

- [ ] = Pendiente
- [x] = Completado
- [~] = En progreso

## Fase 1: Nombre de la Fase

**Objetivo:** Qué se logra al completar esta fase.

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
# Comando para verificar que la fase funciona
```

---

## Fase 2: ...

(Repetir estructura por cada fase)
```

---

## Fase 3: Reglas para Agentes

**Objetivo:** Establecer las normas de trabajo para todos los agentes de IA que participen en el proyecto.

**Archivo destino:** `AGENTS.md` (en la raíz del proyecto)

### Reglas

- Este documento se crea **después** de tener el scaffold inicial del proyecto.
- Debe contener comandos reales y actuales.
- Actualizarlo cuando cambien convenciones o tecnologías.

### Template — Genera este archivo en `AGENTS.md`

```markdown
# [Nombre del Proyecto] - Reglas para Agentes IA

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
```

### Sugerencia de contenido para AGENTS.md del proyecto

Al generar el `AGENTS.md` del proyecto destino, incluir estas secciones basadas en lo capturado en las fases anteriores:

| Sección | Fuente |
|---------|--------|
| Overview | Fase 0 (descripción del proyecto) |
| Tech Stack | Fase 1 (sección Tecnologías) |
| Commands | Fase 1 o 2 (herramientas de build/test) |
| Project Structure | Fase 1 (sección Estructura de Archivos) |
| Code Conventions | Fase 0 (convenciones del usuario) |
| Testing Strategy | Fase 1 (requerimientos no funcionales) |
| Prohibiciones | Fase 1 (restricciones técnicas) |

---

## Fase 4: Ejecución

**Objetivo:** Implementar el plan de forma controlada, fase por fase, verificando cada checkpoint.

**Archivo destino:** `docs/02_decisions.md`

### Reglas de ejecución

1. **Leer documentos base al inicio de cada sesión.** Siempre leer: `00_spec.md`, `01_plan.md`, `02_decisions.md`.
2. **Seguir estrictamente el orden del plan.**
3. **Verificar el checkpoint de cada fase antes de avanzar.**
4. **Si un checkpoint falla, resolverlo antes de continuar.**
5. **No agregar funcionalidades fuera del plan.** Crear una nueva fase o issue si es necesario.
6. **Toda decisión significativa se documenta antes de implementarla.**
7. **El usuario mantiene el control total de Git. La IA NO realiza commits.**
8. **Trabajar idealmente una o dos fases por sesión** para gestionar la ventana de contexto.
9. **La IA tiene autorización explícita para cuestionar inconsistencias, riesgos o fallas detectadas.**

### Template — Genera este archivo en `docs/02_decisions.md`

```markdown
# [Nombre del Proyecto] - Decisiones de Arquitectura y Diseño (ADR)

Registro de decisiones importantes tomadas durante el desarrollo del proyecto.

## Convenciones

- **ID**: ADR-XXX
- **Fecha**: YYYY-MM-DD
- **Estado**: Propuesta | Aceptada | Rechazada | Obsoleta | Modificada

---

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
```

---

## Flujo de Trabajo por Sesión

Cuando el usuario solicite continuar con la implementación:

1. **Leer documentos base** en este orden: `00_spec.md` → `01_plan.md` → `02_decisions.md`.
2. **Identificar la fase actual** buscando el primer checkbox `[ ]` sin completar en `01_plan.md`.
3. **Verificar que la fase anterior fue completada** (todos sus checkboxes en `[x]`).
4. **Ejecutar las tareas** de la fase actual.
5. **Verificar el checkpoint** antes de marcar la fase como completada.
6. **Si hay decisiones significativas**, documentarlas en `02_decisions.md` antes de implementar.
7. **Actualizar checkboxes** en `01_plan.md` a medida que se completan tareas.

---

## Mejores Prácticas

- **Menos es más**: Una especificación concisa es mejor que una extensa.
- **Checkpoints obligatorios**: Si no se puede verificar, la fase no está lista.
- **AGENTS.md vivo**: Actualizarlo si cambian convenciones o comandos.
- **Autorización para Cuestionar**: La IA debe alertar sobre errores, inconsistencias o riesgos detectados.
- **Documentar decisiones**: Toda decisión significativa va en `02_decisions.md`.
- **Sesiones enfocadas**: Mejor una o dos fases por conversación.
- **No hacer commits desde la IA**: El usuario controla git. La IA solo escribe código.

---

## Estructura Recomendada del Proyecto

```
proyecto/
├── AGENTS.md
├── docs/
│   ├── 00_spec.md
│   ├── 01_plan.md
│   └── 02_decisions.md
├── src/
├── tests/
└── README.md
```
