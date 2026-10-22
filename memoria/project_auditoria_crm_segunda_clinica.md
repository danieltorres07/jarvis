---
name: project_auditoria_crm_segunda_clinica
description: Auditoria 22/10/2026 do CRM (portal Volo) pra instalar em 2a clinica; vazamentos ativos em prod aguardando autorizacao do Daniel
metadata:
  node_type: memory
  type: project
  originSessionId: 8caeea24-3358-4f49-8bb9-936f631963e6
  modified: 2026-10-22T17:30:58.822Z
---

Auditoria só leitura feita em 22/10/2026. O relatório está em `~/Daniel Torres/volo/auditorias/2026-10-22-crm-prontidao-segunda-clinica.md`, fora do repo de propósito, porque ele cita onde estão as senhas. Na mesma pasta ficou o `teste-chave-publica.sh`, que testa o que a chave pública consegue ler.

O Daniel quer subir uma 2ª clínica com outro Vercel e outro Supabase. Veredito: NÃO PRONTO.

Ficou pendente a autorização dele pra Fase 0, que mexe em produção. Os vazamentos confirmados em prod foram:
- **Tabela `contatos` legível pela chave pública:** 2.695 linhas, com CPF e observações clínicas. A causa é o `SinoNotificacoes.tsx` ler a tabela pelo navegador, com policy anon criada fora das migrations.
- **`/admin/raiox` aberto sem login.**
- **`/api/mentoradas/criar-acesso` sem autenticação.**
- **Senhas expostas no repo:** a da Linda na migração 078 e a da equipe Harmo em `scripts/isolar-equipe-harmoclinic.ts`.

**Why:** dado de saúde exposto, risco LGPD.

**How to apply:** em qualquer conversa sobre o portal ou o CRM, perguntar se a Fase 0 já foi aplicada antes de seguir. Pra conferir, rodar o script de teste. Não aplicar nada em prod sem o ok explícito dele. Lembrar também que o portal faz deploy automático ([[feedback_portal_auto_deploy]]).
