---
name: project-lembrete-boas-vindas-seguidores
description: "Lembrete Jarvis 10h/14h/17h pra mandar DM de boas-vindas a novos seguidores do IG (Linda e clinica), envio manual; no ar desde 16/11/2026"
metadata:
  node_type: memory
  type: project
  originSessionId: cc192474-6e32-47e8-b92c-3335c7ab581a
  modified: 2026-11-17T00:40:13.765Z
---

16/11/2026: Daniel desistiu de automatizar DM no Instagram (API da Meta nao avisa novo seguidor nem deixa mandar 1a DM; robo no Chrome arrisca a conta da Linda). Ficou: Jarvis manda pro Daniel 3x/dia (launchd com.danieltorres.lembrete-seguidores-1000/1400/1700 -> carrosseis/_master/lembrete-seguidores.sh -> /api/cron/lembrete-seguidores) a mensagem pronta. Clinica = Vic manda; Linda = ela mesma. Vic NAO recebe nada (Daniel mandou esquecer o WhatsApp dela). Textos e revezamento em lib/boas-vindas-seguidores.ts. "FEITO" ate 3h depois e confirmado no webhook sem passar pela IA e fecha a tarefa. Cada lembrete vira tarefa tipo "interno" ("Boas-vindas dos novos seguidores 14h") e aparece no sino pra equipe toda (Vic ve as 2 mensagens pra lembrar a Linda), com copiar + ja mandei. Disparo duplo: Mac (exato) + Vercel cron 13/17/20 UTC (garantia, sai dentro da hora); a tarefa trava pra so o primeiro mandar.

**Why:** Daniel quer boas-vindas humanas, nao automacao padrao. Molde aprovado: oi + [detalhe do perfil] + 1 pergunta curta, sem explicar o motivo; a explicacao vai na 2a mensagem, depois que a pessoa responde. Nada de venda.
**How to apply:** detalhe do perfil e visto a mao (bio/ultima foto). Se o volume crescer, ele pode querer um robo so de leitura dos seguidores. Ver [[project-resposta-automatica-whatsapp]].
