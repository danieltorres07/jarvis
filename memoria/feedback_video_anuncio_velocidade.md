---
name: feedback-video-anuncio-velocidade
description: "Criativo de anúncio: acelerar até a duração pedida SEM perder quadro (fps sobe), 1,1x achou rápido; CRM por dentro sempre em janela dentro da área segura"
metadata:
  node_type: memory
  type: feedback
  originSessionId: abbe6fdf-6beb-4634-a64f-adbd1d352ea0
  modified: 2026-11-04T14:24:16.029Z
---

Criativos do Atende & Vende pro Meta (03-04/11/2026, 6 variações em PRONTOS "TRAFEGO - atende e vende criativo 1/1b - <editor> - 9x16 - 28s"):

- Velocidade: 1,1x ficou "muito rápido"; ele fixou duração (28s) em vez de fator. Acelerar SEMPRE mantendo todos os quadros: `setpts=PTS/f` + `-r <quadros>/<duração>` (sai 31 a 37 fps). Com `fps=30` o ffmpeg joga quadro fora e ele viu "travar".
- Pra chegar na duração com menos aceleração, cortar pausas/respiros (Editonny chegou a 28,8s só limpando).
- CRM por dentro: ele quer ver a tela "Hoje · Chamar hoje" e o "Sugerir resposta" com as 3 mensagens (fonte: PRONTOS/atende-e-vende-demo-narrado-51s.mp4, Hoje ~13-17s, sugestões ~31-34s). Escolheu a opção janela dentro da área segura (x 216-864, y 376-1522) em vez de tela cheia.
- Efeitos/motions sempre com som (Editonny só põe se pedir: ligar `audio.effects`).

**Why:** ele assiste no celular e trava/corrido derruba o criativo; quer o produto aparecendo de verdade.
**How to apply:** todo criativo de tráfego. Ver [[feedback_cardapio_editores]].
