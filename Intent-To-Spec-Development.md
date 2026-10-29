# Intent-to-Spec Development (ITSD)

**Metodología de desarrollo asistido por IA**  
Transforma ideas vagas en productos funcionales mediante especificaciones claras, planes detallados y reglas explícitas para agentes de código.

Esta página describe **L0**. En L1–L3, las compuertas, los supuestos, el git y el largo de sesión los define `ITSD-A.md`. Si el proyecto declara ciclos, la lectura la define `ITSD-C.md`.

**Dos numeraciones.** Fase ITSD es la 0, la 1, la 2, la 3 o la 4 del método. Fase del plan es un heading de `docs/01_plan.md` o del plan del ciclo, y su número es el del producto. Una regla operativa nombra cuál de las dos es. «Fase 0» a «Fase 4» nombran solo fases ITSD.

---

## Filosofía

El desarrollo con IA alcanza su máximo potencial cuando se elimina la ambigüedad antes de escribir una sola línea de código.

**Intent-to-Spec** se basa en tres pilares fundamentales:

1. La IA debe entender **qué** se debe construir (Especificación)  
2. La IA debe saber **cómo** construirlo de forma ordenada (Plan de Implementación)  
3. La IA debe respetar consistentemente **las reglas** del proyecto (Agentes)

Cada fase ITSD reduce errores, refactorizaciones costosas y malentendidos. Sin especificación, la IA adivina. Sin plan, improvisa. Sin reglas, genera inconsistencias.

Los tres pilares se complementan con un principio transversal de trazabilidad: toda decisión significativa se documenta. Cada requisito tiene un solo archivo vigente.

---

## Fases de la Metodología

ITSD consta de **5 fases ITSD**, numeradas de la **Fase 0** a la **Fase 4**.

No se abre la fase ITSD siguiente con el entregable anterior vacío. Quién lo cierra lo dice la tabla de compuertas de `ITSD-A.md`. En L0, el cierre es el de esta página.

### Cierres de L0

La tabla completa está en `ITSD-A.md`. En L0 se usa esta lista. En L1–L3 manda la tabla.

- **Intención.** El usuario responde. Si no hay stack, se recomienda uno después de saber el alcance y se espera un sí.
- **Spec.** Aprobación explícita en el spec.
- **Plan y `AGENTS.md`.** Se muestran. La ejecución espera la casilla de cierre del plan.
- **Cada fase del plan.** Checkpoint verde y aceptación del usuario antes de marcarla `[x]`.
- **Git.** La persona hace los commits.
- **ADR.** Se escribe antes de modificar código.
- **Sesión.** Una o dos fases del plan.

### Fase 0: Captura de Intención

**Objetivo**: Comprender la visión del usuario y dejarla escrita.

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

**Entregable**: `docs/00_intent.md`. Alimenta la fase ITSD 1.

**Reglas clave**:  
- No se abre la fase ITSD 1 sin `docs/00_intent.md`.  
- La respuesta a cada pregunta se escribe en ese archivo.  
- En L0 la tecnología se cierra con un sí. En L1–L3 los supuestos los define `ITSD-A.md`.

---

### Fase 1: Especificación Detallada

**Objetivo**: Crear el documento de requerimientos. Cada requisito tiene un solo archivo vigente.

**Archivo recomendado**: `docs/00_spec.md`

**Contenido mínimo**:

| Sección                        | Descripción |
|--------------------------------|-------------|
| Requerimientos Funcionales     | Comportamiento observable y criterio de aceptación |
| Requerimientos No Funcionales  | Rendimiento, seguridad, escalabilidad, compatibilidad |
| Configuración y Parámetros     | Variables, defaults, rangos y opciones |
| Tecnologías                    | Stack ya elegido |
| Restricciones Técnicas         | Qué debe evitarse o limitarse |
| Estructura de Archivos         | Carpetas ya decididas |
| Criterios de Aceptación        | Cómo validar que el proyecto está completo |

