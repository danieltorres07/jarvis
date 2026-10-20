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

Raio-X já tem 2 pixels (1687631822321853 e 1842485093107692) e eventos ViewContent, DiagnosticoStart, DiagnosticoComplete (custom). Falta ele dizer qual pixel é da BM de anúncios.

Primeira campanha: 6 criativos estáticos aprovados em `~/Daniel Torres/criativos/raio-x-estaticos/final/` (stories/feed/quadrado) + copy em copy-v2.md.

Status 2026-10-20: token salvo no .env (app "Automação - Carrossel", BM Daniel Torres 306211854176036). Conta escolhida act_284387563603344 (PMV), pixel HOF Nicho, R$30/dia, Brasil. Criados PAUSADOS via `criativos/raio-x-estaticos/meta/subir_campanha.py` (estado em criado.json): campanha 120253374543130246 e conjunto 120253374544610246. Anúncios NÃO: app em modo desenvolvimento não cria criativo, e publicar o app exige verificação do negócio. Daniel sobe os 6 anúncios à mão (meta/subir-manual.md). Quando a verificação sair e o app estiver Publicado, rodar `subir_campanha.py --criar` de novo (retoma sem duplicar). Leitura de métricas funciona já.

**Why:** ele quer delegar a subida de campanha.
**How to apply:** quando o .env existir, testar só leitura primeiro, criar tudo PAUSADO, otimizar pra DiagnosticoComplete, mandar resumo pra ele ativar. Pendentes dele: orçamento/dia, região.
