---
name: project-instagram-direct-ia
description: "Direct do Instagram da Linda no CRM + IA que conduz pro WhatsApp, construido 17/11/2026 (commit f23eeb5), aguardando migration 123 e webhook no painel"
metadata:
  node_type: memory
  type: project
  originSessionId: 878c5dd1-75ff-4851-bde7-0cff92ddaf17
  modified: 2026-11-24T17:02:22.274Z
---

17/11/2026 (commit f23eeb5 no portal): webhook `app/api/webhooks/instagram`, lib `lib/instagram/` (cliente + resposta-automatica), tabelas ig_conversas/ig_mensagens + contatos.instagram (migration 123, Daniel cola no Supabase). Todo direct da @dralindaitala vira contato + cartao no Novos Leads da Harmo (origem instagram ou trafego-pago). IA usa METODO + ficha do WhatsApp; objetivo e pedir o WhatsApp sem forcar (nunca na 1a mensagem); quando passa o numero anota "PASSOU O WHATSAPP" no cartao e sai. Eco que nao e da IA = equipe respondeu pelo app, IA sai 7 dias. Modo config_geral.ig_auto_modo (desligado padrao), tela Configuracoes > Resposta automatica > Direct do Instagram.

Acesso: chave do usuario do sistema do app "Automacao CRM-Wapp" (1023439580512526) em ~/Daniel Torres/.meta-ig.env (META_IG_TOKEN, tem instagram_manage_messages e leads_retrieval, NAO tem pages_messaging). Vercel: META_IG_PAGE_TOKEN, META_IG_PAGE_ID=197292780141974, META_IG_VERIFY_TOKEN. Assinatura valida com META_IG_APP_SECRET ou META_WA_APP_SECRET. IG id da Linda 17841425030430897. Sem ManyChat na pagina. Puxar env de producao do Vercel e bloqueado pelo auto mode.

**Why:** Daniel quer direct dos anuncios da Linda caindo no CRM e a IA levando pro WhatsApp.
**Estado 17/11 noite:** migration, webhook, acesso as mensagens OK. Modo TESTE so pra @danieltorres.b; 1o envio real funcionou (sem pages_messaging). Corrigidos: tool_choice forcado dava 400; @ do direct vai em sc_funil_cartoes.instagram e aparece como link ig.me sem WhatsApp; select de canal do cartao usava rotulo, agora slug.
**Estado 24/11:** directs de TERCEIROS nunca chegaram (so o do Daniel): instagram_manage_messages estava em acesso padrao ("Pronto para teste"). App ja estava Live. Daniel ENVIOU App Review 24/11 so com instagram_manage_messages + instagram_basic (tirou as outras ~35 do envio), sem login de teste (LGPD; analista testa mandando direct pra @dralindaitala, equipe tem que responder rapido). Se reprovar por falta de login: criar acesso de teste com funil vazio. Regra nova 24/11: so direct/WhatsApp vindo de ANUNCIO vira cartao no Novos Leads; contas de teste (ig_auto_usuarios_teste, wa_auto_numeros_teste) passam como anuncio. Lead de mensagem da Central de Leads da Meta NAO tem API: o unico caminho e o webhook do direct.
**How to apply:** apos aprovacao, testar com alguem clicando no anuncio. proximo: testar pedido de WhatsApp ate o fim, depois Sombra pra todos alguns dias, depois Ligado (so com ok do Daniel). Ver [[project-resposta-automatica-whatsapp]].
