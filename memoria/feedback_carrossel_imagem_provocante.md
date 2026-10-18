---
name: feedback-carrossel-imagem-provocante
description: "Carrossel com imagem provocante (fumaca, gelo, corrida, reflexo) onde o hook nasce da imagem; Higgsfield so gera quando o carrossel precisa"
metadata:
  node_type: memory
  type: feedback
  originSessionId: b781930d-bf97-4d02-b763-b71d9ebbe74b
  modified: 2026-10-16T18:51:32.186Z
---

Daniel pediu (2026-10-16) que de vez em quando o carrossel use imagem provocante/conceitual dele e o hook seja ligado a imagem. Ex: foto com fumaca -> "como parar de queimar X na clinica"; correndo -> velocidade; reflexo no vidro -> "o reflexo do atendimento ruim"; celular congelado -> orcamento que esfria em 48h. Mesma linguagem e mesma formula de hook de sempre (acao+resultado ou historia), so que amarrado a metafora da foto.

Vale nos dois sentidos: foto existente puxa o hook, ou tema puxa uma imagem nova gerada no Higgsfield (Element "Daniel" id ecd303c3-0d9c-4ef5-9f18-97ebfa2ae1fa, nano_banana_2, ~2-3 creditos/imagem, 4:5).

**Why:** quer capa que pare o scroll; ja tinha gerado retratos assim em midias/images (hf_20261016_*), muitos baseados em prompts de bananaprompts.xyz (Homem Fumaca, Running man, Urban Reflection).

**How to apply:** Higgsfield so gera imagem quando um carrossel precisar, nunca foto avulsa. Pode usar bananaprompts.xyz como base de prompt. Ver [[project-carrossel-automatico]] e [[feedback-carrossel-meio-a-meio]].

Implementado 16/10/2026: formato "provocante" no gerar-automatico.py, banco em ~/Daniel Torres/midias/provocantes/banco.json (arquivo, mostra, metaforas). Imagem SEMPRE nitida, nunca com texto por cima (no formato com foto a caixa tapava o gelo, Daniel reprovou). Sai em 2 modelos: TEXTO (template.py, capa com hook em cima e imagem embaixo, campo 'imagem' no slide capa) e VERSUS (template_versus.py, imagem em cima e as caixas vermelha/verde lado a lado embaixo, 'capa_imagem' no copy). CHANCE_PROVOCANTE 50% dos de texto e dos versus. Texto da capa SEMPRE amarrado na imagem (Daniel cobrou quando fiz versus sem a imagem). Pedidos sem imagem -> pedidos.json; resolver gastando o minimo: banco gratuito (Pexels, o versus ja usa banco-versus/) antes de Higgsfield.

**Capa provocante nunca repete (16/10):** Daniel rejeitou versus com "Repetiu imagem da capa". escolher_capa_provocante so oferece imagem com 0 usos (_usos_capa ignora pastas -previa); sem inedita que case, vira pedido em pedidos.json e o carrossel sai com capa normal. Banco tem 8 imagens, restam ~3 ineditas: repor o banco (Pexels/Higgsfield) quando os pedidos acumularem.
