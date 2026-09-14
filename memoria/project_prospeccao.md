---
name: prospeccao
description: Sistema de prospeccao B2B de clinicas HOF via Google Maps + planilha manual. Coletor Python local + funil kanban no clinica-sistema
metadata: 
  node_type: memory
  type: project
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-09T22:19:31.338Z
---

**Sistema criado em 2026-09-09. Refatorado 2026-09-09: migrado do portal Volo pro clinica-sistema.**

**Objetivo:** Daniel prospectar clinicas HOF pra vender mentoria (Programa 4D) + infoproduto (Playbook R$ 97). Volume alvo: 10 leads/dia.

**Arquitetura atual (pós-migração):**
- `~/Daniel Torres/prospeccao/coletar.py` — script Python com Playwright headed, grava no Supabase do **clinica-sistema** (não mais no Volo).
- `~/Daniel Torres/prospeccao/importar-planilha.py` — importa CSV da planilha manual (`~/Daniel Torres/planilhas/prospeccao-instagram/index.html`) pro Supabase.
- `~/Daniel Torres/prospeccao/cidades.txt` — 60+ cidades BR.
- `~/Daniel Torres/prospeccao/worker-diario.sh` + LaunchAgent `com.danieltorres.prospeccao` — roda todo dia às 10h, 1 cidade/dia.
- `~/clinica-sistema/db/schema-leads-prospeccao.sql` — tabelas `leads_prospeccao` + `leads_prospeccao_buscas`.
- `/funil-prospeccao` no clinica-sistema — kanban B2B com estagios: novo → abordada → respondeu → dor → call_marcada → call_feita → fechado → descartado.
- `/funil-prospeccao/[id]` — detalhe com botao "Enviar DM" que copia msg + abre ig.me + marca abordada.

**Gating:** `/funil` (Playbook Atendimento) e `/funil-prospeccao` só aparecem se `NEXT_PUBLIC_ADMIN=1` no `.env.local` do clinica-sistema. Server-side redirect via `notFound()` se env estiver off.

**Delays anti-detecao (conservadores):**
- 45-90s entre buscas
- 4-8s entre cada card do Google Maps
- 3-5min entre cidades

**Fluxo diario Daniel:**
1. Cron LaunchAgent roda 10h com 1 cidade não buscada nos últimos 7 dias.
2. Abre `/funil-prospeccao` no clinica-sistema (localhost).
3. Card "novo" → clica → editar (gancho, sinal de operação) → botao "Enviar DM" → copia msg + abre Instagram DM.
4. Marca movimentação: abordada → respondeu → dor → call_marcada → call_feita → fechado.

**Onde /admin/prospeccao antigo foi:** DELETADO do portal Volo em 2026-09-09. Tabelas antigas (`prospeccao_leads`, `prospeccao_buscas`) no Supabase Volo continuam existindo mas não recebem mais gravação — apagar quando conferir que nada mais aponta pra elas.

**Why:** Unificar CRM: prospecção B2B (Daniel vendendo consultoria) vive no MESMO sistema que ele usa pra clínica dele (clinica-sistema). Antes estava em Supabase separado. Fonte única de verdade.

**How to apply:** (1) nunca automatizar DM Instagram (banimento certo), (2) manter delays generosos, (3) qualidade > quantidade. Se ele pedir "mais leads" primeiro checar se ele ta consumindo os que tem. Se quiser mais volume, aumenta `max-cidades` no worker antes de mexer nos delays.
