---
name: project-sistema-clinica
description: "Sistema interno proprio de gestao da clinica do Daniel, substituindo Clinicorp gradualmente"
metadata: 
  node_type: memory
  type: project
  originSessionId: 585257fa-a2e8-4580-8b36-6a70832f92fc
  modified: 2026-09-16T20:09:17.546Z
---

Daniel decidiu construir o proprio sistema de gestao da clinica de harmonizacao (uso interno, NAO vira produto agora), pra substituir o Clinicorp/Clinica Experts que acha fraco no comercial e complexo demais no resto.

**Abordagem:** modular e em paralelo, nunca big-bang. Constroi um modulo por vez, mantem Clinicorp rodando junto, so aposenta o pedaco quando o modulo novo provar que aguenta.

**Stack:** Next.js 16 + Supabase + Tailwind 4 + TypeScript + Vercel (mesmo do [[project-bolao-royals]], usar `~/bolao-royals` de molde). Supabase escolhido por ser dado de saude (relacional, RLS/LGPD, storage de foto, backup). Furamos a regra "Sheets nao Supabase" do CLAUDE.md so neste projeto.

**Ordem dos modulos:** 1) CRM+Comercial+Dashboard 4D (comecar, risco zero) → 2) Agenda → 3) Financeiro+Estoque → 4) Prontuario (por ultimo, maior risco legal LGPD, ou nem). Modulo transversal: importacao dos dados do Clinicorp (exportar ANTES de cancelar).

**Economia de tokens (Daniel ta no Max 5x $100):** grosso da obra roda em Sonnet, Opus so pra schema/arquitetura. Daniel troca pra Sonnet pra construir telas.

**Estado (corrigido de novo em 2026-09-16 — a correção de set/2026 anterior apontava pro projeto ERRADO):** o app real em producao (`https://clinicasaltovoo.vercel.app/`) e o codigo-fonte de verdade e `~/Daniel Torres/volo/portal/` (git remote github.com/danieltorres07/volo, commits ativos). O `~/clinica-sistema/` (sem git, ultimo touch 09/09/2026) e um projeto PARALELO/abandonado que Daniel nao usa mais como fonte principal, mas que pode ter dado real de leads de prospeccao dentro dele (ver [[project_prospeccao_leads_dualidade]] se existir, ou secao abaixo) — checar antes de ignorar.

**Modulos no portal real:** agenda, pacientes, cadastros, contatos, financeiro, documentos, dashboard, e um **CRM generico multi-funil** em `app/admin/sistema-clinico/crm/` — schema `sc_funis` (funil) + `sc_funil_estagios` (etapas, com cor/is_final/is_ganho/auto-move) + `sc_funil_cartoes` (cartao, sempre ligado a um registro em `contatos`, 1 cartao por funil por contato). Migrations em `db/migrations/0XX-*.sql`, aplicadas manualmente no SQL Editor do Supabase (sem migration runner automatico) — `db/schema-supabase.md` e um dump que fica desatualizado, nao confiar nele sem checar o Supabase direto.

Funis existentes incluem "Novos Leads" (slug `novos-leads`, com automacao de follow-up D+0/D+1/D+3.../D+30) e "Leads Prospeccao" (slug `leads-prospeccao`, B2B, 5 campos custom hoje: instagram/cidade/clinica_propria/sinal_operacao/gancho, aplicados direto no Supabase sem migration versionada — divida tecnica).

**Duas features de mensagem no CRM, nao confundir:**
- `wa_click_mensagem` (coluna em `sc_funil_estagios`): texto de referencia por etapa, generico pra qualquer funil, configuravel em `/admin/sistema-clinico/crm/gerenciar`. Ao clicar no card, abre `wa.me` com o texto pre-preenchido (placeholders `{primeiro_nome}` etc) — 100% manual, usuario ainda clica Enviar.
- `whatsapp_sequencias`/`whatsapp_steps` (`app/admin/sistema-clinico/sequencias/`): automacao REAL via Meta WhatsApp Cloud API, dispara sozinho via cron, mas exige templates HSM pre-aprovados pela Meta — nao serve pra mensagem fria de prospeccao (sem opt-in previo).

Usa Server Actions (Next.js), NAO tem API routes REST prontas pra integracao externa hoje.
