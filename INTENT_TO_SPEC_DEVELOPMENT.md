# Intent-to-Spec Development

Metodologia de desarrollo asistido con IA. Transforma una idea vaga en un producto funcional mediante especificaciones, planes de implementacion y reglas para agentes de codigo.

---

## Filosofia

El desarrollo asistido con IA funciona mejor cuando hay claridad total antes de escribir codigo. Este metodo garantiza que:

1. La IA entiende **que** construir (spec)
2. La IA sabe **como** construirlo (plan)
3. La IA respeta **las reglas** del proyecto (agents)

Cada paso reduce ambiguedad y errores. Sin spec, la IA adivina. Sin plan, la IA improvisa. Sin reglas, la IA inconsistente.

---

## Fases del Metodo

### Fase 0: Captura de Intencion

**Objetivo**: Entender que quiere el usuario, sin presuponer nada.

El usuario describe su idea en lenguaje natural. La IA pregunta para clarificar:

- Que tecnologias preferir (si las hay)
- Que alcance tiene (MVP, completo, prototipo)
- Que herramientas de build/bundling quiere
- Que convenciones prefiere (testing, linting, naming)

**Entregable**: Respuestas claras que alimentan la Fase 1.

**Reglas**:
- No asumir tecnologias. Preguntar siempre.
- No saltar a implementar. Primero entender.
- Documentar las decisiones del usuario.

---

### Fase 1: Especificacion Detallada

**Objetivo**: Documento con todos los requerimientos del proyecto, sin mencionar implementacion.

**Archivo tipico**: `docs/00_spec.md`

**Contenido minimo**:

| Seccion | Descripcion |
|---------|-------------|
| Tecnologias | Stack elegido por el usuario |
| Requerimientos funcionales | Que hace el producto, como se comporta |
| Requerimientos no funcionales | Performance, compatibilidad, restricciones tecnicas |
| Estructura de archivos | Arquitectura del proyecto |
| Criterios de aceptacion | Como se verifica que esta completo |

**Reglas**:
- Escribir en lenguaje claro, sin jerga tecnica innecesaria.
- Incluir tablas de parametros, rangos, defaults.
- Definir todas las variables configurables.
- Incluir colores, tamanos, posiciones (si aplica).
- La spec es **requerimientos**, no codigo. No mencionar clases ni funciones.
- El usuario debe revisar y aprobar antes de continuar.

**Formato recomendado**:

```markdown
# Nombre del Proyecto - Especificacion

Breve descripcion del producto.

## 1. Tecnologias
## 2. Requerimientos Funcionales
## 3. Requerimientos No Funcionales
## 4. Configuracion y Parametros
## 5. Estructura de Archivos
## 6. Restricciones Tecnicas
## 7. Criterios de Aceptacion
```

---

### Fase 2: Plan de Implementacion

**Objetivo**: Desglose progresivo de tareas con checkpoints verificables.

**Archivo tipico**: `docs/01_plan.md`

**Contenido minimo**:

| Seccion | Descripcion |
|---------|-------------|
| Convenciones del plan | Significado de checkboxes, como leerlo |
| Fases numeradas | Cada fase = un incremento funcional |
| Checklist por fase | Tareas atomicas y verificables |
| Checkpoints | Comando o accion para probar que la fase funciona |
| Estimacion de tiempo | Tiempo por fase o por sesion |

**Reglas**:
- Cada fase debe generar algo **probable** (un checkpoint).
- Las fases deben ser **independientes** (una fase no depende de otra no completada).
- El orden debe ser **logico** (setup → core → features → polish).
- Incluir archivos a crear/modificar en cada fase.
- Las fases deben ser **testables** sin necesidad de completar todo el proyecto.

**Formato recomendado**:

```markdown
# Nombre del Proyecto - Plan de Desarrollo

## Convenciones
- [ ] = pendiente
- [x] = completado

## Fase N: Nombre de la Fase
**Objetivo**: Que se logra en esta fase.

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

**Objetivo**: Documento que guia a la IA sobre como trabajar en el proyecto.

**Archivo tipico**: `AGENTS.md` en la raiz del proyecto.

**Contenido minimo**:

| Seccion | Descripcion |
|---------|-------------|
| Overview | Que es el proyecto |
| Tech Stack | Dependencias y herramientas |
| Commands | Comandos para dev, build, test |
| Project Structure | Arquitectura de carpetas |
| Code Conventions | Naming, patterns, restricciones |
| Testing | Framework, que testear, como |
| Architecture Notes | Decisiones de diseno importantes |
| Key Patterns | Patrones recurrentes del proyecto |

**Reglas**:
- Incluir **comandos reales** del `package.json` (no hipotéticos).
- Definir convenciones de **naming** (PascalCase, camelCase, snake_case, etc.).
- Explicitar **que NO hacer** (ej: "nunca hacer commits", "no usar any").
- Mencionar **que testear** y que no.
- El AGENTS.md se crea **despues** de tener el scaffold funcional (no al inicio).

**Formato recomendado**:

```markdown
# Nombre del Proyecto

Breve descripcion.

## Tech Stack
## Commands
## Project Structure
## Code Conventions
## Testing
## Architecture Notes
## Key Patterns
```

---

### Fase 4: Ejecucion

**Objetivo**: Implementar el plan fase por fase, verificando cada checkpoint.

**Reglas**:
- Seguir el orden del plan.
- Verificar el checkpoint de cada fase antes de avanzar.
- Si un checkpoint falla, arreglar antes de continuar.
- No saltar fases.
- No agregar features extra no planificadas (ir al plan si se necesita algo nuevo).

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
│  Fase 3     │  AGENTS.md (reglas para IA)
│  Agents     │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Fase 4     │  Ejecucion del plan
│  Build      │  ← fase por fase, verificando checkpoints
└─────────────┘
```

---

## Tips

- **Spec corta es mejor que spec larga**: si no esta en la spec, no existe. Escribir solo lo necesario.
- **Plan con checkpoints**: si no se puede probar, no esta completo.
- **AGENTS.md vivo**: actualizarlo si cambian convenciones o comandos.
- **No hacer commits desde la IA**: el usuario controla git. La IA solo escribe codigo.
- **Una sesion = una o dos fases**: no intentar hacer todo en un solo chat.
- **Preguntar antes de asumir**: si algo no esta claro, preguntar al usuario.

---

## Archivos Tipicos

```
proyecto/
├── AGENTS.md              ← reglas para agentes
├── docs/
│   ├── 00_spec.md         ← especificacion
│   └── 01_plan.md         ← plan de implementacion
└── src/
    └── ...
```
