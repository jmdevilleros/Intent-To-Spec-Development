# Intent-to-Spec Development (ITSD)

**Metodología de desarrollo asistido por IA**

Transforma ideas vagas en productos funcionales mediante especificaciones claras, planes detallados y reglas explícitas para agentes de código.

---

## Filosofía

El desarrollo con IA alcanza su máximo potencial cuando se elimina la ambigüedad antes de escribir una sola línea de código. **Intent-to-Spec** se basa en tres pilares fundamentales:

1. La IA debe entender **qué** se debe construir (Especificación)
2. La IA debe saber **cómo** construirlo de forma ordenada (Plan de Implementación)
3. La IA debe respetar consistentemente **las reglas** del proyecto (Agentes)

Los tres pilares se complementan con un principio transversal de **trazabilidad**: toda decisión significativa se documenta.

---

## Fases de la Metodología

### Fase 0: Captura de Intención

**Objetivo**: Comprender profundamente la visión del usuario sin hacer suposiciones.

El usuario describe su idea en lenguaje natural. La IA realiza una entrevista estructurada para aclarar tecnologías preferidas, alcance del proyecto, herramientas de build/testing y convenciones deseadas.

- **Entregable**: Decisiones documentadas que alimentan la Fase 1.
- **Regla clave**: Nunca asumir tecnologías ni decisiones técnicas sin documentarlas primero.

### Fase 1: Especificación Detallada

**Objetivo**: Crear un documento claro de requerimientos que sirva como **fuente única de verdad**.

- **Archivo**: `docs/00_spec.md`
- **Contenido**: Requerimientos funcionales y no funcionales, configuración, tecnologías, restricciones técnicas, criterios de aceptación.
- **Regla clave**: El usuario debe revisar y **aprobar formalmente** la especificación antes de continuar.

### Fase 2: Plan de Implementación

**Objetivo**: Desglosar el proyecto en incrementos lógicos, verificables y manejables.

- **Archivo**: `docs/01_plan.md`
- **Contenido**: Fases numeradas, checklist por fase, archivos involucrados, checkpoints verificables.
- **Regla clave**: Cada fase debe generar algo verificable. Si no se puede verificar, la fase no está lista.

### Fase 3: Reglas para Agentes (AGENTS.md)

**Objetivo**: Establecer las normas de trabajo para todos los agentes de IA que participen en el proyecto.

- **Archivo**: `AGENTS.md` (en la raíz del proyecto)
- **Contenido**: Tech stack, comandos, estructura del proyecto, convenciones de código, estrategia de testing, prohibiciones.
- **Regla cardinal**: Antes de cualquier acción, leer completely `docs/00_spec.md`, `docs/01_plan.md` y `docs/02_decisions.md`.

### Fase 4: Ejecución

**Objetivo**: Implementar el plan de forma controlada, fase por fase, verificando cada checkpoint.

- **Archivo**: `docs/02_decisions.md` (formato ADR - Architecture Decision Records)
- **Reglas clave**:
  - Seguir estrictamente el orden del plan.
  - Verificar el checkpoint de cada fase antes de avanzar.
  - Documentar toda decisión significativa antes de implementarla.
  - El usuario mantiene el control total de Git. La IA **no** realiza commits.

---

## Flujo Resumido

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

---

## Cómo Empezar a Usar ITSD

### Paso 1: Prepara tu proyecto

Crea o abre tu repositorio y asegúrate de tener Git inicializado.

### Paso 2: Copia los templates

Copia los templates de esta metodología a tu proyecto:

```
tu-proyecto/
├── AGENTS.md              ← copiar de templates/AGENTS_template.md
├── docs/
│   ├── 00_spec.md         ← copiar de templates/00_spec_template.md
│   ├── 01_plan.md         ← copiar de templates/01_plan_template.md
│   └── 02_decisions.md    ← copiar de templates/02_decisions_template.md
├── src/
├── tests/
└── README.md
```

### Paso 3: Ejecuta las fases en orden

1. **Fase 0**: Inicia una conversación con tu agente de IA y describe tu idea. Responde sus preguntas de forma detallada.
2. **Fase 1**: Con las decisiones documentadas, completa el template `00_spec.md`. Revísalo y apruébalo formalmente.
3. **Fase 2**: A partir de la spec aprobada, completa el template `01_plan.md` desglosando el proyecto en fases verificables.
4. **Fase 3**: Completa el template `AGENTS.md` con las reglas específicas de tu proyecto (tech stack, comandos, prohibiciones).
5. **Fase 4**: Ejecuta el plan fase por fase. Usa checkpoints para validar. Documenta decisiones importantes en `02_decisions.md`.

### Paso 4: Mantén la trazabilidad

Actualiza `02_decisions.md` con cada decisión significativa de arquitectura o diseño que surja durante la implementación.

---

## Templates Incluidos

| Template | Fase | Descripción |
|----------|------|-------------|
| `templates/00_spec_template.md` | Fase 1 | Especificación detallada de requerimientos |
| `templates/01_plan_template.md` | Fase 2 | Plan de implementación con fases y checkpoints |
| `templates/AGENTS_template.md` | Fase 3 | Reglas y convenciones para agentes de IA |
| `templates/02_decisions_template.md` | Fase 4 | Registro de decisiones de arquitectura (ADR) |

---

## Mejores Prácticas

- **Menos es más**: Una especificación concisa es mejor que una extensa.
- **Checkpoints obligatorios**: Si no se puede verificar, la fase no está lista.
- **AGENTS.md vivo**: Actualízalo si cambian convenciones o comandos.
- **Autorización para cuestionar**: La IA debe alertar sobre errores, inconsistencias o riesgos detectados.
- **Documentar decisiones**: Toda decisión significativa va en `02_decisions.md`.
- **Sesiones enfocadas**: Mejor una o dos fases por conversación con la IA.
- **No hacer commits desde la IA**: El usuario controla Git. La IA solo escribe código.
