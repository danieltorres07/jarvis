---
name: project-movimento-laureo
description: "1ª caminhada beneficente Movimento Láureo (08/11/2026, Contagem) — pastas, cards, relatório, formulário pós-pagamento no portal e link Asaas"
metadata:
  node_type: memory
  type: project
  originSessionId: 3bb62bfa-0185-47c4-8874-3afcdde23c49
  modified: 2026-10-20T18:45:06.441Z
---

Evento beneficente "Movimento Láureo · Juntos pela Vida" (Outubro Rosa | Novembro Azul), 1ª caminhada 5 km, domingo 08/11/2026, Av. Francisco Firmo de Matos em frente à Granvilla, Contagem. R$119, 100 vagas, lucro doado pra instituição de câncer (nome a confirmar). Daniel pediu tirar a palavra "corrida" das peças: é "caminhada".

- Pasta: `~/Daniel Torres/corrida-beneficente/` (cards aprovados em `flyer/v3-cards/card_1.png` e `card_2.png`, gerados por `generate.py` com `/usr/bin/python3`).
- Relatório interativo publicado: https://claude.ai/artifact/W82q4TwNWiFHRW83x2FbJN (fonte `relatorio.html`, checklist compartilhado via db). PDF na Mesa.
- Formulário pós-pagamento (tamanho P/M/G/GG/XG + termo): https://clinicasaltovoo.vercel.app/movimento-laureo ; painel `/admin/movimento-laureo` (respostas em Supabase Storage bucket `movimento-laureo`).
- CRM: funil "Atletas Corrida" (Pagou > Link enviado > Camisa escolhida) em /admin/sistema-clinico/crm/atletas-corrida; webhook Asaas cria cartão ao pagar; botão abre wa.me com mensagem pronta. Termo de responsabilidade v1 (21/10/2026) no mesmo formulário, aceite gravado (IP, hora, aparelho, hash); termo assinado em /admin/movimento-laureo/termo/[cpf]. Organização no termo: Harmo Clinic e Vereador Léo da Academia; sem reembolso (valor vai pra causa).
- Webhook Asaas "Portal Volo" estava desativado apontando pro domínio antigo volo-danieltorres; reativado em 21/10 com URL clinicasaltovoo. Integração Git da Vercel FUNCIONA (conferido 21/10): o deploy automático só demora mais de 7 min às vezes; não precisa vercel deploy --prod.
- Link Asaas: paymentLink `p3fqqkk9rdw6mg3g` ("Movimento Láureo - 1º LOTE") na conta do portal. Redirect pro formulário recusado em 20/10/2026 porque a conta Asaas não tinha site cadastrado (Minha Conta > Informações).

**Why:** evento com prazo curto; Selleta precisa da contagem de tamanhos pra produzir.
**How to apply:** números da conta mudam com frequência (último: kit R$36,80 + taxa Asaas R$4,05 pior caso); sempre atualizar o relatório no mesmo link. Ligado a [[project-sistema-clinica]] (portal Volo) e [[feedback-portal-auto-deploy]].
