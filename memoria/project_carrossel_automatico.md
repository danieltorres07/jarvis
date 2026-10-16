---
name: carrossel-automatico
description: "Sistema de geracao automatica de carrosseis Daniel Torres, configuracao de ritmo e horarios de postagem"
metadata: 
  node_type: memory
  type: project
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-04T22:31:27.870Z
---

Sistema autonomo de carrossel decidido em 2026-09-04.

**Configuracao:**
- Gera 7 carrosseis por dia (worker-manha 10:30, --quantos 7 --max-fila 15) todos os dias
- Daniel aprova 5 por dia (desde 2026-10-19; antes eram 2)
- Slots de postagem: desde 2026-10-19 sao 10:30, 12:30, 15:30, 17:30, 19:00 (antes 17:50 e 19:30). Fonte unica: portal lib/posts-slots.ts (slotsDoDia por data). Launchd com.danieltorres.publicar-HHMM pra cada um (os antigos 1750/1930 ficaram carregados, inofensivos, podem ser removidos).
- Jarvis avisa no WhatsApp 30 min antes de cada slot se nao tem post aprovado (carrossel ou reel): rota /api/cron/aviso-post-sem-aprovado, launchd com.danieltorres.aviso-post-HHMM -> _master/aviso-slot.sh. Cai no e-mail se a janela de 24h da Meta estiver fechada. Disparo preciso pelo launchd do Mac (com.danieltorres.publicar-1750 / -1930 -> _master/publicar-slot.sh, log em _master/publicar-slot.log, auth com POSTS_INGEST_TOKEN). Cron da Vercel (Hobby, sem precisao de minuto, chegou a atrasar 1h) virou rede de seguranca as 22:00 BRT
- Rejeitar dispara regeneracao infinita do mesmo tema
- Botao Arquivar manda tema pro banco de reserva
- Temas: eu gero (5 pilares + voz Daniel, COPYWRITER.md)
- CTA: desde 2026-10-14 fixo em todo carrossel, briefing do Jarvis nao muda mais o CTA. Ver [[feedback-cta-rx26-padrao]]

**Auto-post Instagram:** FUNCIONANDO (portal/lib/instagram/publicar.ts). Teto de 10 imagens por carrossel. CRON_SECRET na Vercel e 'sensitive' (vercel env pull devolve [ENCRYPTED]), por isso o disparo local usa POSTS_INGEST_TOKEN.

**Stack:**
- Tabela `posts_pendentes` (migration 091, rodada 2026-09-04)
- Tabela `temas_carrossel` (a criar)
- Bucket Storage `carrosseis` (publico)
- Env var `POSTS_INGEST_TOKEN` no Vercel (valor: pb26-ingest-x9k2mq4vf8)
- Painel `/admin/posts` com botoes Aprovar, Rejeitar+Regerar, Arquivar

**Why:** Daniel quer delegar producao de conteudo. Ele so quer aprovar/rejeitar, nunca criar do zero.

**How to apply:** ao construir/ajustar o fluxo, respeitar 7 gera + 5 aprova + regeneracao infinita. Nao mudar horarios sem pedir (ultimo pedido: 5 por dia a partir de 19/10).

**Formato versus (desde 2026-10-15):** 3o formato, replica do carrossel "Stories que ninguem liga vs que vendem" (ref. @mariaeduardasv). Tela dividida vermelho/verde, capa com 2 recortes do Daniel (midias/images/transparents), comparacoes story/whatsapp/story_triplo, salvar no slide 5, RX26 no 10. CHANCE_VERSUS = 0.25 em gerar-automatico.py; regeneracao mantem versus; fica fora da conta 70/30. Render em _master/template_versus.py, banco de 58 fotos Pexels em _master/banco-versus/index.json. Modelo devolve nao_cabe -> cai no formato normal. Daniel aprovou o visual da referencia ("ficou sensacional").
Regras do Daniel pro pos (15/10): no pos-consulta/retorno quem manda a 1a mensagem e a CLINICA; retorno pos-procedimento e em media 15 dias (nunca 30) e ja sai agendado no dia do procedimento, entao a msg dessa fase e pos-retorno com cuidados de casa, nunca oferta de horario; conversa de WhatsApp com ida e volta real (linha "P: " = paciente no template_versus) em vez da clinica falando sozinha.
Aviso no app do Claude (15/10): rotinas na nuvem jarvis-aviso-post (cron UTC 45 12,14,17,19) e jarvis-aviso-post-1815 (15 21), 45 min antes de cada slot (pedido do Daniel por causa do atraso da nuvem); status-post olha 75 min a frente, mesmo ambiente do jarvis-status-diario. Leem /api/status-post (publico, so devolve se o slot da proxima hora tem aprovado + qtd pendentes) e chamam PushNotification se avisar=true. Disparo da nuvem atrasa ~5-15 min. Se mudar os slots, ajustar o cron dessas rotinas.
