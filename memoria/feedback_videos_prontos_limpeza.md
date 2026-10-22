---
name: feedback-videos-prontos-limpeza
description: "Video aprovado vai pra ~/Daniel Torres/videos/PRONTOS/ e todo intermediario (versao sem audio, quadros, previas, masters) e apagado do projeto; fica so o final"
metadata:
  node_type: memory
  type: feedback
  originSessionId: a61d5942-9973-4625-881b-b2c1d4532190
  modified: 2026-10-22T20:40:40.395Z
---

Regra do Daniel em 2026-10-22, reforçada no mesmo dia ("Todos os vídeos que você editar, faça isso. Deixe apenas a versão final e limpe o restante dos arquivos"), vale pra QUALQUER edição de vídeo, não só o modo quadro branco: "todos os vídeos que forem aprovados, você deixa na pasta prontos. E os outros (versão sem áudio, etapa intermediária), depois do vídeo aprovado, pode apagar, deixar apenas o vídeo final."

**Why:** não ocupar espaço na máquina. A pasta de vídeos chegou a ~6 GB, quase tudo intermediário (só o VSL tinha 2,6 GB).
**How to apply:** assim que ele aprovar, mover o final pra `~/Daniel Torres/videos/PRONTOS/` com nome `ONDE - tema - 9x16 - duração.mp4` (REEL ou TRAFEGO, ver LEIA.txt da pasta) e apagar `out/`, quadros, prévias e áudios de trabalho do projeto. Código (scene.js, project.json, docs) fica, é pequeno. Não apagar nada ANTES da aprovação, e nunca apagar a matéria-prima de um vídeo cujo final ainda não existe. Antes de limpar, confirmar que o final está na PRONTOS (cmp byte a byte). Exceção: VSL do Raio-X fica em `videos/vsl/out/vsl_web.mp4` (o arquivo no ar), por ordem dele. Ver [[feedback-reel-quadro-branco]], [[project-editor-videos]].

Aplicado em 22/10/2026: vsl (só vsl_web.mp4 no ar + código), reel-4679/4680/10mil, desabafos, teste-quadro-branco. Pasta de vídeos foi de ~6 GB pra 1,4 GB. gravacao-1021 ficou intocada: ver [[project-editor-videos]].
