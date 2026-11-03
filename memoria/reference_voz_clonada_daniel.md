---
name: reference-voz-clonada-daniel
description: "Voz clonada do Daniel fica no Higgsfield (elemento \"Daniel-Torres\"); usar pra narração; cortar as pausas longas entre parágrafos"
metadata:
  node_type: memory
  type: reference
  originSessionId: 000b5b15-c07f-4992-b0bc-49ce28cd3cbc
  modified: 2026-11-03T14:56:16.799Z
---

A voz clonada do Daniel está no **Higgsfield**: `list_voices` → "Daniel-Torres", voice_type `element`, voice_id `1e8ddc71-eade-41d5-9679-4954d2a48488`. Gerar com `generate_audio` model `seed_audio` (~5,6 créditos por 1 min de texto). Não tem chave ElevenLabs no computador e o Kairogen não tem clone.

Primeiro uso: narração do vídeo demo do Atende & Vende (aprovada 03/11/2026, PRONTOS/atende-e-vende-demo-narrado-51s.mp4, código em ~/Daniel Torres/videos/demo-atende-vende-narrado/codigo/).

**Cuidados:**
- Linha em branco entre parágrafos vira 6 a 8 s de silêncio. Cortar com ffmpeg (silencedetect + atrim) pra menos de 1 s.
- Escrever "Atende e Vende" no texto falado (o "&" pode ser lido errado).
- Transcrever com `whisper --word_timestamps True` pra casar as cenas com cada frase.

Ver [[feedback_videos_prontos_limpeza]] e [[project_atende_vende_pronto]].