**Reglas**:
- Usar lenguaje claro y accesible, evitando jerga técnica innecesaria.  
- Incluir tablas, ejemplos y detalles visuales cuando aplique.  
- Definir todos los parámetros configurables.  
- Los RF describen comportamiento observable y su criterio de aceptación. Tecnologías, estructura de carpetas y restricciones son decisiones ya tomadas.  
- En L0 y L1 el usuario aprueba el spec antes de seguir. En L2 y L3 se notifica y no se espera.  
- Si el proyecto declara ciclos, este archivo guarda solo las reglas que cruzan ciclos, con sus valores. Los RF del ciclo viven en su spec. Ver `ITSD-C.md`.

---

### Fase 2: Plan de Implementación

**Objetivo**: Desglosar el producto en fases del plan, verificables y ordenadas.

**Archivo recomendado**: `docs/01_plan.md`

**Contenido mínimo**:

| Sección                    | Descripción |
|----------------------------|-------------|
| Convenciones del plan      | Cómo interpretar checkboxes y estados |
| Fases del plan numeradas   | Incrementos del producto |
| Checklist por fase del plan | Tareas atómicas y verificables |
| Archivos involucrados      | Lista de archivos a crear o modificar |
| Checkpoint                 | Comando para validar la fase del plan |

**Reglas**:
- Cada fase del plan debe generar algo **verificable** (un checkpoint).  
- El orden es: preparación → comportamiento base → funcionalidades → pulido.  
- Los checkpoints son comandos ejecutables.  
- `[~]` pertenece a la fase del plan en curso. Esa fase es el primer bloque con alguna casilla distinta de `[x]`.  
- Si el proyecto declara ciclos, este archivo no conserva los checklists cerrados. Nombra el ciclo abierto, apunta a su plan y guarda «Última fase del plan cerrada». Ver `ITSD-C.md`.

**Formato recomendado**: el de `templates/01_plan_template.md`. Tiene la forma de un solo ciclo y la forma con ciclos.

---

### Fase 3: Reglas para Agentes (AGENTS.md)

**Objetivo**: Dejar el proyecto ejecutable y las normas escritas para los agentes.

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
- Primero, el scaffold mínimo: la herramienta de build queda instalada y un comando de prueba ya corrió, aunque el producto aún no haga nada.  
- Después, `AGENTS.md`, con esos comandos.  
- El scaffold no es la fase 1 del plan. El plan empieza en el primer comportamiento del producto.  
- Actualizarlo cuando cambien convenciones o tecnologías.

**Regla cardinal**:

Sin ciclos, antes de cualquier acción, leer por completo:

- `docs/00_spec.md`
- `docs/01_plan.md`
- `docs/02_decisions.md`

Si el proyecto declara ciclos, esa lectura la define `ITSD-C.md`: el núcleo y el par del ciclo en curso. `docs/02_decisions.md` entra en esa lectura: índice y ADR en juego. `docs/decisions/archive.md` entra solo si la tarea nombra ese archivo o un ADR cuyo texto ya no está en `docs/02_decisions.md`.

---

### Fase 4: Ejecución

**Objetivo**: Implementar las fases del plan, verificando cada checkpoint.

Durante la fase ITSD 4 se mantiene `docs/02_decisions.md`. Ahí se registran las decisiones de arquitectura, diseño o estrategia.

**Archivo recomendado**: `docs/02_decisions.md`

El cuerpo de un ADR aceptado no se reescribe. Un cambio es un ADR nuevo. El ADR anterior pasa a Obsoleta. Ese ADR nuevo dice qué cláusula deja de mandar.

Un requisito vive en un solo archivo vigente. El ADR no copia el requisito. En la misma tarea se edita el archivo donde ese requisito vive.

**Formato**:

