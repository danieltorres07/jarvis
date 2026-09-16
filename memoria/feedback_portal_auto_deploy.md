---
name: feedback-portal-auto-deploy
description: "No portal Volo (~/Daniel Torres/volo/portal/), Daniel quer commit+push automatico apos toda mudanca — Vercel builda direto"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-16T13:24:15.689Z
---

Toda mudanca no portal Volo (`~/Daniel Torres/volo/portal/`) deve ser commitada e pushada automaticamente. Vercel builda em ~1min.

**Why:** Daniel testa direto em produção (`volo-danieltorres.vercel.app`). Se eu deixar mudanca local sem push, ele testa e nao ve nada mudando, e perde tempo achando que quebrou. Ja aconteceu 2026-08-13 com fix de contas a pagar.

**How to apply:** apos qualquer Edit/Write nesse portal, rodar `git add <arquivos> && git commit -m "..." && git push origin main`. NAO rodar `vercel --prod --yes` depois do push.

**IMPORTANTE (2026-09-16):** em 2026-09-08 o webhook GitHub -> Vercel parecia quebrado e a regra passou a rodar `vercel --prod --yes` apos todo push, alem do push em si. Isso ficou esquecido ligado e comecou a causar 2 deploys de Production simultaneos (1 do webhook nativo + 1 do CLI) pro mesmo commit, um deles quase sempre falhando. Removido o passo do CLI em 2026-09-16 — push sozinho deve bastar. Se o deploy automatico nao disparar na proxima mudanca, investigar o webhook de novo (sem reativar o CLI como solucao permanente).

Vale so pra ~/Daniel Torres/volo/portal/. Outros projetos seguem regra padrao (so commitar quando pedido).
