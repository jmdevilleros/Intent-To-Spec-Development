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

---

## Fases de la metodología

### Fase 0: Captura de Intencion

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

**Archivo recomendado**: docs/00_spec.md

**Contenido mínimo**:

Sección                        | Descripción
-------------------------------|------------
Requerimientos Funcionales     | Qué hace el producto y cómo se comporta
Requerimientos No Funcionales  | Rendimiento, seguridad, escalabilidad, compatibilidad
Configuración y Parámetros     | Variables, defaults, rangos y opciones
Tecnologías                    | Stack técnico
Restricciones Técnicas         | Qué debe evitarse o limitarse
Estructura de Archivos         | Arquitectura general del proyecto
Criterios de Aceptación        | Cómo validar que el proyecto está completo

**Reglas**:
- Usar lenguaje claro y accesible, evitando jerga técnica innecesaria.  
- Incluir tablas, ejemplos y detalles visuales cuando aplique.  
- Definir parámetros configurables.
- La especificación describe **qué** se necesita, no **cómo** implementarlo.  
- El usuario debe revisar y **aprobar formalmente** la especificación antes de continuar.

---

### Fase 2: Plan de Implementación

**Objetivo**: Desglosar el proyecto en incrementos lógicos, verificables y manejables.

**Archivo recomendado**: docs/01_plan.md

**Contenido minimo**:

| Seccion | Descripcion |
|---------|-------------|
| Convenciones del plan | Cómo interpretar checkboxes y estados |
| Fases numeradas | Cada fase es un incremento funcional |
| Checklist por fase | Tareas atomicas y verificables |
| Archivos involucrados | Lista de archivos a crear o modificar |
| Checkpoint | Comando o accion para probar que la fase funciona |

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
| Archivo | Accion |
|---------|--------|
| ... | ... |

### Checklist
- [ ] Tarea 1
- [ ] Tarea 2

### Checkpoint
\```
comando que verifica que funciona
\```
```

---

### Fase 3: Reglas para Agentes (AGENTS.md)

**Objetivo**: Establecer las normas de trabajo para todos los agentes de IA que participen en el proyecto.

**Archivo recomendado**: AGENTS.md (en la raíz del proyecto)

**Contenido minimo**:

| Seccion | Descripcion |
|---------|-------------|
Overview               | Descripción breve del proyecto
Tech Stack             | Tecnologías, versiones, dependencias, herramientas
Commands               | Comandos para dev, build, test
Project Structure      | Estructura de carpetas y archivos
Code Conventions       | Estilo de nombres, patrones, restricciones , preferencias de código, etc.
Testing                | Framework, qué y cómo probar
Architecture Notes     | Decisiones de diseño importantes 
Prohibitions           | Qué nunca hacer
Session preparation    | Leer documentos base 00_spec.md, 01_plan.md y 02_decisions.md al inicio de cada sesión

**Reglas**:  
- Este documento se crea **después** de tener el scaffold inicial del proyecto.  
- Debe contener comandos reales y actuales.  
- Actualizarlo cuando cambien convenciones o tecnologías.
- Los documentos 00_spec.md, 01_plan.md y 02_decisions.md son la fuente principal de verdad.

---

### Fase 4: Ejecucion

**Objetivo**: Implementar el plan fase por fase, verificando cada checkpoint.

**Archivo recomendado**: docs/02_decisions.md 

**Formato recomendado**: ADR (Architecture Decision Records)

```
# Nombre del Proyecto - Decisiones de Arquitectura y Diseño (ADR)

Registro de decisiones importantes tomadas durante el desarrollo.

---

## Convenciones

- **Fecha**: YYYY-MM-DD
- **Estado**: Propuesta | Aceptada | Rechazada | Obsoleta
- **Contexto**: Situación que obligó a tomar la decisión
- **Decisión**: Qué se decidió
- **Consecuencias**: Pros, contras y efectos

---

## Decisiones

### [ADR-001] - Fecha - Título corto de la decisión

**Estado**: Aceptada

**Contexto**:  
...

**Decisión**:  
...

**Alternativas consideradas**:  
- Opción 1: ...
- Opción 2: ...

**Consecuencias**:  
- Positivas: ...
- Negativas / Riesgos: ...
- Requiere cambios en: ...
```

**Reglas**:
- Leer documentos base 00_spec.md, 01_plan.md y 02_decisions.md al inicio de cada sesión.
- Seguir el orden del plan.
- Verificar el checkpoint de cada fase antes de avanzar.
- Si un checkpoint falla, arreglar antes de continuar.
- No agregar funcionalidades fuera del plan (crear nueva issue o fase si es necesario).  
- Las decisiones importantes que surjan durante la ejecución se documentarán en docs/02_decisions.md usando formato ADR (Architecture Decision Records).
- El usuario mantiene el control total de Git. La IA **no** realiza commits.  
- Controlar ventana de contexto de la IA: Trabajar idealmente una o dos fases por sesión.

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
- **Checkpoints obligatorios**: si no se puede verificar, la fase no está completa.
- **AGENTS.md vivo**: actualizarlo si cambian convenciones o comandos.
- **No hacer commits desde la IA**: el usuario controla git. La IA solo escribe codigo.
- **Sesiones enfocadas**: no intentar hacer todo en un solo chat.
- **Preguntar antes de asumir**: si algo no esta claro, preguntar al usuario.
- **Autorización para Cuestionar**: La IA tiene permiso explícito y debe cuestionar al usuario cuando detecte errores lógicos, inconsistencias, ambigüedades, posibles problemas de seguridad, rendimiento, escalabilidad o violaciones de las reglas definidas. El usuario aclarará explícitamente cómo proceder en esos casos.
- **Documentar decisiones**: Toda decisión significativa (arquitectura, stack, patrones, trade-offs) debe registrarse para mantener trazabilidad y facilitar futuras revisiones o incorporación de nuevos colaboradores.

---

## Estructura Recomendada del Proyecto

```
proyecto/
├── AGENTS.md              ← reglas para agentes
├── docs/
│   ├── 00_spec.md         ← especificacion
│   └── 01_plan.md         ← plan de implementacion
|   ├── 02_decisions.md    ← Decisiones importantes
├── src/  
│   └── ...
├── tests/  
├── README.md  
```
