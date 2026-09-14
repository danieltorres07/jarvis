---
name: feedback-pdf-linda-laureo
description: "Template oficial de PDF da Dra. Linda Italia agora e o Laureo (Grecia antiga, selo Laureo, fonte Forum)"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 3392e276-d919-4863-90f5-385615b71134
---

Template oficial de PDF entregavel da Dra. Linda Italia agora e o Laureo, baseado no metodo Laureo dela (referencia a coroa de louro da Grecia antiga). Substituiu o template clean/minimalista anterior.

**Why:** Daniel aprovou o novo design e mandou substituir o antigo. Voz visual do metodo Laureo deve aparecer em todos os entregaveis da Linda dali pra frente.

**How to apply:** Para qualquer PDF novo da Linda, duplicar `~/Linda Italia/carrosseis/flacidez/pdf.py` como referencia e trocar apenas a copy. Caracteristicas obrigatorias:
- Fontes: Forum (display, titulos, tags) + Cormorant Garamond (body, italic)
- Selo Laureo (`~/Linda Italia/images/laureo-logo-transparent.png`) na capa e CTA, versao pequena no cabecalho das paginas internas
- Paleta marrom oficial mantida (#B07F49 / #CEAE8F / #5E381E / #835230 / #D8DACE / #F8F4ED)
- Numeral romano grande translucido (opacity 0.55, 120px, 32mm x 32mm) no canto inferior direito das paginas de preceito, no lugar onde antes ficavam icones tematicos
- Sem meandros/greek keys no topo e rodape (Daniel achou poluido)
- Sem numeracao romana nas tags nem no rodape, so a romana grande no canto
- Foto da Linda na capa e no CTA, ambas em moldura com filetes duplos dourados
- Capitular (dropcap) dourada na primeira letra do prologo
- How-box estilo placa de marmore (filetes duplos laterais)
- Tags "PROLOGO", "QUANDO BUSCAR CONSELHO", "TRES RITUAIS" (linguagem do metodo)

Backups do template clean antigo ficaram em `~/Linda Italia/carrosseis/flacidez/pdf.py.bak-original` e `rosto-flacido-original.pdf.bak` caso precise consultar.

Relacionado: [[feedback-carrossel-visual]], [[feedback-linda-consulta]]
