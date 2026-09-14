---
name: portal-4d-plataforma-de-membros
description: Plataforma Next.js + Supabase do Programa de Aceleração Clínica 4D. Área de membros tipo Hotmart escuro premium. Pausada em 2026-06-10 antes da Fase 7.
metadata: 
  node_type: memory
  type: project
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
---

**Path do projeto:** `~/aceleracao-4d/`

**Stack:** Next.js 16.2 + Supabase (sa-east-1) + TypeScript + Tailwind 4. Mesmo padrão dos projetos `bolao-royals/` e `clinica-sistema/`.

**Supabase:** projeto "Portal 4D" id `sjiwgihoozkeiguslayx`, região São Paulo. Credenciais em `~/aceleracao-4d/.env.local` (gitignored).

**O que está pronto (até 2026-06-10):**
- Schema completo: clientes, convites, padrões, instâncias, diagnósticos, marcos, admins, sessões + produtos, módulos, acessos
- 13 padrões carregados (7 visíveis cliente + 6 internos Daniel)
- 3 produtos: `sprint-30-dias`, `mentoria-4d`, `trilha-tecnica-linda` (este último "em breve")
- 8 módulos (4 do Sprint + 4 da Mentoria), padrões existentes linkados
- Admin Daniel completo: login, CRUD de leads/clientes, diagnóstico 4D embedado (iframe + persistência Supabase), gerenciador de acessos por cliente (dar/tirar produto, drip, ativar/pausar)
- Auth de cliente: convite → senha (scrypt) → login (cookie 30d) → área de membros
- Área de membros estilo Hotmart: banner hero com foto Daniel + nome grande, cards de produtos com cover gradient + badges LIBERADO/BLOQUEADO/EM BREVE, página de produto com módulos, página de aula visualizando markdown read-only
- Lista de clientes mostra chips coloridos dos programas ativos de cada um

**Como retomar:** Próxima fase é Fase 7 — cliente editar entregáveis (instância editável vs padrão). Quando cliente abre uma aula, se não tem instância dele, cria automaticamente. Editor inline (textarea + autosave Supabase) substituindo o `<pre>` atual da aula. Botão "puxar atualização" quando padrão tem versão nova.

**Conteúdo (separado da Fase 7):** Daniel vai produzir entregáveis novos sob demanda (Sprint Semana 3-4, Mentoria 4D fases). Eu posso minutar baseado no método 4D, ele revisa.

**Falta no roadmap depois da Fase 7:**
- Fase 11: Admin de padrões (editar markdown direto no admin sem rodar seed)
- Fase 9: Cronograma (marcos por cliente)
- Fase 12: Deploy Vercel + DNS (Daniel quer usar subdomínio dele)
- Fase 10: Conteúdo Trilha Técnica Linda (sessão separada com ela)

**Cliente de teste:** Dra. Brenda Guedes (`02bb8c10-efa7-4d43-a6f9-b1cf2cdb7002`). Diagnóstico dela importado do localStorage antigo. Tem acesso ao Sprint (compra direta). Última senha resetada em 2026-06-10.

**Servidor dev:** `cd ~/aceleracao-4d && npm run dev` → http://localhost:3000

**Why:** Daniel quer parar de enviar PDFs/scripts manualmente pra cada cliente. Plataforma é catálogo central + cópia editável por cliente, sem vazar entre clientes (padrão → instância).

**How to apply:** quando ele chamar pra continuar, retomar a partir da Fase 7. Validar primeiro que o fluxo de auth ainda funciona (convite → senha → login) testando com a Brenda.
