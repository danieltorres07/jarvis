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

**25/10/2026 · ordem do Daniel (commit d4309ae), versao_form "curto2", 12 telas:** 1 dados (nome+WhatsApp obrigatórios, Instagram/e-mail opcionais) · 2 equipe (nova, K.equipe) · 3 percepção · 4 faturamento · 5 meta · 6 ticket · 7 conversas · 8 agendam · 9 atendimento · 10 retomada (8+10 antigas juntas, K.retomada grava followup_lead e orcamento) · 11 pacientes antigos · 12 métricas. Confirmação saiu. Ao mandar os dados: iniciarRaioX cria cartão no funil Leads Daniel ("Começou o Raio-X...") + DiagnosticoStart pixel e CAPI com mesmo eventID; ao terminar, a observação do cartão vira a de onde trava. Botão fixo no rodapé nas telas sem avanço automático (sticky não pegava). Capa: headline do Daniel "Quer faturar mais? Primeiro descobre onde você está perdendo dinheiro na sua clínica."
