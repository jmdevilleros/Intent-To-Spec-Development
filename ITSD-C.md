# ITSD-C: Producto por ciclos

**Modo opcional de ITSD para un producto que continúa después del primer ciclo.**

ITSD-C no reemplaza a ITSD ni a ITSD-A. No añade fases. No cambia los niveles L0–L3.

El proyecto lo declara en `AGENTS.md`. Sin esa declaración hay un solo `docs/00_spec.md`, un solo `docs/01_plan.md` y un solo `docs/02_decisions.md`, y la sesión los lee enteros.

---

## Cuándo usarlo

Úsalo cuando el segundo ciclo de producto se escribiría, de otro modo, dentro del spec o del plan únicos, o cuando la lectura de sesión incluiría un ciclo ya cerrado.

El primer ciclo se construye con las fases 0 a 4 y deja el núcleo. ITSD-C empieza al abrir el segundo ciclo.

## Qué es un ciclo

Un ciclo es un incremento acotado del producto. Tiene su propia intención, sus propios requerimientos y un plan con fases verificables. Depende del núcleo y no lo reescribe.

El proyecto elige el nombre de cara al usuario: mundo, módulo, capítulo. En la metodología el nombre es **ciclo**.

## Declaración

En `AGENTS.md`, además del nivel de autonomía:

```markdown
## Ciclos (ITSD-C)

- **Modo:** ciclos. Ver `ITSD-C.md`
- **Carpeta:** `docs/cycles/`
- **Ciclo en curso:** `docs/cycles/02_spec.md` y `docs/cycles/02_plan.md`
```

La carpeta puede llamarse de otra forma. El ciclo en curso nombra los dos archivos de esta sesión. El nivel de autonomía se declara en su propia sección. Declarar ciclos no sube ni baja el nivel.

## Las ocho reglas

### 1. Núcleo

Estos archivos siguen siendo la lectura de sesión y se quedan cortos:

| Archivo | Qué guarda |
|---------|------------|
| `docs/00_intent.md` | Intención viva, si el proyecto usa ITSD-A |
| `docs/00_spec.md` | Reglas que cruzan ciclos. Parámetros compartidos incluidos |
| `docs/01_plan.md` | Plan vivo: apunta a las fases abiertas |
| `docs/02_decisions.md` | Índice de ADR y el ADR en juego, completo |
| `docs/03_state.md` | Estado para reanudar, si el proyecto usa ITSD-A |

`00_spec.md` no acumula los RF de cada ciclo. Si dos ciclos necesitan la misma regla, la regla está en el núcleo, escrita ahí, con sus valores. Un puntero histórico puede existir. Una remisión del estilo «el detalle obligatorio está en el ciclo cerrado» no cumple esta regla: la sesión tendría que abrir ese ciclo o adivinar.

El ciclo no copia el núcleo con otras palabras.

Al abrir el segundo ciclo se parte el expediente del primero. Los RF propios, los parámetros propios y las fases cerradas pasan al par de ese ciclo. En el núcleo quedan las reglas que cruzan ciclos, con sus valores. `docs/01_plan.md` nombra el ciclo abierto y apunta a su plan. Si existe `docs/00_intent.md`, se reescribe y no cuenta el ciclo cerrado. El texto anterior puede guardarse junto al ciclo. No es obligatorio. El corte es un ADR y dice qué cláusula del expediente único deja de mandar.

### 2. Par

Cada ciclo tiene dos archivos:

- un spec: qué cambia, de qué depende, qué no reescribe, sus RF y sus parámetros propios;
- un plan: las fases de ese ciclo, cada una con checkpoint ejecutable.

Los RF del ciclo viven en su spec. La matriz RF → verificación sigue a esos RF. Un RF del núcleo sigue en el núcleo.

El spec del ciclo nombra el núcleo del que depende. Dice qué decisiones del ciclo cerrado no se vuelven a abrir.

Los `RF-XXX` siguen la secuencia del producto, igual que las fases del plan. El ciclo nuevo no vuelve a empezar en `RF-001`.

### 3. Plan vivo

`docs/01_plan.md` no conserva los checklists del ciclo cerrado. Nombra el ciclo abierto y apunta a su plan.

El plan del ciclo contiene solo sus fases. La numeración de fases es una sola para todo el producto: el ciclo siguiente sigue en el número donde terminó el anterior. `03_state.md` habla de esa secuencia.

### 4. Lectura

Al inicio de cada sesión se lee el núcleo y el par del ciclo en curso.

No entran en esa lectura:

- el spec o el plan de otro ciclo;
- un plan cerrado;
- el archivo de ADR, si existe;
- un roadmap o documento de visión.

Esos archivos se abren cuando la tarea cambia el comportamiento de ese ciclo, cuando nombra ese archivo, o cuando nombra el ADR concreto. Nombrar el producto, o mencionar el ciclo cerrado mientras la tarea es de otro ciclo, no obliga a leerlo.

### 5. La visión no es spec

Un roadmap puede existir y puede proponer ciclos futuros. No concede RF, no modifica el núcleo y no autoriza a codificar. Entra al spec solo cuando ese ciclo se abre y su delta se aprueba por la compuerta del nivel.

