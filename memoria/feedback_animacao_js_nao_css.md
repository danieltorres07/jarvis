---
name: feedback-animacao-js-nao-css
description: No aparelho do Daniel animacao declarativa (CSS/SMIL) nao roda; qualquer animacao no portal tem que ser requestAnimationFrame
metadata: 
  node_type: memory
  type: feedback
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-24T15:03:59.999Z
---

Toda animacao visivel no portal Volo tem que ser feita com `requestAnimationFrame` escrevendo atributo/estilo direto no elemento. Nunca com `@keyframes` do CSS, `transition`, nem SMIL (`<animate>`, `<animateMotion>`).

**Why:** ja aconteceu duas vezes que eu perdi horas achando que era bug de codigo e era o aparelho dele:

1. Faixa corrente do /playbook (2026-09): CSS animation, rAF em transform e setInterval em transform, todos falharam no celular dele. So funcionou mexendo em `scrollLeft`.
2. Animacao do hero do /diagnostico-comercial (2026-09-23/24): ele reclamou "mobile sem movimento" quatro vezes seguidas. Medi no WebKit e confirmei a causa: com "Reduzir Movimento" ligado nos ajustes do iPhone, `prefers-reduced-motion` zera as animacoes CSS (0 animacoes ativas). Depois disso ainda tentei SMIL e transform 3D (`preserve-3d` + `rotateY`), que o Safari do iPhone tambem engasga quando o conteudo e svg. So parou de dar problema quando virou rAF.

rAF e imune as duas coisas: nao depende de `prefers-reduced-motion` e nao depende de composicao 3D.

**How to apply:** client component com `useEffect` + `requestAnimationFrame`, atualizando via `setAttribute`. Antes de dar como pronto, testar com Playwright/WebKit em viewport de iPhone e `reduced_motion="reduce"`, amostrando o atributo N vezes e conferindo que ele muda. Ver [[feedback-testar-antes-de-subir]].
