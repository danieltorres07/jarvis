---
name: project-followup-whatsapp
description: Sequencia de follow-up automatica via WhatsApp (Meta Cloud API) integrada ao CRM do Sistema Clinico
metadata: 
  node_type: memory
  type: project
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-07-28T14:35:34.268Z
---

Daniel quer implementar follow-up automatico via WhatsApp no CRM do Sistema Clinico do portal. Requisitos: mensagens em sequencia (ex: D+1, D+3, D+7), pare quando paciente responder, deteccao automatica de resposta.

**Decisao (2026-07-28):** avancar com Meta Cloud API (canal oficial). Zenvia/bots nao-oficiais descartados. Daniel vai fazer a burocracia (Meta Business + Business Verification + criar app + templates) enquanto eu construo a parte do portal em paralelo.

**Estado quando pausamos:** Daniel disse "Salva ai, tenho que verificar primeiro. Depois continuamos isso." Portanto:
- Meta API AINDA NAO configurada. Ele precisa fazer os passos do guia.
- Nada foi codado ainda do lado do portal.
- Duas perguntas pendentes: (1) numero atual do WhatsApp da clinica ou um novo? (2) Victoria tambem ve historico de mensagens ou so Daniel?

## Guia entregue ao Daniel (passo-a-passo Meta)

1. Meta Business Account em https://business.facebook.com (nome: Harmo Clinic).
2. Business Verification (1-5 dias — burocratico) com CNPJ + endereco + telefone.
3. Criar App em https://developers.facebook.com/apps (tipo Business).
4. Adicionar produto WhatsApp ao app. Anotar App ID + App Secret + Phone Number ID temporario.
5. Cadastrar numero real da clinica (numero perde o app do WhatsApp comum).
6. Criar templates de follow-up (3 sugeridos: D+1 convite, D+3 reforco, D+7 ultima confirmacao). Aprovacao Meta ~1h-24h.
7. Passar credenciais finais: App ID, App Secret, Phone Number ID, WABA ID, Access Token permanente, Verify Token (string inventada).

## O que eu vou construir (quando ele retomar)

1. Migration nova com tabelas: sequencias_followup, steps_followup, execucoes_followup, mensagens_whatsapp.
2. lib/whatsapp/cliente.ts — Meta Cloud API wrapper (enviar template + validar webhook signature).
3. Webhook /api/webhooks/whatsapp — GET (verify handshake com Verify Token) + POST (recebe eventos: mensagem inbound cancela pendentes daquele contato; status delivered/read atualiza execucao).
4. Vercel Cron diario que le execucoes agendadas pra hoje e envia.
5. UI em /admin/sistema-clinico/sequencias — criar sequencia (com template + delay em dias por step), vincular a etapa de um funil do CRM.
6. Hook em moverCartao: se cartao entra em etapa gatilho, agenda os steps da sequencia associada.

## Referencias / padroes ja no repo

- app/api/webhooks/asaas/route.ts eh o padrao de webhook (token + idempotencia + log prefixado). Usar mesmo esqueleto.
- app/actions/sistema-clinico/crm.ts::moverCartao ja tem a logica "quando muda estagio, checa flag abre_agendamento". Follow-up eh outra camada em cima da mesma funcao.
- lib/sistema-clinico/auth.ts eh o guard que aceita admin OU equipe — usar aqui tambem.

## Estimativa

3-5 dias de codigo + o setup Meta que so Daniel faz.

## Alternativa Fase 1 (semi-manual) — Daniel rejeitou

Foi oferecida uma versao Fase 1 semi-manual (lista "PARA MANDAR HOJE" com template pronto pra copiar/colar). Daniel escolheu ir direto pro automatico via Meta API. Nao voltar a oferecer Fase 1 a nao ser que ele mude de ideia.
