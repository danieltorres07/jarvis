---
name: project_escritorio_virtual
description: "Escritorio virtual NO AR 26/11/2026 em /admin/sistema-clinico/escritorio (pixel art), vigia pg_cron 5 min, Otavio 7h e 15h, Caio remarcacao; falta Fase 2 (ordem livre + Claude Code no Mac)"
metadata:
  node_type: memory
  type: project
  originSessionId: a8e80c3e-5c6a-4a7e-a5be-c3603c7f5a96
  modified: 2026-11-26T14:27:43.853Z
---

Escritório virtual com bonecos por setor, decidido com Daniel em 26/11/2026.

Estrutura: Diretoria = Daniel + **Otávio** (gestor geral, reporta ao Daniel, compara dias de faturamento, sugere ações). Marketing = Matheus (tráfego, só boneco) + Caio (copywriter), Bia (designer), Duda (editor de vídeo). Comercial = Vitória + Daniel + **Clara** (IA que já responde WhatsApp e Instagram da Linda). Jurídico = Helena (termos e contratos). Financeiro = Daniel. Técnico = Linda (só executa procedimento, não entra em recall). Sem agente separado de recuperação/follow-up/recall: Otávio detecta, Caio escreve, cartão cai pra Vitória e Daniel (avisos comerciais vão pros 2).

**Why:** Daniel quer operação enxuta, sem inchar de agentes, e quer responder/mandar ordens dentro da página do escritório, sem passar pelo Claude Code.

**How to apply:** página dentro do portal Volo (login, LGPD). Vigia = triggers do Supabase + checagem periódica (crons da Vercel hoje são todos 1x/dia). Cérebro = Claude API (ANTHROPIC_API_KEY já no portal). Tarefa pesada vai pra fila e roda no Claude Code do Mac (`claude -p`, Fase 2). Primeira fase: só sugere, humano aprova. Falta "diário de ações" pro Otávio explicar o porquê. Ver [[project_sistema_clinica]], [[project_resposta_automatica_whatsapp]], [[project_relatorio_ceo]].

Estado em 26/11/2026 (fim do dia): migrations 130 e 131 rodadas; vigia = lib/escritorio/vigia.ts chamado pelo pg_cron do Supabase a cada 5 min (token no Vault 'escritorio_vigia_token' = .token-publicar, NAO o POSTS_INGEST_TOKEN do .env.local). Horario: seg-sex 9h-18h, push so de lead sem resposta e desmarcou. Otavio (lib/escritorio/otavio.ts) 7h-12h analise e 15h ritmo, push no WhatsApp do Daniel. Aviso de orcamento parado DESLIGADO (funil Orçamentos em Aberto nao e usado; 36 cartoes foram pra Recuperacao mantendo a data, 8 ficaram). Otavio achou: Clara sem resposta registrada desde 20/11, anuncio com 13 conversas e 1 lead (20 a 25/11), nao investigado ainda. Pendente: Fase 2 (campo de ordem livre + ponte pro Claude Code no Mac), sugestao do Caio pra orcamento.
