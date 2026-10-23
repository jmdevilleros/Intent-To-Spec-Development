# Intent-to-Spec Development (ITSD)

**Metodología de desarrollo asistido por IA que transforma ideas vagas en productos funcionales mediante especificaciones claras, planes detallados y reglas explícitas para agentes de código.**

---

## ¿Qué es ITSD?

ITSD es una metodología estructurada para trabajar eficientemente con agentes de IA en proyectos de software. Establece un flujo claro en 4 fases que garantiza que:

- La IA entienda exactamente **qué** construir (especificación)
- Sepa **cómo** hacerlo de forma ordenada (plan)
- Respete las reglas y convenciones del proyecto (agentes)

El resultado es código de mayor calidad, menos refactorizaciones costosas y mayor trazabilidad de decisiones.

---

## Documentación Completa

**Para entender completamente la metodología, sus fases, reglas, mejores prácticas y cómo implementarla:**

➡️ **[Consulta Intent-To-Spec-Development.md](./Intent-To-Spec-Development.md)**

Este documento incluye:
- Filosofía y pilares fundamentales
- Descripción detallada de cada fase
- Flujo de trabajo paso a paso
- Mejores prácticas
- Estructura recomendada de proyectos
- Reglas para agentes de IA

---

## Templates Incluidos

En la carpeta `templates/` encontrarás plantillas listas para usar en tus proyectos:

| Template | Fase | Descripción |
|----------|------|-------------|
| `templates/00_spec_template.md` | Fase 1 | Especificación detallada de requerimientos |
| `templates/01_plan_template.md` | Fase 2 | Plan de implementación con fases y checkpoints |
| `templates/AGENTS_template.md` | Fase 3 | Reglas y convenciones para agentes de IA |
| `templates/02_decisions_template.md` | Fase 4 | Registro de decisiones de arquitectura (ADR) |

---

## Modo Autónomo: ITSD-A

Variante de ITSD con **niveles de autonomía L0–L3** para agentes de IA. Mantiene los mismos artefactos, pero reduce las compuertas humanas a intención, gusto y aceptación final; el resto se verifica automáticamente (`verify.sh`) y se notifica. L0 equivale a ITSD clásico.

➡️ **[Consulta ITSD-A.md](./ITSD-A.md)**

| Template | Uso |
|----------|-----|
| `templates/00_intent_template.md` | Intención, preguntas clasificadas (bloqueante/supuesta/diferida), supuestos |
| `templates/03_state_template.md` | Estado para reanudar sesiones |
| `templates/04_acceptance_template.md` | Guion de demo de aceptación humana |
| `templates/verify_template.sh` | Esqueleto del arnés de verificación |
| `templates/lock_spec.md` | Bloqueo de workspace multi-agente |

---

## Skill para agentes de IA

Esta metodología está disponible como **skill genérico** (formato `SKILL.md` con frontmatter YAML), compatible con cualquier agente o harness que soporte skills: Grok Build, Claude Code, Cursor, opencode y otros que lean `.agents/skills/`. El agente aplica ITSD automáticamente al detectar que estás iniciando un nuevo proyecto.

### Estructura

```
itsd-dev/                              # la raíz del repo es la carpeta del skill
├── SKILL.md                           # punto de entrada (frontmatter + flujo)
├── README.md
├── Intent-To-Spec-Development.md      # documentación completa
├── ITSD-A.md                          # modo autónomo (L0–L3)
├── CHANGELOG.md
└── templates/                         # plantillas ITSD e ITSD-A
```

### Instalación

Copia (o enlaza) la carpeta del skill a un directorio de skills con el nombre **`itsd-dev`** (debe coincidir con el campo `name` del frontmatter).

| Agente | Personal (todos los proyectos) | Por proyecto (se versiona con el repo) |
|---|---|---|
| Grok Build | `~/.grok/skills/` | `<repo>/.grok/skills/` |
| Claude Code | `~/.claude/skills/` | `<repo>/.claude/skills/` |
| Cursor | `~/.cursor/skills/` | `<repo>/.cursor/skills/` |
| opencode | `~/.config/opencode/skills/` | `<repo>/.opencode/skills/` |
| Genérico (`.agents`) | `~/.agents/skills/` | `<repo>/.agents/skills/` |

opencode también lee `~/.claude/skills/` y `~/.agents/skills/`, así que una sola instalación genérica sirve para varios agentes.

La raíz del repo es la carpeta del skill, así que puedes clonarlo directamente en su lugar:

```bash
git clone https://github.com/jmdevilleros/Intent-To-Spec-Development.git ~/.agents/skills/itsd-dev
# Grok Build:  ~/.grok/skills/itsd-dev
# Claude Code: ~/.claude/skills/itsd-dev
# Cursor:      ~/.cursor/skills/itsd-dev
# opencode:    ~/.config/opencode/skills/itsd-dev
```

Para actualizar: `git -C ~/.agents/skills/itsd-dev pull`.

Si prefieres copiar solo lo necesario:

```bash
mkdir -p ~/.agents/skills/itsd-dev
cp -r SKILL.md Intent-To-Spec-Development.md ITSD-A.md templates ~/.agents/skills/itsd-dev/
```

`SKILL.md` es autosuficiente (incluye los templates de las fases 1–4); los demás archivos añaden la documentación completa y el modo ITSD-A.

Reinicia la sesión del agente, o recarga los skills, para que detecte el nuevo skill.

### Uso

Una vez instalado, el skill se activa automáticamente cuando el agente detecta intenciones como:

- "Tengo una idea para un proyecto"
- "Quiero crear una app"
- "Nuevo proyecto desde cero"
- "Definir especificación"
- "New project from an idea"

En los agentes que permiten invocar skills como comando, también puedes llamarlo explícitamente:

```text
/itsd-dev              # iniciar desde la Fase 0
/itsd-dev continuar    # retomar la siguiente fase pendiente del plan
```

El agente seguirá las 5 fases de ITSD: Captura de Intención → Especificación → Plan → Reglas de Agentes → Ejecución. Si el `AGENTS.md` del proyecto declara un nivel de autonomía L1–L3, aplica además [ITSD-A](./ITSD-A.md).

---

## Inicio Rápido

1. Lee la [documentación completa](./Intent-To-Spec-Development.md)
2. Copia los templates a tu proyecto
3. Sigue las 4 fases en orden con tu agente de IA
4. Mantén la trazabilidad documentando decisiones importantes

---

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](./LICENSE).

---

## Autor

jmdevilleros
