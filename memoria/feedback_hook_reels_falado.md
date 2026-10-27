---
name: feedback-hook-reels-falado
description: "Hook de Reels do Daniel: 3 tipos aprovados (confissao com causa nomeada, ordem contra o mercado, resultado sem o obvio). Proibido abrir descrevendo a cena dela."
metadata:
  node_type: memory
  type: feedback
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-10-27T02:04:49.470Z
---

Definido em 2026-10-19, depois de duas rodadas reprovadas. O hook de Reels do Daniel e UM destes tres:

**TIPO A, confissao com a causa nomeada.** Exemplo dele: "O dia que eu perdi uma paciente porque eu respondi o valor do procedimento pelo WhatsApp." A perda ja na primeira frase, com o erro dito junto. Nao e warmup narrativo tipo "teve um dia aqui que...".

**TIPO B, ordem contra o que o mercado prega.** Exemplo dele: "Pare de fazer atendimento humanizado. Nao vai te fazer vender mais." Ela discorda no primeiro segundo e fica pra ver como ele sustenta.

**TIPO C, resultado sem o que todos acham obrigatorio.** Exemplos dele: "Como eu bati a meta do mes sem investir em trafego pago." / "Como eu recuperei R$X mil com uma mensagem."

**TIPO D, "Sabe aquela..." (aprovado 2026-10-26, pedido dele pra anúncios).** Exemplo dele: "Sabe aquela paciente que pergunta o preço, você responde e ela desaparece?" A cena do dia a dia dela como PERGUNTA de reconhecimento, falando com ela em "você". Diferente do reprovado abaixo, que narra a cena de fora em 3a pessoa. Nos anúncios, este é o tipo preferido.

**O QUE ELE REPROVOU, nao repetir:**
- Abrir DESCREVENDO a cena dela de fora: "A paciente perguntou quanto fica, alguem respondeu o valor." / "Voce abre a agenda da semana que vem, tem buraco." Palavras dele: "isso nao segura nada", "esta muito direto".
- Bloco de pergunta reflexiva depois do hook ("entao me responde uma coisa sobre a sua ultima avaliacao..."). Palavras dele: "muito estilo coach, eu nao quero isso".
- Hook em 1a pessoa como narrativa morna. A 1a pessoa vale, mas como confissao de perda, nao como historinha.

**Why:** ele quer conversa com identificacao no primeiro segundo, e provocacao contra o consenso do mercado de HOF.

**How to apply:**
- Hook contra-intuitivo cai facil em "o problema nao e X, e Y", PROIBIDO. Conferir com regex antes de entregar, inclusive nos hooks alternativos.
- O bloco seguinte continua a MESMA cena do hook, sem respiro, sem repetir o "eu travei nisso" como bloco separado.
- TEXTO NA TELA e sempre a frase que ele acabou de falar.
- TIPO C com valor em reais: deixar `R$ ______` com a nota "[Daniel preenche]". O sistema clinico NAO serve pra isso, 94% dos lancamentos (3.443 de 3.645) nao tem orcamento vinculado, logo nao ha ligacao pagamento-paciente. Ver [[conciliacao-harmoclinic]].

Exemplos aprovados em `~/Daniel Torres/reels/roteiros-120s-lote-02.md` (cada roteiro tem principal + 1 alternativo de outro tipo). O lote 01 ainda esta no formato velho.

Relacionado: [[feedback-voz-seca]], [[feedback-humor-acido-reels]], [[feedback-numeros-reais-sistema]], [[feedback-copywriter-obrigatorio]].
