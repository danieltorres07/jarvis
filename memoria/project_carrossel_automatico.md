---
name: carrossel-automatico
description: "Sistema de geracao automatica de carrosseis Daniel Torres, configuracao de ritmo e horarios de postagem"
metadata: 
  node_type: memory
  type: project
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-09-04T22:31:27.870Z
---

Sistema autonomo de carrossel decidido em 2026-09-04.

**Configuracao:**
- Gera 4 carrosseis por dia (cron 5h) todos os dias inclusive fim de semana
- Daniel aprova 2 por dia (escolhe as melhores)
- Slots de postagem: 12:30 e 19:30
- Rejeitar dispara regeneracao infinita do mesmo tema
- Botao Arquivar manda tema pro banco de reserva
- Temas: eu gero (5 pilares + voz Daniel, COPYWRITER.md)

**Auto-post Instagram:** ainda depende da Meta Cloud API pausada por burocracia. Enquanto isso, aprovado = agenda com horario, postagem manual.

**Stack:**
- Tabela `posts_pendentes` (migration 091, rodada 2026-09-04)
- Tabela `temas_carrossel` (a criar)
- Bucket Storage `carrosseis` (publico)
- Env var `POSTS_INGEST_TOKEN` no Vercel (valor: pb26-ingest-x9k2mq4vf8)
- Painel `/admin/posts` com botoes Aprovar, Rejeitar+Regerar, Arquivar

**Why:** Daniel quer delegar producao de conteudo. Ele so quer aprovar/rejeitar, nunca criar do zero.

**How to apply:** ao construir/ajustar o fluxo, respeitar 4 gera + 2 aprova + regeneracao infinita. Nao mudar horarios sem pedir.
