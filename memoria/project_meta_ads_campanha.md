---
name: project-meta-ads-campanha
description: "Subir campanha Meta Ads pelo Claude via Marketing API, BM de anúncios é OUTRA (não a do WhatsApp); aguardando token em ~/Daniel Torres/.meta-ads.env"
metadata:
  node_type: memory
  type: project
  originSessionId: 878c5dd1-75ff-4851-bde7-0cff92ddaf17
  modified: 2026-10-20T16:50:00.346Z
---

Em 2026-10-20 o Daniel pediu pro Claude subir campanha no Meta direto. Não havia nenhuma conexão. Combinado: ele cria na **BM da conta de anúncios** (é outra BM, NÃO a do WhatsApp de [[project-followup-whatsapp]]) um app Business + usuário do sistema Admin + token sem expiração (ads_management, ads_read, business_management, pages_show_list, pages_read_engagement, instagram_basic) e salva em `~/Daniel Torres/.meta-ads.env` (META_TOKEN, META_AD_ACCOUNT, META_PAGE_ID, META_PIXEL_ID). Token nunca colado no chat.

Raio-X já tem 2 pixels (1687631822321853 e 1842485093107692) e eventos ViewContent, DiagnosticoStart, DiagnosticoComplete (custom). Falta ele dizer qual pixel é da BM de anúncios.

Primeira campanha: 6 criativos estáticos aprovados em `~/Daniel Torres/criativos/raio-x-estaticos/final/` (stories/feed/quadrado) + copy em copy-v2.md.

**Why:** ele quer delegar a subida de campanha.
**How to apply:** quando o .env existir, testar só leitura primeiro, criar tudo PAUSADO, otimizar pra DiagnosticoComplete, mandar resumo pra ele ativar. Pendentes dele: orçamento/dia, região.
