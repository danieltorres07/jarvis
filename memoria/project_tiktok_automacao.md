---
name: project-tiktok-automacao
description: Integração TikTok (Content Posting API) pra postar carrossel e vídeo do portal Volo; status do cadastro do app e próximos passos
metadata:
  node_type: memory
  type: project
  originSessionId: be088acc-1e81-4139-8d86-33fc62120de8
  modified: 2026-10-16T02:04:37.117Z
---

Objetivo: postar no TikTok os mesmos carrosséis/vídeos aprovados no painel, igual já é feito no Instagram via Graph API ([[project-carrossel-automatico]]).

Status em 2026-10-15:
- Daniel criou conta dev, organização e o app no TikTok for Developers. App vai com nome/ícone Láureo (ícones em ~/Downloads/icone-tiktok/, recomendado laureo-ramo.png).
- No ar: /termos-de-uso e /politica-privacidade (seção 5 = TikTok) em clinicasaltovoo.vercel.app. Esqueleto em app/(editorial)/_documento-legal.tsx.
- Verificação de URL prefix `https://clinicasaltovoo.vercel.app/` via arquivo public/tiktokv3dgQcIkYUNZiIGpbO3h4OWPQ4PwtqhA.txt (no ar).
- Redirect URI combinado: https://clinicasaltovoo.vercel.app/api/tiktok/callback (rota ainda NÃO existe).
- DECISÃO 2026-10-15: caminho A = SÓ SANDBOX, sem revisão. Regra do TikTok proíbe "utility tool to upload content to accounts you or your team manage" e uso interno, então revisão seria negada. Posts saem privados (SELF_ONLY) e Daniel troca pra público no app. NÃO preencher/enviar App review. Primeiro teste: confirmar se carrossel privado pode virar público (vídeo pode).
- Falta: Daniel criar Sandbox, adicionar a conta como target user e mandar Client key/secret DO SANDBOX. Depois: construir OAuth + refresh de token + post de vídeo (FILE_UPLOAD) e foto (foto só aceita PULL_FROM_URL: servir os PNGs por uma rota no próprio clinicasaltovoo.vercel.app, que é o prefixo verificado, e não pela URL do Supabase), testar (sai privado/SELF_ONLY). Sem demo/revisão.

**Why:** app não auditado só posta privado e não autoriza conta fora do Sandbox.
**How to apply:** se o domínio mudar (rebrand Láureo, [[project-rebrand-alto-voo]]), trocar URLs no app TikTok e reverificar; idealmente antes de enviar pra revisão.
