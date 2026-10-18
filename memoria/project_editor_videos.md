---
name: project-editor-videos
description: "Skill propria editor-videos-daniel (motion noir das landings sobre video falado) criada 2026-10-16; primeiro projeto e o VSL do Raio-X, video completo entregue 16/10 (formato unico, landing adapta)"
metadata:
  node_type: memory
  type: project
  originSessionId: aa360c59-63c5-4b60-895c-d53d88e0a39a
  modified: 2026-10-16T17:35:02.649Z
---

Skill `editor-videos-daniel` em `~/.claude/skills/editor-videos-daniel/` (visual noir, motor HTML+GSAP capturado via Playwright, whisper.cpp local, trilha/efeitos Mixkit, saida 16:9 4K + 4:5 1080x1350 com legenda). Criada do zero em 16/10/2026 porque a skill do Mateus Dias (yt-ddiasmatt-animation, instalada no app) veio so com o SKILL.md, sem referencias nem motor, e com identidade de outro canal.

Primeiro projeto: `~/Daniel Torres/videos/vsl/` = video de espera do Raio-X (4:07, `~/Downloads/VSL.mp4`). 25 cenas com copy do copywriter, checagem limpa nos dois formatos. NO AR desde 16/10/2026 na tela /diagnostico-comercial/processando/[id] (abre logo depois de enviar o formulario do Raio-X): VSL + barra de 180 s, depois botao "Ver meu Raio-X" pro resultado. Video e capa no bucket publico `videos` do Supabase (raio-x/vsl_web.mp4 44MB, raio-x/vsl_capa_v2.jpg); limite 50MB por arquivo. Legenda fixa o video todo, animacao na tira acima dela.

**Why:** Daniel quer VSL na landing (horizontal) e no mobile (escolhi 4:5 pra nao esconder o botao da landing no celular).
**How to apply:** proximo video dele = usar a skill, copiar project.json do VSL. Sugerir remover a skill do Mateus do app pra nao disparar no lugar. Relacionado: [[project-lp-whatsapp-consulta-v3]], [[feedback-copywriter-obrigatorio]].
