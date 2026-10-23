---
name: project_auditoria_crm_segunda_clinica
description: Auditoria 22/10/2026 do CRM (portal Volo) pra instalar em 2a clinica; vazamentos ativos em prod aguardando autorizacao do Daniel
metadata:
  node_type: memory
  type: project
  originSessionId: 8caeea24-3358-4f49-8bb9-936f631963e6
  modified: 2026-10-23T01:45:14.925Z
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
- Signup do Supabase desligado (`disable_signup=True`, conferido em 22/10/2026). Revalidação no mesmo dia: o teste da chave pública deu 0 falhas, `/admin/raiox` respondeu 307 e criar-acesso respondeu 401.
- Se aparecer alerta de outra conversa dizendo que "CPF/raiox continua aberto", é informação velha: está tudo corrigido e verificado.

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
- Permissão por página nas ações do servidor pronta (commit `93306e3`, `npm run teste:acoes`, 11 de 11):
  - `garanteSistemaClinico(paginas)`;
  - as listas de páginas de cada ação são geradas por `testes/mapa-acoes.py`.
- Backup e ensaio de desastre prontos (commit `434c4c6`):
  - `npm run backup`;
  - `npm run homolog:ensaio-backup`: backup, apaga tudo, restaura e confere; passou limpo, com cerca de 25 s de backup e 52 s de restauração.
- Fase 1 concluída em 22/10/2026.
- As 4 correções estão **no ar no portal Volo** desde 22/10/2026 às 18:52 (commit `c5d407a`):
  - páginas da equipe checadas no `middleware.ts` (a checagem do layout saiu);
  - login da equipe indo direto pra primeira página permitida;
  - comissão só sobre o que foi recebido;
  - data local no pagamento;
  - dashboard contando orçamentos distintos (outubro: 33 virou 22, ticket médio de R$ 1.020 pra R$ 1.530).
- Antes do deploy, a Linda ficou com `paginas_permitidas = null` (vê tudo), por decisão do Daniel. A Victória já via tudo.
- No portal ainda **não** tem permissão por página nas ações do servidor, só nas telas. Seria a próxima melhoria, se ele quiser.
- Fase 2.1 do CRM Clínicas pronta (commit `19e273f`): tela Aparência com nome, logo e cor; `npm run teste:aparencia` passa 16 de 16.
- Limite conhecido: o painel vira tema claro por filtro (invert + hue-rotate). Cores vivas (azul royal, rosa, lilás, vermelho, amarelo) não saem idênticas dentro do sistema, e a tela avisa.
  - A solução de verdade seria um tema claro real, sem filtro; é uma refatoração grande e fica pendente de decisão.
  - Saem exatas: dourado, verdes, rose gold, nude, laranja e preto.
- Fase 2.2 pronta (commit `99c17e1`): página Marketing com investimento por canal, CAC e retorno. `npm run teste:marketing` passa 12 de 12.
  - Regras de conta:
    - **lead:** contato criado no período;
    - **conquistado:** o primeiro pagamento recebido da história dele cai no período;
    - **canal:** o "como conheceu" do cadastro, normalizado; Lead Ads entra como Tráfego Pago.
  - Defeito de UI achado e corrigido: o modo público não escondia os valores da tabela.
- A bateria E2E inteira passou duas vezes seguidas (70 de 70). Os testes esperam até 45 s, porque a homologação é lenta a partir do Mac.
- Fase 2.3 pronta (commit `1af64ce`): importação de contatos por CSV ou xlsx.
  - Quem já existe (mesmo WhatsApp ou CPF) só recebe campos vazios; nada é sobrescrito.
  - A autorização de mensagens vem desmarcada por padrão.
  - Testes passando: `teste:importacao` 20 de 20 e `teste:importacao-e2e` 12 de 12.
- **Fase 2 concluída.**
- Next do CRM Clínicas atualizado de 16.2.9 pra 16.4.2 (commit `a89a67f`), porque tinha uma falha crítica de bypass do middleware/proxy.
- Portal da Harmo atualizado pro Next 16.4.2, com autorização do Daniel (commit `21b1c63`, no ar desde 22/10/2026 às 20:48).
  - Feito numa cópia isolada; as travas do middleware foram testadas contra a homologação antes do push.
  - A pasta local do portal ficou 1 commit atrás do `origin`. A outra sessão (que roda `next dev` ali) precisa dar `git pull` e `npm install`.
- Instalador pronto (`npm run instalar`, `scripts/instalar-clinica.mjs`).
  - Cada clínica usa a própria conta Supabase, no plano grátis, por decisão do Daniel em 22/10/2026.
  - Token pessoal de conta nova não cria projeto (403 na organização). A clínica cria o projeto no painel e o instalador usa `--supabase-ref`.
  - O `vercel.json` precisa de `"framework": "nextjs"`; sem isso o build saía vazio, com 404.
- Demo no ar: https://crm-clinica-demo-five.vercel.app
  - Projeto Supabase `ihtjmq…`, em São Paulo, numa conta separada (`danieltb92@yahoo`).
  - Credenciais e logins em `~/crm-instalacoes/clinica-demo/instalacao.txt`.
  - Repopular com `node scripts/demo/popular-demo.mjs ~/crm-instalacoes/clinica-demo --refazer`.
- Correção achada pela demo: a conversão do Marketing passou a ser por coorte (leads do período que já pagaram), sem passar de 100%.
- Próximos itens pedidos pelo Daniel, em ordem:
  - (3) minuta de contrato + termo LGPD baseada no que o sistema faz;
  - (4) trocar o filtro de inversão por tema claro de verdade.
- Pendente no portal: o `sharp` (TikTok) tem alerta alto e precisa de atualização de versão maior.
- Pendente no portal: renomear `middleware.ts` pra `proxy.ts`. Por enquanto é só aviso de obsoleto.
- Próximo: homologação com dados fictícios, depois Fase 2 (branding, logo e cor) e Fase 3 (financeiro comercial e CAC).

Fase 1 (CRM genérico), feita etapa por etapa:
- uma instalação por clínica;
- módulos: CRM/funil + financeiro comercial (receita prevista e realizada, comissão, receita por paciente, CAC por canal).

**Why:** dado de saúde exposto, risco LGPD.

**How to apply:** em qualquer conversa sobre o portal ou o CRM, perguntar se a Fase 0 já foi aplicada antes de seguir. Pra conferir, rodar o script de teste. Não aplicar nada em prod sem o ok explícito dele. Lembrar também que o portal faz deploy automático ([[feedback_portal_auto_deploy]]).
