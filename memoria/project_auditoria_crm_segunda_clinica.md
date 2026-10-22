---
name: project_auditoria_crm_segunda_clinica
description: Auditoria 22/10/2026 do CRM (portal Volo) pra instalar em 2a clinica; vazamentos ativos em prod aguardando autorizacao do Daniel
metadata:
  node_type: memory
  type: project
  originSessionId: 8caeea24-3358-4f49-8bb9-936f631963e6
  modified: 2026-10-22T21:19:28.522Z
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
- Banco novo pronto (commit `52c9e66`): `db/instalacao/01_estrutura`, `02_seguranca`, `03_padrao`, com o teste `npm run teste:banco` (PGlite) passando 11 de 11.
- Funis padrão decididos pelo Daniel em 22/10/2026:
  - Novos Leads (slug `novos-leads`, usado pelo gatilho do Facebook) e Recuperação de Leads;
  - 8 etapas iguais às da Harmo: Entrada, Em Contato, Respondeu, Agendado, Desmarcou/Faltou, Atendido, Fechou, Perdeu;
  - sem a cadência D+ dele; a clínica cria outros funis e etapas na tela.
- Segurança pronta (commit `9be9f1e`):
  - login único em `/entrar`; o dono é um membro com `eh_dono`; `ADMIN_SENHA` não existe mais;
  - limite de tentativas no login;
  - `/primeiro-acesso` protegido por `CODIGO_INSTALACAO`;
  - tela Equipe;
  - páginas permitidas aplicadas no `template.tsx`, com `proxy.ts`;
  - Lead Ads filtrado por `FB_PAGE_ID`;
  - nenhuma chave pública exposta.
- Homologação criada em 22/10/2026:
  - projeto Supabase `crm-clinicas-homolog`, ref `vuziofcwhqitndvzkbwg`, Postgres 17;
  - credenciais em `crm-clinicas/.env.local`, que também guarda a senha do banco e `AMBIENTE=homologacao`;
  - banco instalado; checagens de segurança 7/7; teste de acesso no navegador 13/13 (commit `55df3a9`).
- Furo achado e corrigido nos testes: navegação interna abria página não permitida. A permissão agora é checada no `proxy.ts`, que consulta o banco.
- O portal Volo tem a mesma falha (permissão só no layout, e o `x-pathname` nunca chega). Levar a correção pra lá precisa do ok do Daniel.
- Projeto Supabase antigo "sistema clínica" (`rzmutalq…`): fora do ar desde pelo menos 9/9/2026, liberado pra apagar. O worker de prospecção ainda tentava usar ele.
- Fluxo comercial testado ponta a ponta com `npm run teste:comercial`: 18 de 18 passando (commit `1c3f31a`).
- Defeitos de negócio corrigidos no CRM Clínicas que **também existem no portal Volo de produção**. Levar pra lá só com o ok do Daniel:
  1. a comissão conta parcela de boleto ainda não paga (`comissoes.ts`, que filtra por `data` sem olhar `status`);
  2. a data sugerida no `PagamentoModal` usa UTC e vira o dia seguinte depois das 21h;
  3. o "Orçamentos fechados" e o ticket médio do dashboard contam pagamentos em vez de orçamentos (`analytics.ts`);
  4. a permissão por página da equipe não funciona.
- Pendente: permissão por página também nas server actions; ensaio de backup e restauração.
- Próximo: homologação com dados fictícios, depois Fase 2 (branding, logo e cor) e Fase 3 (financeiro comercial e CAC).

Fase 1 (CRM genérico), feita etapa por etapa:
- uma instalação por clínica;
- módulos: CRM/funil + financeiro comercial (receita prevista e realizada, comissão, receita por paciente, CAC por canal).

**Why:** dado de saúde exposto, risco LGPD.

**How to apply:** em qualquer conversa sobre o portal ou o CRM, perguntar se a Fase 0 já foi aplicada antes de seguir. Pra conferir, rodar o script de teste. Não aplicar nada em prod sem o ok explícito dele. Lembrar também que o portal faz deploy automático ([[feedback_portal_auto_deploy]]).
