---
name: project_crm_clinicas_jarvis
description: "CRM Clínicas (~/Daniel Torres/crm-clinicas) ganhando visual JARVIS dourado + recursos do prompt de CRM; bloco 1 pronto 31/10/2026, blocos 2 e 3 pendentes"
metadata:
  node_type: memory
  type: project
  originSessionId: 000b5b15-c07f-4992-b0bc-49ce28cd3cbc
  modified: 2026-10-31T03:40:58.299Z
---

Em 30/10/2026 o Daniel testou um prompt de "CRM completo estilo JARVIS" (protótipo em ~/Daniel Torres/prototipos/crm-jarvis-teste/) e decidiu trazer parte dele pro CRM Clínicas real.

Decisões dele:
- Visual JARVIS SIM, com tema claro/escuro e neon DOURADO (no código o neon é `var(--gold)`, a cor da clínica na tela Aparência, dourado por padrão).
- Ordem aprovada: (1) visual + menu retrátil + Meu perfil + convite + suporte → (2) tarefas + chat compartilhado WhatsApp → (3) gamificação em cima das metas.
- FORA: múltiplas organizações e planos/pagamento (CRM é 1 instalação isolada por clínica). WhatsApp não oficial só se clínica pedir.

Bloco 1 feito em 31/10/2026, NÃO commitado e NÃO publicado em clínica nenhuma (esperando ok dele):
- Camada `app/tema-jarvis.css` por cima das classes existentes; tema em cookie `crm_tema` (padrão escuro), menu em `crm_menu`.
- Convite = colunas em equipe_clinica (`db/instalacao/12_convites.sql`), link pra WhatsApp; e-mail só com RESEND_API_KEY.
- Suporte manda pro WhatsApp do env SUPORTE_WHATSAPP (número ainda não informado pelo Daniel).
- Corrigido bug antigo: instalador exigia 27 tabelas, instalação nova tem 28 (travaria a próxima clínica).

**Why:** quer o CRM com cara de produto premium e mais recursos de equipe, sem virar SaaS multi-clínica.
**How to apply:** próximo passo é bloco 2 (tarefas + chat); antes, confirmar se ele aprovou o bloco 1 e pegar o número de suporte. Ver [[project_sistema_clinica]] e [[feedback_comunicacao]].
