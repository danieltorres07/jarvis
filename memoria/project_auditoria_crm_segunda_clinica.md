---
name: project_auditoria_crm_segunda_clinica
description: Auditoria 22/10/2026 do CRM (portal Volo) pra instalar em 2a clinica; vazamentos ativos em prod aguardando autorizacao do Daniel
metadata:
  node_type: memory
  type: project
  originSessionId: 8caeea24-3358-4f49-8bb9-936f631963e6
  modified: 2026-10-22T19:24:07.500Z
---

Auditoria só leitura feita em 22/10/2026. O relatório está em `~/Daniel Torres/volo/auditorias/2026-10-22-crm-prontidao-segunda-clinica.md`, fora do repo de propósito, porque ele cita onde estão as senhas. Na mesma pasta ficou o `teste-chave-publica.sh`, que testa o que a chave pública consegue ler.

O Daniel quer subir uma 2ª clínica com outro Vercel e outro Supabase. Veredito: NÃO PRONTO.

Ficou pendente a autorização dele pra Fase 0, que mexe em produção. Os vazamentos confirmados em prod foram:
- **Tabela `contatos` legível pela chave pública:** 2.695 linhas, com CPF e observações clínicas. A causa é o `SinoNotificacoes.tsx` ler a tabela pelo navegador, com policy anon criada fora das migrations.
- **`/admin/raiox` aberto sem login.**
- **`/api/mentoradas/criar-acesso` sem autenticação.**
- **Senhas expostas no repo:** a da Linda na migração 078 e a da equipe Harmo em `scripts/isolar-equipe-harmoclinic.ts`.

Andamento da Fase 0 (autorizada em 22/10/2026):
- No ar e verificado em prod (commit `0bb97e1`):
  - sino via server action (`app/actions/sistema-clinico/sino.ts`);
  - `/admin/raiox` exige admin;
  - `criar-acesso` exige admin ou `MENTORADAS_TOKEN`;
  - crons travados sem `CRON_SECRET`.
- Senha da Linda trocada no banco e senhas tiradas do código.
- Banco fechado em 22/10/2026:
  - o Daniel rodou o bloco 2, que removeu as policies `realtime_select_*`, `diag_partida_all` (anon ALL) e as duas de `leads_paciente_ideal`;
  - a view do estoque passou a usar `security_invoker`;
  - perderam EXECUTE pela chave pública só as funções do sistema; `unaccent` (extensão) ficou de fora;
  - `teste-chave-publica.sh` saiu com 0 falhas.
- **Ainda pendente:** desligar o signup no painel (Authentication > "Allow new users to sign up").

- Repo `danieltorres07/volo` é privado.
- Repo `danieltorres07/jarvis` é público. O cron `jarvis-sync` grava nele `compromissos` e `tarefas_admin` todo dia. Aguardando decisão do Daniel.

Fase 1 (CRM Clínicas), em `~/Daniel Torres/crm-clinicas/`, git só local:
- 3 commits feitos em 22/10/2026: base `1dfc0f8`, limpeza A `0b9f69a`, limpeza B `92dbf94`.
- Ficou CRM + funil + orçamentos + receita (`lancamentos`) + comissões + metas + relatórios do CRM.
- Usa 24 tabelas.
- Follow-up WhatsApp atrás da env `WHATSAPP_FOLLOWUP_ATIVO`.
- Próximo: banco novo (migração única + seed neutro), depois segurança (login do dono, limite de tentativas, páginas permitidas no servidor), depois Fase 2 (branding).

Fase 1 (CRM genérico), feita etapa por etapa:
- uma instalação por clínica;
- módulos: CRM/funil + financeiro comercial (receita prevista e realizada, comissão, receita por paciente, CAC por canal).

**Why:** dado de saúde exposto, risco LGPD.

**How to apply:** em qualquer conversa sobre o portal ou o CRM, perguntar se a Fase 0 já foi aplicada antes de seguir. Pra conferir, rodar o script de teste. Não aplicar nada em prod sem o ok explícito dele. Lembrar também que o portal faz deploy automático ([[feedback_portal_auto_deploy]]).
