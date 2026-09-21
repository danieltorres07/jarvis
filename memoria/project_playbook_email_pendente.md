---
name: playbook-email-sequencia
description: "Sequencia de e-mail automatica do Playbook no ar via Resend: entrega na hora + 3 e-mails nos dias 2, 4 e 7"
metadata: 
  node_type: memory
  type: project
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-21T15:33:02.277Z
---

**No ar desde 2026-09-21.** Funcionando de ponta a ponta, testado e entregue na caixa de entrada.

**Provedor:** Resend. Dominio `danieltorrespmv.com` verificado (DKIM em `resend._domainkey` + CNAMEs `rsend` e `send`, DNS na Hostinger).
Remetente: `Daniel Torres <contato@danieltorrespmv.com>`.

**Sequencia:**
| Quando | Assunto | Leva pra |
|---|---|---|
| Na hora do cadastro | Seu Playbook | so o PDF |
| Dia 2, 10h BRT | Uma conta rapida | Raio-X (`/diagnostico-comercial`) |
| Dia 4, 10h BRT | Perguntou o preco e sumiu | landing do produto |
| Dia 7, 10h BRT | Ultima desse assunto | landing do produto |

**Onde mexe:**
- Copy e molde HTML: `lib/email/playbook.ts`
- E-mail 1 dispara em `app/actions/playbook-lead.ts` (falha nao trava o cadastro)
- E-mails 2-4: cron `app/api/cron/playbook-sequencia/route.ts`, agendado no `vercel.json` (`0 13 * * *` = 10h BRT)
- Descadastro: `app/api/playbook/descadastrar/route.ts`, link no rodape de todo e-mail
- Controle: tabela `playbook_emails` (lead_id + sequencia unico) e coluna `leads_playbook.descadastrado_em`

**Variaveis na Vercel:** `RESEND_API_KEY`, `NEXT_PUBLIC_SITE_URL`, `URL_PRODUTO_PLAYBOOK`
(a URL do produto e variavel justamente pra trocar sem deploy; hoje aponta pra
`danieltorrespmv.com/do-whatsapp-a-cadeira-consulta`).

**Why:** antes o PDF so existia na pagina de obrigado. Quem fechava a aba perdia o material
e Daniel nao tinha como reentregar. Agora chega no e-mail e a sequencia ainda leva pro Raio-X
e pro produto pago.

**How to apply:** pra mudar a copy, so `lib/email/playbook.ts`. Pra trocar o destino do produto,
muda a variavel na Vercel (sem deploy). O cron so pega quem cadastrou na janela do dia certo,
entao lead antigo nunca recebe a sequencia de tras pra frente.

Ver [[project_negocios]] e [[feedback_portal_auto_deploy]].
