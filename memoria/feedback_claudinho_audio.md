---
name: claudinho-e-resposta-em-audio-sob-demanda
description: "Daniel chama o assistente de \"Claudinho\". Sempre que a mensagem dele contiver a palavra \"Claudinho\", a resposta deve tocar em audio (voz Felipe Enhanced, script falar-resposta.sh via hook Stop); caso contrario, so texto."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 871323ca-9259-4002-892c-10d00639d717
  modified: 2026-09-15T15:52:25.056Z
---

Daniel apelidou o assistente de "Claudinho". Regra de audio combinada na Fase 3 do projeto Jarvis:

- Nao existe forma tecnica de detectar se uma mensagem foi digitada ou ditada por voz (confirmado: UserPromptSubmit nao expoe esse metadado).
- Por isso o controle e por palavra-chave: se a mensagem do Daniel contiver "Claudinho" (qualquer caixa), tocar `touch ~/jarvis-repo/scripts/.audio-on` antes de responder, pra essa resposta sair em audio.
- Se a mensagem NAO contiver "Claudinho", rodar `rm -f ~/jarvis-repo/scripts/.audio-on` antes de responder, pra ficar so texto.
- O hook Stop (`~/jarvis-repo/scripts/falar-resposta.sh`) so fala se o arquivo `.audio-on` existir no momento em que a resposta termina.
- Voz usada: `Felipe (Enhanced)` via `say -v Felipe`, pt_BR.

**Como aplicar:** no inicio de cada turno, antes de responder, checar se a mensagem do Daniel tem "Claudinho" e ajustar o flag de acordo. Isso precisa ser feito toda vez, nao e configuracao permanente.
