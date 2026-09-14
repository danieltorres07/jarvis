---
name: Padrão visual de carrossel — variação de capa e foto de CTA
description: Regras visuais que valem pra todo carrossel de Instagram (Daniel e Linda) — variar fundo da capa e foto do slide CTA
type: feedback
originSessionId: 20b88439-8752-4943-a297-bf765a8c9c0d
---
**Regra 1 — Slide 1 (capa) pode ter fundo branco OU preto.** Não é obrigatório começar branco. Eu escolho livremente por carrossel pra dar variedade no feed.

**Regra 2 — Slide CTA (último slide) não usa sempre `perfil.png`.** A foto grande à direita do CTA deve variar entre as opções disponíveis em `~/{Marca}/images/` (ex: `~/Daniel Torres/images/`). Cada carrossel ganha uma capa de CTA visualmente diferente. O `perfil.png` continua valendo só pro avatar pequeno do header dos slides intermediários.

**Why:** Daniel quer feed com variação visual, sem repetir mesma estética em todo carrossel. A regra antiga de "sempre branco + sempre perfil.png no CTA" deixava todos os posts iguais.

**How to apply:** Toda vez que rodar `generate.py` de carrossel novo, escolher cor da capa (alternar/variar) e sortear ou escolher uma foto diferente do diretório `images/` pro slide CTA. Atualizar o agente `~/agentes/prompts-instagram.md` se a regra mudar.
