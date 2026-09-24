---
name: feedback-testar-antes-de-subir
description: Nao subir uma versao por vez pra olhar depois; testar local e comparar variacoes antes de commitar
metadata: 
  node_type: memory
  type: feedback
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-24T15:04:11.314Z
---

Quando for ajuste visual no portal, testar localmente e comparar variacoes lado a lado ANTES de commitar. Nao subir uma versao, pedir pro Daniel olhar, e repetir.

**Why:** em 2026-09-23/24 eu queimei umas dez rodadas na silhueta do hero do /diagnostico-comercial fazendo exatamente isso, e o Daniel teve que reclamar varias vezes da mesma coisa. Quando finalmente montei um HTML local com tres variantes lado a lado e olhei, acertei na primeira. Cada ciclo de deploy custa uns 2 minutos so de propagacao, alem da paciencia dele.

Tambem: quando ele diz que algo esta errado, MEDIR em vez de deduzir. Duas causas reais so apareceram na medicao:
- a figura ficava espremida 85% do ciclo (o desenho estava certo, a animacao e que esmagava)
- havia um vao de ~1s por volta em que a figura sumia da tela

**How to apply:**
- desenho/proporcao: gerar um html local com as variantes lado a lado e screenshot via Playwright
- animacao: `npm run start` local e amostrar o atributo/estilo N vezes, conferindo que muda (ver [[feedback-animacao-js-nao-css]])
- cuidado com servidor zumbi na porta 3000: matar com `lsof -ti:3000 | xargs kill -9` antes, senao o teste bate na build antiga e o diagnostico sai errado
- so depois disso commitar e subir
