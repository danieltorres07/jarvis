---
name: project-demo-regulariza-imob
description: "Demo de plataforma imobiliária (site + sistema) pra Regulariza Imob, contratante que hoje usa AIFred; apresentação 02/12/2026"
metadata:
  node_type: memory
  type: project
  originSessionId: cf0229fa-7174-4f24-87cb-19f943827456
  modified: 2026-11-27T00:13:58.818Z
---

Demo estática (HTML/JS, dados fictícios, sem login) em `~/Daniel Torres/demo-imobiliaria/`, criada 26/11/2026 pra apresentar ao contratante dia 02/12/2026.

Cliente: Regulariza (regularizamg.com.br, Contagem/MG), nome no sistema atual "Regulariza Imob". Faz regularização de imóveis (usucapião, habite-se etc.) e tem carteira imobiliária popular em Contagem (~19 imóveis).
Visual: paleta deles (#38B4E6, #13426B, #18537D, #080B3A) + Montserrat/Roboto, logo oficial do site.

Hoje usam AIFred (imobiliaria.aifred.com.br): IA atende conversas, tem Meu trabalho, Follow-ups, Esperando corretor, Agenda Google, Imóveis. Não tem CRM funil, financeiro, locação, regularização, site próprio. Prints de 26/11 mostravam 30 esperando corretor (até 44 dias) e 27 sem resposta >1h, follow-up zerado: argumento central da venda.

**Why:** demo pra fechar escopo/projeto real com o contratante.
**How to apply:** ajustes vão nesse diretório; publicar na Vercel só com ok explícito do Daniel (nome sugerido regulariza-imob-demo). Testar com Playwright local antes.
