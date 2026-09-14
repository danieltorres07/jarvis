---
name: bolao-royals-copa-2026
description: "Projeto paralelo do Daniel — sistema web de bolao da Copa 2026 pra Royal's Barbershop, NO AR em bolao-royals.vercel.app, prazo 11/06/2026"
metadata: 
  node_type: memory
  type: project
  originSessionId: 4b262e1b-a839-4fcc-b082-4e00f545ff12
---

Sistema web de bolao da Copa do Mundo 2026 pra **Royal's Barbershop** (cliente, NAO e marca do Daniel nem da Linda). Pasta: `~/bolao-royals/`. Daniel nao programa: Claude constroi, ele supervisiona.

**NO AR (28/05/2026):** https://bolao-royals.vercel.app . Painel: `/admin` (senha = env `ADMIN_SENHA`, hoje `royals2026` provisoria, TROCAR pra producao). Ranking publico: `/ranking`.

**Prazo critico:** palpites travam 11/06/2026 as 15:30. Copa = 11/06 a 27/06 (fase de grupos, 72 jogos, 48 selecoes, 12 grupos).

**Stack:** Next.js 16 (App Router, Server Actions, `after`) + **@libsql/client** + Vercel. **NAO usa Supabase** (Daniel preferiu evitar). Banco: **SQLite LOCAL** em dev (`data/bolao.db`, default em `lib/db.ts`) e **Turso** na nuvem em producao (mesmo libSQL, migracao trivial). Next 16 tem breaking changes: params/cookies async, docs locais em `node_modules/next/dist/docs/`.

**Contas/infra:** Turso conta `danieltorres01`, banco `bolao-royals` (`libsql://bolao-royals-danieltorres01.aws-us-west-2.turso.io`). Vercel conta `torresbdaniel92-1007`, projeto `daniel-projects-claude/bolao-royals`. Credenciais locais: `.env.deploy` (DATABASE_URL + DATABASE_AUTH_TOKEN do Turso) e `.env.local` (ADMIN_SENHA, CRON_SECRET); na Vercel as 4 estao em Production. Turso CLI em `~/.local/bin/turso` (baixei o binario do GitHub; o instalador oficial curl|bash quebra no bash 3.2 do Mac). Vercel CLI = devDep (`npx vercel`). Deploy: `npx vercel --prod`.

**Modelo do produto:**
- Inscricao R$49,90. Pix chave CPF `099.668.686-07` na tela + botao WhatsApp `(31)99306-8077` pra enviar comprovante. Admin confirma "pago" no painel. Dados em `lib/config.ts`.
- SEM login/senha: cadastro = nome + WhatsApp + PIN 4 digitos. WhatsApp = identificador unico. Sessao via cookie (coluna `token`). PIN pra voltar e editar ate o prazo.
- Pontuacao 10/5/3 (`lib/pontuacao.ts`, testada 9/9 casos do regulamento). Ranking so quem pagou, geral + 3 semanas (11-14, 15-21, 22-27 jun). Desempate = palpite total de gols.
- **Resultados automaticos:** fonte OpenFootball `worldcup.json/2026` (gratis, sem key, tem score.ft). Matching por grupo+times traduzidos PT (`lib/resultados.ts`). Sincronizacao em `lib/sync.ts`: gatilho lazy no `/ranking` (throttle 15min, tabela `config`) + cron Vercel 1x/dia (Hobby limita a 1x/dia) + botao manual no admin. Rota `/api/atualizar-resultados?secret=CRON_SECRET`.

**Scripts uteis** (`scripts/`, excluidos do tsconfig; rodar com `node --experimental-strip-types`): `shot.mjs`/`shot-admin.mjs` (screenshot via Playwright/Chromium do cache ms-playwright-1208), `teste-pontuacao.ts`, `teste-resultados.ts`, `teste-puxar.ts`, `demo.ts`. Setup banco: `db/setup-local.mjs`, `db/setup-turso.mjs`.

**Logo:** aplicada em todas as telas (`public/logo-royals.png`, preto-sobre-transparente, exibida branca via `invert` no componente `app/logo-royals.tsx`). Original em `~/Downloads/ROYALS BARBERSHOP - 2D VETOR SEM FUNDO PRETO.png`.

**Mudancas pos-deploy:** desempate em 3 camadas (pontos > placares exatos/cravadas de 10 > proximidade do total de gols); ranking mostra "X placares cravados". Painel tem botao **Excluir participante** (`app/admin/botao-excluir.tsx`, com confirm). Jogos organizados por DIA (nao por grupo) com tag do grupo + **bandeiras** (flagcdn via `app/bandeira.tsx`) nas telas palpites/resultados/admin. Barra de **abas** `app/nav-tabs.tsx` (Palpites/Ranking/Resultados/Regras). Ranking sempre visivel (alfabetico ate pontuar; contador de confirmados; so pagos aparecem). Paginas novas: `/resultados` (placares), `/regras` (regulamento), `/participante/[id]` (palpites de cada um, visiveis **so apos o prazo** 11/06 15:30 = transparencia). Ranking tem busca por nome + nomes clicaveis pos-prazo (`app/ranking/lista.tsx`). Ao salvar palpites redireciona pro /pagamento. Cadastro = Nome + Sobrenome (2 campos obrigatorios).

**Senha admin do BOLAO:** `royals2026`. Cuidado: Daniel tem outro projeto chamado **VOLO** com senha `D.Torres07*` — nao confundir. Trocar a senha do bolao SEMPRE via CLI (`vercel env rm/add ADMIN_SENHA production` + redeploy), NAO pelo dashboard da Vercel (ja causou problema de senha vazia). Banco de producao tem a inscrita real "Ingrid de Morais" (72 palpites, pendente de pagamento) + 1 teste que o Daniel ia excluir. Relacionado: [[project_negocios]].
