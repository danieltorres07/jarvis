---
name: feedback-carrossel-meio-a-meio
description: Fila de carrosséis é 70% com foto e 30% texto; nunca forçar --formato em regeração em lote
metadata:
  node_type: memory
  type: feedback
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-10-01T14:43:11.714Z
---

A fila de aprovação de carrosséis fica em **70% com foto e 30% texto** (mudou de
50/50 em 2026-10-01). Foto é o formato nativo (foto do Daniel com caixa branca por
cima); texto é o off-white com Inter pesada. Vale pra qualquer geração, inclusive
regeração em lote.

**Why:** o formato com foto performa melhor no feed, então domina. O de texto fica
pros carrosséis que entregam mensagem longa, conta ou script, que não cabem numa
caixa sobre a foto sem perder a parte que a pessoa ia copiar.

**How to apply:** `gerar-automatico.py` já tem `proximo_formato()`, que lê a fila real
e escolhe o que está faltando, se corrigindo sozinho a cada aprovação ou rejeição.
Então **rodar sem `--formato`** mantém o equilíbrio sozinho.

Passar `--formato texto` numa regeração em lote atropela isso e produz fila 100%
texto, que foi o erro de 2026-10-01 (13 carrosséis regerados todos em texto). Só usar
`--formato` quando o Daniel pedir aquele formato específico.

A proporção vive em `ALVO_NATIVO` no topo de `proximo_formato()`. Pra mudar de novo,
é só trocar esse número.

Ao escolher qual tema vai pra cada formato: o nativo limita cada slide a 60-118
caracteres, então tema com conta detalhada ou mensagem pronta pra secretária copiar
fica melhor em texto. Tema conceitual vai bem com foto.

Relacionado: [[project_carrossel_automatico]]