El roadmap no forma parte de la lectura de sesión.

### 6. Un ADR en juego

`docs/02_decisions.md` es un índice de una línea por ADR, más el texto completo del ADR que el ciclo en curso está usando.

El texto de los ADR anteriores puede moverse a un archivo, por ejemplo `docs/decisions/archive.md`, cuando el índice deja de leerse de un vistazo. No hay un número de ADR a partir del cual archivar sea obligatorio.

Una decisión que cambie dónde viven los specs es un ADR. Ese ADR dice qué cláusula anterior deja de mandar. No se borra la cláusula en silencio.

### 7. Compuerta

Abrir un ciclo repite el tramo que corresponde: intención de lo que el ciclo cambia, spec, plan. Quién aprueba cada compuerta es el nivel declarado en `AGENTS.md`.

- En L0 la persona aprueba el delta y cada fase de código, como en ITSD clásico.
- En L1–L3 valen las compuertas de `ITSD-A.md`. ITSD-C no las estrecha ni las afloja.

Abrir el segundo ciclo parte el expediente del primero, como dice la regla 1. Abrir un ciclo no reabre el ciclo cerrado y no cambia el nivel.

### 8. Prueba de frontera

Si dos ciclos necesitan la misma regla, esa regla se escribe en el núcleo.

Si el spec de un ciclo repite una regla del núcleo con otras palabras, o con otros valores, el spec está mal partido. Se corrige antes de codificar. La alternativa de un spec completo e independiente por ciclo queda descartada: las reglas comunes se copian y se desfasan.

## Qué no exige este modo

- Una carpeta con un nombre fijo. El ejemplo es `docs/cycles/`.
- Un tercer archivo con la intención cerrada del ciclo anterior. Si `00_intent.md` se reescribe, la intención cerrada puede archivarse junto al ciclo. No es obligatorio.
- Archivar los ADR al llegar a un conteo concreto.
- Plantillas de código, de test o de demo distintas de las que ya pide el nivel.

## Estructura de ejemplo

```
proyecto/
├── AGENTS.md                 # nivel de autonomía y declaración de ciclos
└── docs/
    ├── 00_intent.md          # intención viva (ITSD-A)
    ├── 00_spec.md            # reglas que cruzan ciclos
    ├── 01_plan.md            # apunta al ciclo abierto
    ├── 02_decisions.md       # índice + ADR en juego
    ├── 03_state.md           # estado (ITSD-A)
    ├── decisions/
    │   └── archive.md        # opcional
    └── cycles/
        ├── 01_spec.md        # ciclo cerrado: no se lee por defecto
        ├── 01_plan.md
        ├── 02_spec.md        # ciclo en curso
        └── 02_plan.md
```

Los nombres `01_spec.md` y `02_plan.md` son el ejemplo. El proyecto puede usar nombres descriptivos si el índice del núcleo y la declaración de `AGENTS.md` dan la ruta.

Un roadmap, si existe, queda fuera de este árbol de lectura.

## Plantillas

| Plantilla | Uso |
|-----------|-----|
| `templates/cycle_spec_template.md` | Spec de un ciclo |
| `templates/cycle_plan_template.md` | Plan de las fases de ese ciclo |

## Relación con la regla de lectura clásica

La regla cardinal de ITSD pide leer por completo `00_spec.md`, `01_plan.md` y `02_decisions.md` al inicio de cada sesión. Sigue vigente cuando el proyecto no declara ciclos.

Cuando `AGENTS.md` declara ciclos, `ITSD-C.md` prevalece en tres cosas:

1. Qué archivos entran en la lectura de sesión.
2. Dónde viven los RF del ciclo.
3. Dónde está el plan de las fases abiertas.

Los commits, las compuertas y las reglas de parada los decide el nivel. Si ITSD-C y el nivel discrepan en la lectura, manda ITSD-C. Si discrepan en commits o compuertas, manda el nivel.

## Riesgos

| Riesgo | Mitigación |
|--------|------------|
| El núcleo queda demasiado fino y la sesión necesita el ciclo cerrado | La regla 1: la regla compartida se escribe en el núcleo, con sus valores |
| El núcleo se vuelve otro spec único | La regla 8: al núcleo sube solo lo que dos ciclos comparten |
| Dos copias de la misma regla se desfasan | La regla 8: el ciclo no reescribe el núcleo |
| El agente lee el ciclo cerrado por costumbre de la regla cardinal | La regla 4, declarada en `AGENTS.md` y en el skill |
| El segundo ciclo se abre y el primero sigue dentro del núcleo | La regla 1: al abrirlo se parte el expediente del primero |
| Un arreglo del ciclo cerrado se hace sin su spec | La regla 4: la tarea que cambia ese ciclo abre su par |
| Dos ciclos repiten `RF-001` | La regla 2: la secuencia de RF es la del producto |
| Una cláusula vieja sigue mandando después de mover los specs | La regla 6: el ADR dice qué cláusula deja de mandar |
| Confundir este modo con un cambio de autonomía | La declaración de ciclos y la del nivel van en secciones distintas |
