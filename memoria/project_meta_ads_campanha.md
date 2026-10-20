---
name: project-meta-ads-campanha
description: "Subir campanha Meta Ads pelo Claude via Marketing API, BM de anúncios é OUTRA (não a do WhatsApp); aguardando token em ~/Daniel Torres/.meta-ads.env"
metadata:
  node_type: memory
  type: project
  originSessionId: 878c5dd1-75ff-4851-bde7-0cff92ddaf17
  modified: 2026-10-20T17:49:26.860Z
---

Em 2026-10-20 o Daniel pediu pro Claude subir campanha no Meta direto. Não havia nenhuma conexão. Combinado: ele cria na **BM da conta de anúncios** (é outra BM, NÃO a do WhatsApp de [[project-followup-whatsapp]]) um app Business + usuário do sistema Admin + token sem expiração (ads_management, ads_read, business_management, pages_show_list, pages_read_engagement, instagram_basic) e salva em `~/Daniel Torres/.meta-ads.env` (META_TOKEN, META_AD_ACCOUNT, META_PAGE_ID, META_PIXEL_ID). Token nunca colado no chat.

Raio-X já tem 2 pixels (1687631822321853 e 1842485093107692) e eventos ViewContent, DiagnosticoStart, DiagnosticoComplete (custom). O da BM de anúncios é o 1842485093107692 (HOF Nicho).

Primeira campanha: 6 criativos estáticos aprovados em `~/Daniel Torres/criativos/raio-x-estaticos/final/` (stories/feed/quadrado) + copy em copy-v2.md.

Status 2026-10-20: token salvo no .env (app "Automação - Carrossel", BM Daniel Torres 306211854176036). Conta escolhida act_284387563603344 (PMV), pixel HOF Nicho, R$30/dia, Brasil. Público definido DO ZERO (Daniel pediu, não reaproveitar públicos antigos) em meta/publico.py: mulheres, min 25 + sugestão 25-50, Advantage+ com sugestões Odonto/Biomed/Esteticista/Donos pequenas empresas, só Instagram mobile. Interesses de nicho (botox, harmonização) não existem mais no Meta. Exclusão de quem concluiu o Raio-X pendente: Daniel precisa aceitar termos de público personalizado, depois rodar publico.py. Criados PAUSADOS via `criativos/raio-x-estaticos/meta/subir_campanha.py` (estado em criado.json): campanha 120253374543130246 e conjunto 120253374544610246. App foi PUBLICADO em 2026-10-20 e os 12 anúncios (6 por campanha, mesmos criativos) foram criados pausados via API. subir-manual.md virou obsoleto. Vídeos de tráfego (PRONTOS/TRAFEGO onde voce perde dinheiro + 4 objecoes, só 9:16) rodam em conjunto próprio de stories+reels em cada campanha (meta/videos.py, copy em copy-videos.md). Versão 4:5 dos vídeos não existe ainda. ATIVADO tudo em 2026-10-20 (meta/ativar.py, --pausar desliga). Otimizador automático no ar (meta/otimizador.py, launchd com.danieltorres.raiox-otimizador 9h e 21h; com.danieltorres.raiox-semanal sexta 10h com --semanal). Regras: CPA alvo R$30, TETO R$80/dia SOMANDO as duas campanhas (Daniel confirmou), 72h de aprendizado sem mexer, pausa anúncio ruim mantendo 2 por conjunto, move R$5 entre campanhas a partir do dia 5, +20% se 4+ RX em 3d com CPA bom, intervalo 48h. Relatório por e-mail via Resend (precisa User-Agent, senão 403) + notificação Mac + relatorios/. API tem limite de chamadas (erro 17, app em nível básico): espaçar chamadas. Leitura de métricas funciona já. Exclusão [EXCLUIR] Raio-X concluído 180d (120253375004660246) aplicada. Campanha 2 criada pausada com público do conjunto Vídeos Playbook (copiado, só evento trocado pra DiagnosticoComplete, Raio-X não dispara Lead): campanha 120253375007090246, conjunto 120253375007310246, R$20/dia, script meta/campanha_playbook.py. Playbook tinha gasto R$78,57 e 6 leads.

**Why:** ele quer delegar a subida de campanha.
**How to apply:** quando o .env existir, testar só leitura primeiro, criar tudo PAUSADO, otimizar pra DiagnosticoComplete, mandar resumo pra ele ativar. Já definidos: R$30/dia, Brasil.
