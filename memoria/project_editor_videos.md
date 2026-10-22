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

**21/10/2026 · vídeo só com a voz (sem rosto):** voz clonada "Daniel-Torres" no Higgsfield (element 1e8ddc71-eade-41d5-9679-4954d2a48488, seed_audio) APROVADA pelo Daniel. Projeto `~/Daniel Torres/videos/desabafo-motion/` (Desabafo do Raio-X, 9:16): Daniel pediu o vídeo inteiro legendado em legenda cinética (cada palavra com dinâmica, ênfase dourada, risco nas tentativas), SEM legenda fixa. Áudios por bloco em videos/voz-teste/desabafo/ (narracao_completa 99s, narracao_curta 53s).

**21/10/2026 · gravação inteira editada em 3 vídeos** (`~/Daniel Torres/videos/gravacao-1021/`, finais em PRONTOS/): curto Raio-X 1min04, 4 princípios + Raio-X 3min14, 4 princípios + venda "Do WhatsApp à Cadeira" 4min01. Padrão novo (ritmo ddiasmatt + noir), 1.1x, 24 fps (celular grava 24 dentro de 30), tratamento do reel-4679. Daniel aprovou a prévia e mandou finalizar. Nome do produto falado "Do WhatsApp à Cadeira" (oficial é "à Consulta": pendente confirmar). Curto de VENDA não saiu: falta gravar frase tipo "Eu coloquei tudo isso no Do WhatsApp à Consulta".

**22/10/2026 · modo quadro branco (Reel vertical):** motor novo dentro da skill (`engine-quadro/`, `scripts/quadro.py`), a página compõe câmera + desenho (permite split). Teste aprovado em `~/Daniel Torres/videos/teste-quadro-branco/` com vídeo do Higgsfield. Virou o padrão: [[feedback-reel-quadro-branco]].
