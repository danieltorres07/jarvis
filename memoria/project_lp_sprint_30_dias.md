---
name: project-lp-sprint-30-dias
description: LP + formulario de aplicacao do Sprint Comercial 30 dias no ar em clinicasaltovoo.vercel.app/sprint-30-dias; como editar e subir
metadata:
  node_type: memory
  type: project
  originSessionId: 48dd40cb-f4a0-4e4e-b036-40e684261160
  modified: 2026-10-06T02:06:35.065Z
---

No ar desde 2026-10-05: https://clinicasaltovoo.vercel.app/sprint-30-dias (Daniel testou ponta a ponta, funcionou).

- Fonte da LP: `~/Daniel Torres/volo/landings/sprint-comercial-30-dias/index.html`. Pra subir: copiar pra `portal/public/sprint-30-dias/index.html` trocando `src="images/daniel.png"` por `src="/sprint-30-dias/daniel.png"`, commit+push (rewrite em `next.config.ts`).
- Formulario (18 perguntas, 1 por tela) dentro da propria LP; envia pra `portal/app/api/sprint-30-dias/route.ts`. Sem tabela propria: vira cartao no funil "Leads Daniel" com respostas nas observacoes + aviso WhatsApp.
- Reprova: pergunta 5 "Ainda nao tenho clinica" ou pergunta 17 "Nao". Tela de aprovado = texto do Daniel + Google Agenda https://calendar.app.google/2PjVtsgSCGgVNCTY9. Tela de reprovado foi escrita por mim (Daniel nao mandou versao dele).
- Pendente: video da abertura (Daniel editando). Anuncios e VSL do funil vivem em outra conversa; os blocos com R$30k/R$60k neles ainda nao foram trocados por % como na LP.
- Na LP, resultado da clinica aparece so em % (fat. ~100%, ticket quase 90%), "depois que comecei a aplicar o que vou te ensinar", nunca em R$ nem com prazo.

Ver [[feedback-landing-visual-clean]] e [[project-sprint-caixa-30-dias]].
