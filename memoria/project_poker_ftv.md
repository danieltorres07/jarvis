---
name: project-poker-ftv
description: "Painel \"Lambisgoias do Poker\" (cash game) no ar em poker-ftv.vercel.app; publico so ve, Daniel edita pelo link secreto"
metadata:
  node_type: memory
  type: project
  originSessionId: 47c6b01f-10fb-42d0-8918-45f5afe94d32
  modified: 2026-11-17T13:26:33.121Z
---

Painel de poker cash do Daniel (grupo "Lambisgoias do Poker", jogo "Poker FTV"). Pasta `~/Daniel Torres/poker-ftv/`, no ar em https://poker-ftv.vercel.app (17/11/2026).
Segue o molde de `~/Daniel Torres/amigo-oculto/COMO-FOI-FEITO.md`: Vercel separado + Supabase do portal (tabela `poker_ftv`, linha id `atual`, estado em jsonb) + visual JARVIS.
Sem senha digitada: Daniel edita por `?editar=<token>` (token em `.admin-senha.txt`, link em `.link-edicao.txt`, env ADMIN_SENHA). Visitante ve tudo travado e atualiza a cada 5 s.
Regras do jogo: buy-in padrao R$ 50, entrada ate R$ 500; rake e um caixa que paga despesas marcadas "Sai do rake" (sobra fica com quem guarda o caixa); saldo da mesa com sinal invertido (saiu mais que entrou = negativo).

**Why:** ele pediu explicitamente "igual o amigo oculto, sem senha".
**How to apply:** mudancas vao no index.html dessa pasta e `vercel deploy --prod --yes`; nao pedir chave/token, ver [[project-amigo-oculto]].
