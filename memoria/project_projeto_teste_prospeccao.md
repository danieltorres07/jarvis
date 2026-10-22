---
name: project-projeto-teste-prospeccao
description: "\"Projeto Teste\" (nome provisório) em ~/Daniel Torres/projeto-teste: sistema de prospecção no Instagram adaptado do repo buscandomilhao, Fase 1 semiautomática pronta, usado pelo celular via Remote Control"
metadata:
  node_type: memory
  type: project
  originSessionId: 2b2b92e1-aec3-4290-9263-920b5c75a2ba
  modified: 2026-10-22T13:04:43.880Z
---

Construído em 21/10/2026 a partir do PROMPT.md de github.com/soumatheusgomes/buscandomilhao, adaptado: teto de 20 DMs/dia (pedido do Daniel, segurança), sem funil de afiliados (não existe programa), CRM próprio em SQLite (ele transfere pro Volo depois, CSV pronto), Fase 1 semiautomática (sistema prepara, Daniel envia e marca no painel). Fase 2 (envio automático + API Meta) só com liberação explícita dele.

Atualização 22/10/2026: Daniel liberou o envio AUTOMÁTICO (1ª DM + follow-ups) pelo Chrome dedicado logado na @danieltorres.b, via "solicitação de contato", intervalo 15-35 min, 20/dia a partir de 23/10. Respostas seguem manuais. Mensagens tratam por "Dra./Dr.". Filtro: perfis achados com +80 mil seguidores ficam pra depois. Ensaio em modo teste aprovado antes de ligar.

**Why:** Daniel quer operar pelo app do Claude no celular, com a base no Mac. Atalho `Projeto Teste.command` na Mesa liga `claude remote-control` + caffeinate.

**How to apply:** regras do projeto no CLAUDE.md da pasta; manual em SETUP.md. Pendências em 21/10: chave OpenAI + modelos + preços no .env, ICP_SEGMENTS/ICP_KEYWORDS em config/business.json, Chrome dedicado logado (`pnpm chrome`), nome definitivo. Relaciona com [[project_prospeccao]] (coletor antigo quebrado).
