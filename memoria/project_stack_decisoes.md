---
name: Stack tecnica e decisoes fechadas do agent da clinica
description: Decisoes tecnicas ja definidas - Zenvia, Google Sheets, Google Calendar, Kanban HTML, Claude como agent
type: project
originSessionId: 9b3d238a-0758-4c79-b519-14fc49682f56
---
**Decisoes fechadas:**
- Gateway WhatsApp: Zenvia (API oficial Meta)
- Agent de IA: Claude (Anthropic) com CLAUDE.md proprio da clinica
- Banco de dados/CRM: Google Sheets (equipe ja conhece)
- Agenda: Google Calendar (agent verifica e cria agendamentos)
- Painel da equipe: Kanban web (HTML simples que abre no navegador)
- Nome da assistente IA: mesmo nome da recepcionista real da clinica
- Numero WhatsApp: numero atual da clinica migrado para Zenvia

**Regras tecnicas:**
- Google Sheets como banco inicial (NAO Supabase ainda)
- Kanban como HTML simples
- NAO conectar Zenvia ate tudo estar validado localmente
- Validar 30 dias com conversas reais antes de escalar

**Why:** Daniel nao programa e a equipe ja usa Google Sheets/Calendar. Simplicidade e prioridade.

**How to apply:** Sempre propor solucoes simples primeiro. Nao sugerir ferramentas complexas sem necessidade.
