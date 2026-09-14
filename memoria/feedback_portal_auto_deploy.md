---
name: feedback-portal-auto-deploy
description: "No portal Volo (~/Daniel Torres/volo/portal/), Daniel quer commit+push automatico apos toda mudanca — Vercel builda direto"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-08T16:26:22.779Z
---

Toda mudanca no portal Volo (`~/Daniel Torres/volo/portal/`) deve ser commitada e pushada automaticamente. Vercel builda em ~1min.

**Why:** Daniel testa direto em produção (`volo-danieltorres.vercel.app`). Se eu deixar mudanca local sem push, ele testa e nao ve nada mudando, e perde tempo achando que quebrou. Ja aconteceu 2026-08-13 com fix de contas a pagar.

**How to apply:** apos qualquer Edit/Write nesse portal, rodar `git add <arquivos> && git commit -m "..." && git push origin main` E TAMBEM `vercel --prod --yes` no fim da mesma resposta. Nao esperar Daniel pedir.

**IMPORTANTE (2026-09-08):** o webhook GitHub -> Vercel esta quebrado. Push sozinho NAO dispara deploy. Sempre rodar `vercel --prod --yes` apos o push. Projeto ja linkado em .vercel/ como `daniel-projects-claude/clinicasaltovoo`. Domain: clinicasaltovoo.vercel.app.

Vale so pra ~/Daniel Torres/volo/portal/. Outros projetos seguem regra padrao (so commitar quando pedido).
