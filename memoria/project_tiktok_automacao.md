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
- Verificação de URL prefix `https://clinicasaltovoo.vercel.app/` via arquivo public/tiktokv3dgQc...txt (Production) e public/tiktoko0FSoj...txt (Sandbox: cada ambiente tem sua verificacao). Modo atual = RASCUNHO (MEDIA_UPLOAD): Direct Post exige conta inteira privada pra app nao auditado.
- Redirect URI: https://clinicasaltovoo.vercel.app/api/tiktok/callback (fixo em TIKTOK_BASE no lib/tiktok/cliente.ts).
- DECISÃO 2026-10-15: caminho A = SÓ SANDBOX, sem revisão. Regra do TikTok proíbe "utility tool to upload content to accounts you or your team manage" e uso interno, então revisão seria negada. Direct Post foi abandonado (exige conta privada); vai como rascunho e Daniel posta publico no app. NÃO preencher/enviar App review.
- 2026-10-15 CONSTRUIDO (commit 6bad37f): Sandbox criado, credenciais em TIKTOK_CLIENT_KEY/SECRET (local + Vercel). Codigo em lib/tiktok/ (cliente, publicar, fila), app/api/tiktok/{conectar,callback,midia}, app/actions/posts-tiktok.ts. Depois do IG, publicarSemAuth chama enviarProTikTok. /admin/posts tem faixa Conectar TikTok + secao Publicados recentes com status TikTok.
- 2026-10-16 FUNCIONANDO: migration 110 rodada, conta @danieltorres.b conectada, rascunhos (foto e video) chegam em Mensagens > Notificacoes do sistema, o app mostra como recebido ~na hora do envio, mas na noite do teste nao aparecia na lista (Daniel so viu na manha seguinte). Se sumir de novo: fechar/reabrir o app e esperar, nao e bug nosso. Se o atraso incomodar: servico aprovado (upload-post, Ayrshare) posta publico direto. Limite foto "1080p": se TikTok recusar 1080x1350, reduzir altura pra 1080 na rota midia.

**Why:** app não auditado só posta privado e não autoriza conta fora do Sandbox.
**How to apply:** se o domínio mudar (rebrand Láureo, [[project-rebrand-alto-voo]]), trocar URLs no app TikTok e reverificar; idealmente antes de enviar pra revisão.
- 2026-10-19 CADA REDE COM SEU CTA (aprova 1x no painel): Instagram "comente RX26 que te envio no direct.", TikTok "me manda RX26 no direct." (comentario nao vira DM automatica no TikTok/Brasil). Legenda: lib/tiktok/legenda.ts (legendaTikTok, usado em fila.ts e no botao "Copiar legenda" do Reel). Ultimo slide: carrosseis/_master/slide_tiktok.py renderiza copia temporaria com a frase trocada e sobe carrosseis/<slug>/tiktok_ultimo.png no Storage; chamado dentro de upload_slides (gerar-automatico.py), entao todo script que sobe slide atualiza junto. Rota /api/tiktok/midia serve esse arquivo no ultimo indice, senao cai no slide do IG. Backfill: `/usr/bin/python3 slide_tiktok.py --fila`. Commit portal 7975083.
