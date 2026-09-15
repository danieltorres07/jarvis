---
name: project-sistema-clinica
description: "Sistema interno proprio de gestao da clinica do Daniel, substituindo Clinicorp gradualmente"
metadata: 
  node_type: memory
  type: project
  originSessionId: 585257fa-a2e8-4580-8b36-6a70832f92fc
  modified: 2026-09-15T16:07:31.844Z
---

Daniel decidiu construir o proprio sistema de gestao da clinica de harmonizacao (uso interno, NAO vira produto agora), pra substituir o Clinicorp/Clinica Experts que acha fraco no comercial e complexo demais no resto.

**Abordagem:** modular e em paralelo, nunca big-bang. Constroi um modulo por vez, mantem Clinicorp rodando junto, so aposenta o pedaco quando o modulo novo provar que aguenta.

**Stack:** Next.js 16 + Supabase + Tailwind 4 + TypeScript + Vercel (mesmo do [[project-bolao-royals]], usar `~/bolao-royals` de molde). Supabase escolhido por ser dado de saude (relacional, RLS/LGPD, storage de foto, backup). Furamos a regra "Sheets nao Supabase" do CLAUDE.md so neste projeto.

**Ordem dos modulos:** 1) CRM+Comercial+Dashboard 4D (comecar, risco zero) → 2) Agenda → 3) Financeiro+Estoque → 4) Prontuario (por ultimo, maior risco legal LGPD, ou nem). Modulo transversal: importacao dos dados do Clinicorp (exportar ANTES de cancelar).

**Economia de tokens (Daniel ta no Max 5x $100):** grosso da obra roda em Sonnet, Opus so pra schema/arquitetura. Daniel troca pra Sonnet pra construir telas.

**Estado (set/2026, corrigido — memoria antiga estava desatualizada):** sistema em producao em `https://clinicasaltovoo.vercel.app/` (login com email+senha). App em `~/clinica-sistema/`, sem git local inicializado (deploy deve ser direto via Vercel). Modulos ja construidos: agenda, pacientes, cadastros (procedimentos/profissionais), contatos, financeiro, funil, funil-prospeccao, documentos, follow-ups, dashboard. Usa Server Actions (Next.js), NAO tem API routes (`app/**/route.ts`) — ou seja, nao ha endpoint REST pronto pra integracao externa hoje. Pra rotina/Jarvis puxar agenda de paciente desse sistema no futuro, precisa OU criar uma API route protegida OU dar acesso direto ao Supabase (service key) pra leitura.
