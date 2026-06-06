# Intent-to-Spec Development (ITSD)

**Metodología de desarrollo asistido por IA**  
Transforma ideas vagas en productos funcionales mediante especificaciones claras, planes detallados y reglas explícitas para agentes de código.

---

## Filosofía

El desarrollo con IA alcanza su máximo potencial cuando se elimina la ambigüedad antes de escribir una sola línea de código.

**Intent-to-Spec** se basa en tres pilares fundamentales:

1. La IA debe entender **qué** se debe construir (Especificación)  
2. La IA debe saber **cómo** construirlo de forma ordenada (Plan de Implementación)  
3. La IA debe respetar consistentemente **las reglas** del proyecto (Agentes)

Cada fase reduce drásticamente errores, refactorizaciones costosas y malentendidos. Sin especificación, la IA adivina. Sin plan, improvisa. Sin reglas, genera inconsistencias.

Los tres pilares se complementan con un principio transversal de trazabilidad: toda decisión significativa se documenta.

---

## Fases de la Metodología

### Fase 0: Captura de Intención

**Objetivo**: Comprender profundamente la visión del usuario sin hacer suposiciones.

El usuario describe su idea en lenguaje natural. La IA realiza una entrevista estructurada para aclarar:

- Tecnologías preferidas (o si se debe recomendar un stack)  
- Alcance del proyecto (MVP, versión completa, prototipo, etc.)  
- Requerimientos de herramientas de build, testing y despliegue  
- Convenciones deseadas (nomenclatura, testing, linting, etc.)

**Entregable**: Conjunto de decisiones documentadas que alimentan la Fase 1.

**Reglas clave**:  
- Nunca asumir tecnologías ni decisiones técnicas.  
- No avanzar a implementación sin antes documentar la intención.  
- Registrar todas las decisiones tomadas por el usuario.

---

### Fase 1: Especificación Detallada

**Objetivo**: Crear un documento claro de requerimientos que sirva como **fuente única de verdad**.

**Archivo recomendado**: `docs/00_spec.md`

**Contenido mínimo**:

| Sección                        | Descripción |
|--------------------------------|-------------|
| Requerimientos Funcionales     | Qué hace el producto y cómo se comporta |
| Requerimientos No Funcionales  | Rendimiento, seguridad, escalabilidad, compatibilidad |
| Configuración y Parámetros     | Variables, defaults, rangos y opciones |
| Tecnologías                    | Stack técnico seleccionado |
| Restricciones Técnicas         | Qué debe evitarse o limitarse |
| Estructura de Archivos         | Arquitectura general del proyecto |
| Criterios de Aceptación        | Cómo validar que el proyecto está completo |

**Reglas**:
- Usar lenguaje claro y accesible, evitando jerga técnica innecesaria.  
- Incluir tablas, ejemplos y detalles visuales cuando aplique.  
- Definir todos los parámetros configurables.  
- La especificación describe **qué** se necesita, **no cómo** implementarlo.  
- El usuario debe revisar y **aprobar formalmente** la especificación antes de continuar.

---

### Fase 2: Plan de Implementación

**Objetivo**: Desglosar el proyecto en incrementos lógicos, verificables y manejables.

**Archivo recomendado**: `docs/01_plan.md`

**Contenido mínimo**:

| Sección                    | Descripción |
|----------------------------|-------------|
| Convenciones del plan      | Cómo interpretar checkboxes y estados |
| Fases numeradas            | Incrementos funcionales claros |
| Checklist por fase         | Tareas atómicas y verificables |
| Archivos involucrados      | Lista de archivos a crear o modificar |
| Checkpoint                 | Comando o acción para validar la fase |

**Reglas**:
- Cada fase debe generar algo **verificable** (un checkpoint).  
- Seguir un orden lógico: preparación → núcleo → funcionalidades → pulido.

**Formato recomendado**:

```markdown
# Nombre del Proyecto - Plan de Implementación

## Convenciones
- [ ] = pendiente
- [x] = completado

## Fase N: Nombre de la Fase
**Objetivo**: Qué se logra en esta fase.

### Archivos a crear/modificar
| Archivo | Acción |
|---------|--------|
| ...     | ...    |

### Checklist
- [ ] Tarea 1
- [ ] Tarea 2

### Checkpoint
```
comando que verifica que funciona
```
```

---

