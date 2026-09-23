---
name: feedback-portal-auto-deploy
description: "No portal Volo (~/Daniel Torres/volo/portal/), Daniel quer commit+push automatico apos toda mudanca — Vercel builda direto"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-23T23:05:46.353Z
---

Toda mudanca no portal Volo (`~/Daniel Torres/volo/portal/`) deve ser commitada e pushada automaticamente. Vercel builda em ~1min.

**Why:** Daniel testa direto em produção (`volo-danieltorres.vercel.app`). Se eu deixar mudanca local sem push, ele testa e nao ve nada mudando, e perde tempo achando que quebrou. Ja aconteceu 2026-08-13 com fix de contas a pagar.

**How to apply:** apos qualquer Edit/Write nesse portal, rodar `git add <arquivos> && git commit -m "..." && git push origin main`. NAO rodar `vercel --prod --yes` depois do push — o webhook GitHub->Vercel ja dispara o build de production sozinho, entao seria deploy duplicado a toa.

**Os emails de "Production deployment failed" (RESOLVIDO 2026-09-23):** a causa NAO era `vercel --prod`. Existiam DOIS projetos Vercel ligados ao mesmo repo: `clinicasaltovoo` (com as 30 env vars, o site de verdade) e `portal` (criado 08/09, sem nenhuma env var). Todo push disparava os dois; o portal quebrava sempre em "Supabase nao configurado" ao prerenderizar /admin/crm/config e mandava o email. Deletei o projeto `portal` em 2026-09-23. Se voltar a chegar email de erro, conferir PRIMEIRO `vercel project ls` — o nome do projeto no assunto do email diz qual e.

**Licao:** eu diagnostiquei isso errado duas vezes culpando o `vercel --prod`. O jeito certo de investigar e ler o assunto do email (ele nomeia o projeto) e rodar `vercel inspect --logs <url-do-deploy-falho>`, em vez de deduzir pelo historico de comandos.

Vale so pra ~/Daniel Torres/volo/portal/. Outros projetos seguem regra padrao (so commitar quando pedido).
