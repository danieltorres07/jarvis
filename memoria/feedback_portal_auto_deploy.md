---
name: feedback-portal-auto-deploy
description: "No portal Volo (~/Daniel Torres/volo/portal/), Daniel quer commit+push automatico apos toda mudanca — Vercel builda direto"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-17T14:34:51.514Z
---

Toda mudanca no portal Volo (`~/Daniel Torres/volo/portal/`) deve ser commitada e pushada automaticamente. Vercel builda em ~1min.

**Why:** Daniel testa direto em produção (`volo-danieltorres.vercel.app`). Se eu deixar mudanca local sem push, ele testa e nao ve nada mudando, e perde tempo achando que quebrou. Ja aconteceu 2026-08-13 com fix de contas a pagar.

**How to apply:** apos qualquer Edit/Write nesse portal, rodar `git add <arquivos> && git commit -m "..." && git push origin main`. NAO rodar `vercel --prod --yes` depois do push.

**REGRA FIRME (reforcada 2026-09-17):** SO `git push`. NUNCA `vercel --prod --yes` depois do push. O webhook GitHub->Vercel funciona normalmente e ja dispara o build de production sozinho. Se eu adicionar `vercel --prod` no comando, roda DOIS deploys em paralelo pro mesmo commit — um sempre falha, dispara email de erro pra Daniel, e ele nao entende porque. Daniel chegou a apontar isso em 2026-09-17 e reclamar do email de erro.

Vale so pra ~/Daniel Torres/volo/portal/. Outros projetos seguem regra padrao (so commitar quando pedido).
