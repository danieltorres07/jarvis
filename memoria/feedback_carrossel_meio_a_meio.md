---
name: feedback-carrossel-meio-a-meio
description: Fila de carrosséis é sempre 50% texto e 50% com foto; nunca forçar --formato em regeração em lote
metadata:
  node_type: memory
  type: feedback
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-10-01T14:43:11.714Z
---

A fila de aprovação de carrosséis tem que ficar **sempre meio a meio**: metade no
formato texto (off-white, Inter pesada) e metade no formato nativo (foto do Daniel
com caixa branca por cima). Vale pra qualquer geração, inclusive regeração em lote.

**Why:** são dois formatos aprovados por ele e o feed precisa dos dois alternando.
Uma fila só de texto deixa o perfil com cara de template.

**How to apply:** `gerar-automatico.py` já tem `proximo_formato()`, que lê a fila real
e escolhe o que está faltando, se corrigindo sozinho a cada aprovação ou rejeição.
Então **rodar sem `--formato`** mantém o equilíbrio sozinho.

Passar `--formato texto` numa regeração em lote atropela isso e produz fila 100%
texto, que foi o erro de 2026-10-01 (13 carrosséis regerados todos em texto). Só usar
`--formato` quando o Daniel pedir aquele formato específico.

Ao escolher qual tema vai pra cada formato: o nativo limita cada slide a 60-118
caracteres, então tema com conta detalhada ou mensagem pronta pra secretária copiar
fica melhor em texto. Tema conceitual vai bem com foto.

Relacionado: [[project_carrossel_automatico]]
