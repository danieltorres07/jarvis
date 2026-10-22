---
name: project-raiox-form-curto
description: Raio-X gratuito virou formulario curto de 13 telas em 22/10/2026; motor e simulacao tratam versao_form=curto
metadata:
  node_type: memory
  type: project
  originSessionId: 878c5dd1-75ff-4851-bde7-0cff92ddaf17
  modified: 2026-10-22T19:51:35.062Z
---

Em 22/10/2026 o formulario do Raio-X passou de 19 pra 13 telas, uma pergunta por tela (commit 10a80cb no portal Volo). Sairam: comparecimento, avaliacoes, vendas, retorno de antigos, canais e desejo 30d. Ficaram 2 numeros (novas conversas, agendamentos) + ticket porque a simulacao "R$ X a mais por mes" precisa deles.

Respostas novas levam `versao_form: "curto"`. O motor nao conta como "nao sabe" o que nao foi perguntado, acha a etapa que trava pelas respostas de processo, e a simulacao calibra o fechamento pelo faturamento informado. Respostas antigas seguem a conta original.

**Why:** cerca de 620 visitas e quase ninguem terminava o formulario longo.
**How to apply:** pixel Diag_P1..P13 a partir de 22/10 (antes ia ate P19, nao comparar). Se for mexer no formulario de novo, manter os 2 numeros ou a simulacao em dinheiro some. Ver [[project-meta-ads-campanha]].