### Fase 3: Reglas para Agentes (AGENTS.md)

**Objetivo**: Establecer las normas de trabajo para todos los agentes de IA que participen en el proyecto.

**Archivo recomendado**: `AGENTS.md` (en la raíz del proyecto)

**Contenido mínimo**:

| Sección              | Descripción |
|----------------------|-------------|
| Overview             | Descripción breve del proyecto |
| Tech Stack           | Tecnologías, versiones, dependencias y herramientas |
| Commands             | Comandos para dev, build, test, etc. |
| Project Structure    | Estructura de carpetas y archivos |
| Code Conventions     | Estilo de nombres, patrones y restricciones |
| Testing              | Framework, qué y cómo probar |
| Architecture Notes   | Decisiones de diseño importantes |
| Prohibitions         | Qué nunca hacer |
| Session Preparation  | Reglas de lectura de documentos base |

**Reglas**:
- Este documento se crea **después** de tener el scaffold inicial del proyecto.  
- Debe contener comandos reales y actuales.  
- Actualizarlo cuando cambien convenciones o tecnologías.

**Regla Cardinal**:
Antes de cualquier acción o generación de código, leer completamente y tener en contexto:
- `docs/00_spec.md` (fuente de requerimientos)
- `docs/01_plan.md` (plan actual)
- `docs/02_decisions.md` (decisiones tomadas)

---

### Fase 4: Ejecución

**Objetivo**: Implementar el plan de forma controlada, fase por fase, verificando cada checkpoint.

Durante esta fase se mantendrá el archivo docs/02_decisions.md, donde se registrarán todas las decisiones importantes de arquitectura, diseño o estratégicas que surjan durante la implementación.

**Archivo recomendado**: `docs/02_decisions.md`

**Formato recomendado**: ADR (Architecture Decision Records)

```
# Decisiones de Arquitectura y Diseño

## Convenciones
- **ID**: ADR-001, ADR-002, ...
- **Fecha**: YYYY-MM-DD
- **Estado**: Propuesta | Aceptada | Rechazada | Obsoleta

---

### [ADR-001] - Título corto de la decisión

**Fecha**: 2026-06-06  
**Estado**: Aceptada

**Contexto**  
(¿Qué problema o situación obligó a tomar esta decisión?)

**Decisión**  
(Qué se decidió y por qué)

**Alternativas consideradas**  
- Opción 1: ...
- Opción 2: ...

**Consecuencias**  
- Positivas: ...
- Negativas / Riesgos: ...
- Requiere actualizar: ...
```

**Reglas**:
- Leer los documentos base (`00_spec.md`, `01_plan.md` y `02_decisions.md`) al inicio de cada sesión.  
- Seguir estrictamente el orden del plan.  
- Verificar el checkpoint de cada fase antes de avanzar.  
- Si un checkpoint falla, resolverlo antes de continuar.  
- No agregar funcionalidades fuera del plan (crear nueva fase o issue si es necesario).  
- Toda decisión significativa que afecte la arquitectura, tecnologías, patrones de diseño o trade-offs debe documentarse antes de implementarla.
- El usuario mantiene el control total de Git. La IA **no** realiza commits.  
- Controlar ventana de contexto de la IA: Trabajar idealmente una o dos fases por sesión.  
- La IA tiene autorización explícita para cuestionar inconsistencias, riesgos o fallas detectadas.

---

## Flujo Resumido

```
IDEA DEL USUARIO
       │
       ▼
┌─────────────┐
│  Fase 0     │  Captura de intencion (preguntas)
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
│  Fase 4     │  Ejecucion del plan
│  Build      │  ← fase por fase, verificando checkpoints
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Producto   │
└─────────────┘
```

---

## Mejores Prácticas

- **Menos es más**: Una especificación concisa es mejor que una extensa.  
- **Checkpoints obligatorios**: Si no se puede verificar, la fase no está lista.  
- **AGENTS.md vivo**: Actualizarlo si cambian convenciones o comandos. 
- **Autorización para Cuestionar**: La IA debe alertar sobre errores, inconsistencias o riesgos detectados.  
- **Documentar decisiones**: Toda decisión significativa va en `02_decisions.md`.  
- **Sesiones enfocadas**: Mejor una o dos fases por conversación.
- **No hacer commits desde la IA**: El usuario controla git. La IA solo escribe codigo.

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

