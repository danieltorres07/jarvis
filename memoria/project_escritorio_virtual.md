---
name: project_escritorio_virtual
description: "Escritorio virtual da clinica (bonecos por setor, gestor Otavio cuidando do faturamento, avisos e ordens na propria pagina); desenhado 26/11/2026, Fase 1 aguardando ok"
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
