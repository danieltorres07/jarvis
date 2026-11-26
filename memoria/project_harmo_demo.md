---
name: project-harmo-demo
description: Harmo Demo (harmo-demo.vercel.app) = cópia do portal com dados 100% fictícios pra mostrar o sistema completo no Encontro Secreto 29/11; como regenerar e o que está desligado
metadata:
  node_type: memory
  type: project
  originSessionId: 4356cfaa-0833-4a03-bc76-4f241de56158
  modified: 2026-11-26T16:00:09.025Z
---

Criada 26/11/2026 pro Encontro Secreto: Daniel mostra o sistema completo (portal) na demo e depois o CRM; participantes testam SÓ o CRM por 15 dias (opção A), num ambiente de teste único (ainda a montar). Sistema completo não é oferecido: é vitrine pra gerar desejo de "desenvolver um pra mim".

- Site: https://harmo-demo.vercel.app/admin (senha ADMIN_SENHA em ~/.harmo-demo.env, chave HARMO_ADMIN_SENHA). Projeto Vercel harmo-demo, ligado ao mesmo repo do portal (danieltorres07/volo): todo push no portal atualiza a demo também.
- Banco: Supabase "harmo-demo" (sa-east-1), mesma conta free do Portal 4D (limite 2 ativos: Portal 4D + harmo-demo; homolog pausada). Estrutura copiada do catálogo do banco real (não das migrações, que estão incompletas).
- Tudo em ~/Daniel Torres/volo/harmo-demo/: extrair.py (estrutura), copiar_config.py (funis/etapas/procedimentos/config com Harmo→Clínica Demo, Linda→Helena, Vic→Carla), popular.py (dados fictícios; rodar de novo regenera tudo com datas relativas a hoje). Token Supabase em ~/.harmo-demo.env (apagar depois do evento).
- Sem chaves de WhatsApp/Meta/Asaas/Resend/TikTok/CRON_SECRET: nenhum cron roda, nada sai pra fora. Só ANTHROPIC_API_KEY (Sugerir resposta).
- Gatilho sync_lead_facebook_to_crm cria cartão a cada lead de anúncio: popular.py desliga ele durante a carga.
- Projeto Vercel novo precisa framework=nextjs (sem isso o middleware sobe cru e dá 500).

Relacionado: [[project-encontro-secreto]], [[project-crm-clinicas-jarvis]].
