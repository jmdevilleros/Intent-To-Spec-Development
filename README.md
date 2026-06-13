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

## Skill para opencode

Esta metodología está disponible como **skill** para [opencode](https://opencode.ai), permitiendo que el agente de IA aplique la metodología ITSD automáticamente al detectar que estás iniciando un nuevo proyecto.

**Archivo:** `SKILL.md` (en la raíz de este repositorio)

### Integración con opencode

Para usar el skill con opencode, copia el archivo `SKILL.md` a una de estas ubicaciones:

| Ubicación | Alcance | Comando |
|-----------|---------|---------|
| Global (todos los proyectos) | `~/.config/opencode/skills/itsd-dev/SKILL.md` | `cp SKILL.md ~/.config/opencode/skills/itsd-dev/` |
| Por proyecto | `.opencode/skills/itsd-dev/SKILL.md` | `cp SKILL.md <tu-proyecto>/.opencode/skills/itsd-dev/` |

**Ubicación global** (recomendado para uso personal):
```bash
mkdir -p ~/.config/opencode/skills/itsd-dev
cp SKILL.md ~/.config/opencode/skills/itsd-dev/
```

**Ubicación por proyecto** (para compartir en el repositorio):
```bash
mkdir -p <tu-proyecto>/.opencode/skills/itsd-dev
cp SKILL.md <tu-proyecto>/.opencode/skills/itsd-dev/
```

Después de copiar el archivo, **reinicia opencode** para que cargue el nuevo skill.

### Uso

Una vez integrado, el skill se activa automáticamente cuando el agente detecta intenciones como:

- "Tengo una idea para un proyecto"
- "Quiero crear una app"
- "Nuevo proyecto desde cero"
- "Definir especificación"
- "New project from an idea"

El agente seguirá las 5 fases de ITSD: Captura de Intención → Especificación → Plan → Reglas de Agentes → Ejecución.

---

## Inicio Rápido

1. Lee la [documentación completa](./Intent-To-Spec-Development.md)
2. Copia los templates a tu proyecto
3. Sigue las 4 fases en orden con tu agente de IA
4. Mantén la trazabilidad documentando decisiones importantes