```markdown
### ADR-001 - YYYY-MM-DD - Título corto de la decisión

**Estado**: Aceptada

**Contexto**:
Qué situación obligó a decidir.

**Decisión**:
Qué se decidió exactamente.

**Alternativas consideradas**:
- Opción 1: ...
- Opción 2: ...

**Consecuencias**:
- Positivas: ...
- Negativas / Riesgos: ...
- Requiere cambios en: ...
```

Estados: Propuesta, Aceptada, Rechazada, Obsoleta. Las dos formas del archivo, sin ciclos y con ciclos, están en `templates/02_decisions_template.md`.

## Algoritmo de sesión

Cuando el usuario solicite continuar con la implementación:

1. Nivel. Si existe `AGENTS.md`, el nivel es el de ese archivo. Si no existe, el nivel es el de `docs/00_intent.md`. Si no existe ninguno, el nivel es L0. Si los dos existen y discrepan, no se escribe código: se muestran los dos valores y se deja el menor en los dos archivos.
2. Plan vigente. Sin ciclos, el plan es `docs/01_plan.md` y se leen enteros `docs/00_spec.md`, `docs/01_plan.md` y `docs/02_decisions.md`. Con ciclos declarados, se lee el núcleo descrito en `ITSD-C.md` y el par del ciclo en curso. `docs/02_decisions.md` entra en esa lectura. `docs/decisions/archive.md` entra solo si la tarea nombra ese archivo o un ADR cuyo texto ya no está en `docs/02_decisions.md`.
3. Fase del plan en curso. Es el primer bloque del plan vigente con alguna casilla distinta de `[x]`. Una casilla `[~]` hace corriente a ese bloque.
4. La fase del plan anterior está cerrada si sus casillas están en `[x]`, o si su número es menor o igual que «Última fase del plan cerrada» en `docs/01_plan.md`. No se abre un plan cerrado para comprobarlo.
5. Se ejecuta esa fase del plan. Si una decisión cambia un requisito, el ADR y la edición del único archivo donde vive ese requisito ocurren en la misma tarea.
6. El checkpoint se ejecuta antes de avanzar. Si falla, no se sigue. La fase se marca `[x]` cuando el checkpoint pasa y la compuerta de la tabla está cerrada.
7. Las casillas se escriben en el plan vigente. Con ciclos, `docs/01_plan.md` no recibe checklists.

En L0 los commits los hace la persona. En L1–L3 manda la fila Git de `ITSD-A.md`.

En L0 el ADR se escribe antes de modificar código. En L1–L3 se escribe y se continúa, salvo regla de parada.

En L0, una o dos fases del plan por sesión. En L1–L3 el tope es el presupuesto y la posición queda en `docs/03_state.md`.

La IA tiene autorización explícita para cuestionar inconsistencias, riesgos o fallas detectadas.

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
│  Fase 4     │  Ejecucion del plan
│  Build      │  ← fase del plan, verificando checkpoints
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Producto   │
└─────────────┘
```

Cierres de L0. En L1–L3 cierra la tabla de `ITSD-A.md`.

---

## Mejores Prácticas

- **Menos es más**: Una especificación concisa es mejor que una extensa.  
- **Checkpoints obligatorios**: Si no se puede verificar, la fase del plan no está lista.  
- **AGENTS.md vivo**: Actualizarlo si cambian convenciones o comandos. 
- **Autorización para Cuestionar**: La IA debe alertar sobre errores, inconsistencias o riesgos detectados.  
- **Documentar decisiones**: Toda decisión significativa va en `docs/02_decisions.md`. Si cambia un requisito, el mismo paso edita el archivo donde ese requisito vive.  
- **Sesiones enfocadas**: En L0, una o dos fases del plan por conversación. En L1–L3 el tope es el presupuesto.
- **Commits**: En L0 los commits los hace la persona. En L1–L3 manda la fila Git de `ITSD-A.md`.
- **Un ciclo, un par de archivos**: Cuando el producto abre otro ciclo, no se alarga el spec único. Se declara ITSD-C.

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

Esa estructura es la de un producto de un solo ciclo. Con más de un ciclo, ver `ITSD-C.md`.
