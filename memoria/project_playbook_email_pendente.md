---
name: playbook-email-pendente
description: "Depois de finalizar as paginas do Playbook, LEMBRAR de perguntar ao Daniel sobre envio automatico do PDF por email/WhatsApp"
metadata: 
  node_type: memory
  type: project
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-02T19:53:24.138Z
---

Landing /playbook + /playbook/obrigado no portal ([[project_portal_4d]]) prometem entregar o PDF "no contato cadastrado", mas o sistema hoje SO salva o lead em `leads_playbook` e redireciona. Nao ha envio de email nem WhatsApp automatico.

**Why:** Daniel priorizou terminar as paginas primeiro (2026-09-02) e pediu pra eu lembrar dele depois.

**How to apply:** Assim que os ajustes finais das paginas Playbook (landing + obrigado) forem concluidos, perguntar diretamente qual dos 3 caminhos ele quer seguir:

1. **E-mail via Resend** — recomendado, rapido, free ate 3k/mes. Precisa dele criar conta + configurar DNS SPF/DKIM em danieltorrespmv.com + me passar API key.
2. **WhatsApp Meta Cloud API** — depende da burocracia Meta que esta pausada em [[project_followup_whatsapp]].
3. **Tirar a promessa da copy** — remover a frase "voce vai receber no contato cadastrado" e deixar so o download na pagina de obrigado.

Se optar por email, montar template no padrao VOLO (Barlow + Jakarta + cream/ink/gold) com botao de download apontando pra `/downloads/playbook-atendimento-conversao.pdf`.
