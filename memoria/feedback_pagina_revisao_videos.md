---
name: feedback-pagina-revisao-videos
description: "Edição de vídeo com variações → gerar todas e jogar numa página de revisão lado a lado (localhost:8790) com Aprovar/Pedir ajuste, em vez de abrir um por um"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 075ce904-e0c2-4874-b301-b306b3c7fd22
  modified: 2026-11-05T14:52:48.028Z
---

Desde 05/11/2026: quando editar vídeo (principalmente com mais de uma variação/editor), gerar tudo de uma vez e colocar numa página com os vídeos lado a lado, onde o Daniel aprova ou pede ajuste. Não ficar abrindo arquivo por arquivo nem pedindo "ok" vídeo a vídeo.

Página pronta em `~/Daniel Torres/videos/revisao/`: `servidor.py` (porta 8790, `python3 servidor.py`), `index.html` (visual noir), `videos.json` (lista: grupos → videos com id, titulo, editor, formato, duracao, arquivo, nota, estado "entregue" opcional), decisões gravadas em `decisoes.json` (status aprovado/ajuste + nota). Ler `decisoes.json` quando ele disser que terminou.

**Why:** ele pediu ("igual você abriu com os carrosséis, coloque lá os vídeos um ao lado do outro… do que ficar abrindo um por um").
**How to apply:** toda edição de [[feedback_cardapio_editores]]: renderizar as prévias de todas as variações, atualizar `videos.json`, subir o servidor se não estiver rodando e abrir http://localhost:8790. Ver também [[feedback_videos_prontos_limpeza]].
