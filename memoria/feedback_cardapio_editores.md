---
name: feedback-cardapio-editores
description: Todo pedido de edição de vídeo começa perguntando qual editor (cardápio /editar com 6 editores); cada editor é uma skill separada
metadata:
  node_type: memory
  type: feedback
  originSessionId: abbe6fdf-6beb-4634-a64f-adbd1d352ea0
  modified: 2026-11-03T17:12:26.628Z
---

Desde 2026-11-03, quando o Daniel pede pra editar um vídeo, a primeira coisa é a skill `editar`: abre `~/.claude/skills/editar/cardapio/cardapio.jpg` e pergunta qual editor (pode escolher vários, um por variação). Editores: 1 Quadro Branco, 2 Legenda Cinética, 3 Noir Clássico (os três em `editor-videos-daniel`), 4 Efeitos (`efeito`, do Rafa Grandi, instalado em ~/.claude/skills/efeito, visual original colorido com texto em PT), 5 Editonny, 6 Cortes (`edit-labs-ai`).

**Why:** ele não quer todos os vídeos com a mesma edição; pensa nos estilos como "editores diferentes" e quer escolher a cada pedido (ex.: variações de criativo pro Meta Ads).

**How to apply:** pedido de edição sem editor nomeado → `editar` antes de tudo. Pedido que já nomeia o editor → direto pra skill dele. Arquivo final em PRONTOS leva o nome do editor. Ver [[project_editor_videos]], [[feedback_reel_quadro_branco]], [[project_avaliacao_skills_externas]].
