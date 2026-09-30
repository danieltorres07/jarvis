---
name: reference-supabase-storage-upload
description: "Upload pro Supabase Storage do portal exige header apikey junto do Authorization, senão dá 403 \"Invalid Compact JWS\""
metadata:
  node_type: memory
  type: reference
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-30T21:18:32.028Z
---

A chave do portal (`SUPABASE_SERVICE_ROLE_KEY` no `.env.local`) é do formato novo
`sb_secret_...`, que não é JWT. Upload via curl no Storage só funciona mandando os
dois headers:

```
-H "apikey: $SUPABASE_SERVICE_ROLE_KEY" -H "Authorization: Bearer $SUPABASE_SERVICE_ROLE_KEY"
```

Só com `Authorization` o Storage responde 403 `{"message":"Invalid Compact JWS"}`.
As chamadas ao PostgREST (`/rest/v1/`) já vinham com `apikey`, por isso funcionavam.

Caminho dos slides no bucket: `carrosseis/{slug}/slide_01.png`.
Usar POST com `x-upsert: true` pra sobrescrever.

Relacionado: [[project_carrossel_automatico]] — o painel de aprovação lê do Storage,
não das pastas locais, então regenerar PNG sem subir não muda nada na tela dele.
