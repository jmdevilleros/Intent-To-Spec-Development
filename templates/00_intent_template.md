# [Nombre del Proyecto] - Intención (ITSD-A)

**Versión:** 1.0  
**Fecha:** YYYY-MM-DD  
**Nivel de autonomía:** [L0 | L1 | L2 | L3]  
**Estado:** [En entrevista | Intención suficiente | Bajado a L1/L0]

## 1. Visión

Una o dos oraciones: qué es y para quién.

## 2. No Negociables

- ...

## 3. Preguntas (máx. 5–7, ordenadas por impacto)

| # | Pregunta | Clase | Respuesta / Default | Resuelta por |
|---|----------|-------|---------------------|--------------|
| 1 | ... | Bloqueante / Supuesta / Diferida | ... | Usuario / Agente / ADR-XXX |

- **Bloqueante:** experiencia central, costosa de revertir o de gusto → se pregunta.
- **Supuesta:** el agente decide y la registra en §4.
- **Diferida:** se resuelve vía ADR durante la implementación.

## 4. Supuestos

| ID | Supuesto | Justificación | Confianza | Costo si falla | Cómo revertir |
|----|----------|---------------|-----------|----------------|---------------|
| S-01 | ... | ... | Alta / Media / Baja | ... | ... |

## 5. Presupuestos

| Concepto | Límite |
|----------|--------|
| Tiempo por fase | ... |
| Intentos por checkpoint (K) | 3 |
| Costo máximo | ... |

## 6. Criterio de Intención Suficiente

- [ ] Sin preguntas bloqueantes abiertas
- [ ] Cada RF previsto es convertible en criterio de aceptación verificable
- [ ] Resumen de una pantalla mostrado al usuario en fecha: ____
- [ ] L1: aprobado · L2: timeout de ___ h cumplido o aprobado · L3: notificado

Si quedan bloqueantes tras el tope de preguntas → bajar a **L1** o **L0** y anotarlo en el Estado.

## 7. Resumen (una pantalla)

**Decidido por el usuario:**
- ...

**Asumido por el agente:**
- ...

**Diferido (ADR):**
- ...
