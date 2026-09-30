---
name: prospeccao
description: Prospeccao B2B de clinicas HOF via Google Maps. QUEBRADA desde set/2026: coletor aponta pra pasta apagada. Destino certo e o funil leads-prospeccao no CRM do portal Volo
metadata: 
  node_type: memory
  type: project
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-09T22:19:31.338Z
---

**Sistema criado em 2026-09-09. Refatorado no mesmo dia: migrado do portal Volo pro clinica-sistema. Essa migracao se perdeu na pratica, porque o clinica-sistema foi apagado depois. Por isso quebrou.**

**Objetivo:** Daniel prospectar clinicas HOF pra vender mentoria (Programa 4D) + infoproduto (Playbook R$ 97). Volume alvo: 10 leads/dia.

**ESTADO REAL (auditado 2026-09-29): O COLETOR ESTA QUEBRADO E NAO COLETA NADA DESDE MEADOS DE SETEMBRO.**

11 de 18 execucoes do worker falharam. Causa: `coletar.py` linha 40 tem `ENV_PATH = /Users/danieltorres/clinica-sistema/.env.local`, e essa pasta FOI APAGADA. O worker roda todo dia as 10h, falha em silencio, ninguem e avisado. Zero lead entrou.

**Onde o destino vivo realmente esta (nao confundir, tem 3 nomes parecidos):**
- `leads_prospeccao` — o que o script tenta gravar. Vivia no Supabase do clinica-sistema APAGADO. Alvo morto.
- `prospeccao_leads` — tabela ANTIGA no Supabase do Volo (migration 096). Parou de receber gravacao em 09/09. Deprecada, nao usar.
- **funil `leads-prospeccao` no CRM do portal Volo — ESTE e o destino certo.** Grava em `contatos` + `sc_funil_cartoes`, campos custom formalizados na migration 097 (instagram, cidade, clinica_propria, sinal_operacao, gancho, clinica, uf, data_primeira_abordagem, ultima_interacao). UI em `app/admin/sistema-clinico/crm/[funil]/`, tratamento especial do slug em `CartaoDetalhesModal.tsx` e `_gerenciar.tsx`.

**Conserto pendente (nao executado ainda, aguardando OK do Daniel):**
1. Apontar `ENV_PATH` pra `~/Daniel Torres/volo/portal/.env.local` (tem SUPABASE_URL + SUPABASE_SERVICE_ROLE_KEY validos).
2. Trocar o destino de gravacao de `leads_prospeccao` pro par `contatos` + `sc_funil_cartoes` no funil `leads-prospeccao`, respeitando a regra de 1 cartao por funil por contato.
3. Dedup: hoje e por `google_place_id`. Precisa decidir onde esse campo mora no schema novo.
4. Fazer o worker gritar quando falhar, em vez de morrer em silencio no log.

**Arquitetura dos arquivos (esses continuam validos):**
- `~/Daniel Torres/prospeccao/coletar.py` — Playwright headed, Google Maps + enriquecimento Instagram.
- `~/Daniel Torres/prospeccao/importar-planilha.py` — importa CSV da planilha manual.
- `~/Daniel Torres/prospeccao/cidades.txt` — 60+ cidades BR.
- `~/Daniel Torres/prospeccao/worker-diario.sh` + LaunchAgent `com.danieltorres.prospeccao` — 10h, 1 cidade/dia.
- Log: `~/Daniel Torres/prospeccao/worker.log` (e onde as falhas aparecem).

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
