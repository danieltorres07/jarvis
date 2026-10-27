---
name: project-harmo-crm-regua-automacao
description: "Em 26/10/2026 a Harmo ganhou regua da Recuperacao, Chamar hoje, IA no cartao e a rotina de auto-move passou a funcionar (antes dava Acesso negado)"
metadata:
  node_type: memory
  type: project
  originSessionId: 8caeea24-3358-4f49-8bb9-936f631963e6
  modified: 2026-10-27T02:13:49.946Z
---

Em 26/10/2026 (commit a5cf690 no portal) levei do CRM Clinicas pra Harmo, a pedido do Daniel:
- Recuperacao de Leads com 24 quinzenas (mensagens aprovadas uma a uma, assinadas "a Vic, da Harmoclinic", "Dra. Linda"). As 148 que ja estavam na Entrada entram 15 por dia (REGUA_LIGADA_EM no cron recuperacao).
- crm-auto-move NUNCA tinha funcionado na Harmo: chamava moverCartao (exige sessao) e levava "Acesso negado". Agora usa moverCartaoInterno. Daniel escolheu contar os prazos a partir de 26/10 18h (ROTINA_LIGADA_EM), pra 266 cartoes parados nao andarem de uma vez. Etapas de 0 dia (Em Contato, Perdeu) andam ja na 1a rodada.
- Chamar hoje no menu, Sugerir resposta (IA) com ficha em Configuracoes > Assistente IA (vazia, Daniel preenche), Ouvir exemplo na Entrada do Novos Leads, anexo como botao (D+20 com cartaz do Canva).

**Why:** Daniel quer o sistema dele igual ao produto que vende ([[project-atende-vende-pronto]]).
**How to apply:** se cartao "andar sozinho" ou a secretaria estranhar volume no Chamar hoje, a causa provavel e a rotina recem-ligada. Copy da regua: ~/Daniel Torres/entregaveis/atende-e-vende/copy/regua-recuperacao.md.
