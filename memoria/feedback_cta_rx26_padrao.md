---
name: feedback-cta-rx26-padrao
description: "Todo carrossel do Daniel tem salvar/compartilhar fixo no meio e \"comente RX26\" fixo no ultimo slide, palavras exatas, nunca variar"
metadata:
  node_type: memory
  type: feedback
  originSessionId: fced702b-4225-4970-b22e-406b511e90c9
  modified: 2026-10-14T15:38:02.975Z
---

Decidido em 2026-10-14, depois da analise da @luanamariamarina ([[reference-luana-concorrente]]).

Todo carrossel (automatico ou manual) tem dois pedidos, com estas palavras EXATAS:
- Meio, logo apos a entrega principal: "Antes de continuar, já salva e compartilha com uma profissional da harmonização que você conhece."
- Ultimo slide, sozinho: "Agora se você quer atrair e vender mais para seus pacientes, comente **RX26** que te envio no direct." (RX26 em negrito)
- Legenda: 1a linha "Me segue aí em @danieltorres.b", corpo, a frase do RX26 sem negrito (unicode quebra ManyChat), hashtags.

**Why:** havia 6 variacoes de CTA espalhadas (PB26, PLAYBOOK, TICKET...). Daniel quer todo post capturando lead igual a Luana. A frase do meio foi pedido dele: "estilo dela mesmo", falando de profissional da harmonizacao.

**How to apply:** o gerador aplica sozinho (`padronizar_ctas`/`padronizar_legenda` em `_master/gerar-automatico.py`). Fila antiga: `_master/padronizar-fila.py --aplicar` (rodar com PATH="/usr/bin:$PATH", o python do homebrew nao tem Playwright). Temas sem historia real do Daniel levam "MODO: ACAO" no angulo, senao o modo historia inventa "o dia que eu...". Relacionado: [[carrossel-automatico]].

Se o modelo passa de 9 slides, `_caber_no_teto` pede reescrita (cortar no escuro sumia com o item 3 de capa que prometia 3 coisas). Toda leva nova: revisar se a capa promete N e entrega N, e perguntar ao Daniel quando a capa/legenda conta historia em 1a pessoa.
