---
name: project_crm_clinicas_jarvis
description: "CRM Clínicas (~/Daniel Torres/crm-clinicas) com visual JARVIS dourado, painel e recursos do protótipo; blocos 1-3 + itens extras prontos na branch visual-jarvis (01/11/2026), nada publicado"
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

Bloco 1 feito em 31/10/2026, visual APROVADO, commitado na branch `visual-jarvis` (f5b7f3f), ainda NÃO publicado em clínica nenhuma:
- Camada `app/tema-jarvis.css` por cima das classes existentes; tema em cookie `crm_tema` (padrão escuro), menu em `crm_menu`.
- Convite = colunas em equipe_clinica (`db/instalacao/12_convites.sql`), link pra WhatsApp; e-mail só com RESEND_API_KEY.
- Suporte manda pro WhatsApp do Daniel 5531993304314 (padrão no código, env SUPORTE_WHATSAPP sobrescreve).
- Corrigido bug antigo: instalador exigia 27 tabelas, instalação nova tem 28 (travaria a próxima clínica).

Bloco 2 feito 31/10/2026 na mesma branch (babea57 + 80c5943): Tarefas, Atendimento (WhatsApp oficial; sem META_WA_* a tela so explica), painel com faixa do assistente/conversao/origem/agenda do dia, busca Ctrl+K, data da consulta no card (`consulta_em`) com tarefa de confirmar. SQL `13_tarefas_e_atendimento.sql`, 31 tabelas. Atendimento e Tarefas seguem a permissao do CRM. Falta: bloco 3 (gamificacao) e juntar a branch na main.

Visual JARVIS tambem foi pro sistema da clinica no portal Volo (e6e4295, PUBLICADO em producao 31/10): mesma camada tema-jarvis.css presa a .sc-app via :has (nao afeta landings), sem data-tema no <html> (root layout do portal nao le cookie pra nao deixar landing dinamica).

01/11/2026 (branch visual-jarvis, sem publicar): menu na ordem do prototipo (Painel, Atendimento, Funis, Contatos, Tarefas; "CRM" virou "Funis"); Relatorios virou aba "CRM do mes" do Painel; Painel no layout do prototipo com filtro de periodo valendo pro painel inteiro; gamificacao (tela Metas e conquistas, pontos derivados de card movido/orcamento fechado/tarefa, missoes, sequencia, desafios, conquistas, ranking ocultavel, recompensa do dono); barra do topo (busca, Assistente, nivel, sino, selo de backup); Meu perfil com avisos/som/modo discreto (cookie crm_prefs); tela WhatsApp (dono); permissao por acao em Equipe (excluir/exportar/funis). SQL 14 = movido_por + acoes_permitidas. Homologacao local: ACESSO_LIVRE=true no .env.local entra sem senha (so homologacao, fora de producao) a pedido do Daniel ate finalizar; operacao de teste em testes/homolog/operacao-teste.mjs. Item 5 do prototipo (suporte com chamados) ele NAO quis.

**Why:** quer o CRM com cara de produto premium e mais recursos de equipe, sem virar SaaS multi-clínica.
**How to apply:** quando ele finalizar: desligar ACESSO_LIVRE, juntar visual-jarvis na main, publicar e lembrar das clinicas existentes rodarem SQL 11-14. Ver [[project_sistema_clinica]] e [[feedback_comunicacao]].
