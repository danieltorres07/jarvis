---
name: project_operacao_cliente_oculto
description: "Operacao de venda do Atende & Vende Implantado via cliente oculto + metodo Chris Voss, toda dentro do Leads Daniel no CRM Volo; blocos A-D, estado em 26/10/2026"
metadata:
  node_type: memory
  type: project
  originSessionId: bc9728fe-8561-4c48-873e-125aaffc694a
  modified: 2026-10-26T22:34:04.928Z
---

Decidido 26/10/2026. Oferta: Atende & Vende Implantado (implantação completa em 30 dias, com ajustes se precisar). PREÇO DECIDIDO 30/10: "de R$ 2.497 por R$ 997" (substitui 997/1.997 e o R$ 2.497 da campanha de 22/10). Landing de venda direta no ar em clinicasaltovoo.vercel.app/atende-e-vende (SEM checkout/Hotmart desde 30/10: TODOS os botões vão pro WhatsApp do Daniel 5531993304314 com mensagem pronta; noindex até ele mandar publicar, flag `publicada` no _config.ts; preço e condições também lá), garantia de mais consulta agendada em 30 dias. Meta 10 clínicas em 90 dias, Daniel com 3h/dia.

Fluxo: filtrar → cliente oculto (Daniel manda como paciente pelo CHIP SEPARADO no WhatsApp Web do navegador) → print analisado → DM pra Dra. no Instagram com pergunta que pede "não" (Voss) → conversa com rótulo + pergunta calibrada → call 20 min (inventário de acusações) → fechamento. Sumiu: "Dra., você desistiu de arrumar o WhatsApp da clínica?". Base: livro "Negocie como se sua vida dependesse disso" (o PDF em ~/Downloads é só amostra do cap. 1).

Leads Daniel tem DOIS caminhos (Daniel escolheu não separar o funil): prospecção Prospect → Oculto enviado → Print analisado → DM enviada, e landing Novo → Em contato → D+2 → D+5 → D+9; os dois se juntam em Respondeu → Call marcada → Qualificado → Ganho/Perdido. `CAMINHOS_DO_FUNIL` no CrmBoard.tsx faz o "Enviar →" não pular de caminho. Fila do dia = próxima ação "Fila 01".."Fila 10" (sobe pro topo com selo).

Blocos (Daniel aprovou a ordem e quer ir conferindo cada um):
- A FEITO 26/10: etapas, 10 primeiros na fila, 31 cartões de prospecção que já tinham DM em "DM enviada".
- B FEITO 26/10: mensagens do copywriter gravadas como [RASCUNHO] em Prospect, Oculto enviado, Print analisado, DM enviada, Call marcada, Qualificado. Convenção no texto da etapa: --- separa versões, "# título" nomeia, [RASCUNHO] trava (botão Aprovar em Gerenciar). lib/crm/mensagens-etapa.ts + PainelMensagensEtapa.tsx. Só etapas do chip espalham versão por cartão; nas outras o botão usa a v1. DM usa {gancho} (bloco C preenche).
- Ajustes 26/10: os 31 que tinham DM antiga do robô voltaram pro Prospect; msg antiga de IG do Prospect removida (texto: "Olá Dra. {primeiro_nome}, tudo bem? / Meu nome é Daniel, sou aqui de MG. / Vou ser 100% honesto com você: eu tenho uma proposta pra te fazer relacionada à sua clínica. / Você prefere já desconsiderar ou me dá 30 segundos e depois decide se isso pode ser bom pro seu negócio?"); "Obrigada!" do Oculto enviado virou "Valeu!". Call marcada e Qualificado seguem em rascunho.
- C FEITO 26/10 (commit no portal "cliente oculto com analise de print"): IaProspeccao.tsx no cartão de prospecção. analisarClienteOculto sobe prints no bucket PRIVADO prospeccao-prints/{cartaoId}/, Opus 5.5 + fallbacks default devolve tempo/preço seco/convite/follow-up/erro/gancho, grava gancho + bloco nas observações e move pra Print analisado. sugerirRespostaConversa (prints em {cartaoId}/conversa/) devolve leitura, rótulo, pergunta calibrada, mensagem, versão curta, próximo passo. Prompts em lib/crm/prospeccao-ia-prompts.ts. Testado com print falso: gancho saiu no formato certo.
- D: roteiro de call e objeções dentro do CRM.

**Why:** Daniel quer operar tudo só pelo CRM do sistema dele.
**How to apply:** nunca enviar mensagem automática; textos finais passam por copywriter + aprovação dele ([[feedback_scripts_construcao_colaborativa]]). Relaciona com [[prospeccao]] e [[project-projeto-teste-prospeccao]].

Landing /atende-e-vende (30/10/2026), decisões do Daniel:
- Só DUAS cores de fundo: creme (#ede2cf) e o escuro do fundo da foto dele (#22221e). Nada de tone-alt, faixa dourada ou brilho.
- Seção "Eu monto toda a estrutura" com a foto dele (public/images/atende-e-vende/daniel.jpg) dissolvendo no fundo escuro.
- Card de valores: mockup (notebook + celular) + no máximo 8 itens curtos + "de R$ 2.497 por R$ 997" + botão. Condições (pagamento, pré-requisitos, reuniões, não incluso, desistência) ficam no FAQ.
- Topo animado em requestAnimationFrame com a sugestão REAL gerada pelo assistente (instrucoes.txt v2.0 + base-do-metodo.md).
- Vídeo demo 30 s sem voz: public/videos/atende-e-vende-demo.mp4 (cópia em ~/Daniel Torres/videos/PRONTOS/atende-e-vende-demo-30s.mp4), montado com ffmpeg a partir de tutorial-crm/out/capitulos (06-crm 6.5s, 15-aparencia 3s, 07-gerenciar 40s, 02-dashboard 4.5s) + gravação da cena da assistente. ffmpeg local NÃO tem drawtext: legenda vira PNG via Playwright.
- Pendente: liberar no Google (publicada=true) quando ele mandar. (O CRM Clínicas, que é o produto, JÁ TEM o "Sugerir resposta" com 3 opções: crm-clinicas/app/actions/sistema-clinico/ia.ts; no portal é app/admin/sistema-clinico/_components/SugerirResposta.tsx).
- 30/10 (rodada 2): topo animado agora imita o CRM REAL da Clínica Demo (fundo #f5f5f7, rosa #b76d79, colunas Entrada/Em contato/Respondeu, modal "CRM · Detalhes da oportunidade", rótulos reais da assistente: "Cola aqui a resposta dela", "Sugerir resposta", "Pensando…", "Mensagem pronta", "Copiar"); telefones mascarados. Texto: branco puro no escuro, preto puro no claro. Preço: "De R$ 2.497" vermelho (#ff6b6b), "12x de R$ 99" verde (#4ade80), à vista menor. Botões dourados claros com texto preto, cor cheia mesmo com link pendente.
- 30/10 (rodada 3): topo usa o fluxo REAL do SugerirResposta (ícone ✦ no cartão > "ASSISTENTE · Sugerir resposta pra Paula" > "Sugerir 3 respostas" > "Pensando nas respostas…" > 3 respostas com "quando" + "Enviar no WhatsApp"/"Copiar"), textos gerados pelo próprio gerador do CRM (Sonnet 5.5). Seções do problema e "Para quem é" em texto corrido (Daniel não quer copy picotada). Fechamento: "Ainda tem uma dúvida?" + botão "Quero conversar com o Daniel e entender melhor como funciona". Sem botão "Ver como funciona" no topo.
- 30/10 (rodada 4): PALETA NOVA da landing escolhida pelo Daniel: escuro = petróleo #0f2a33, claro = off-white #f4eee6, botões no escuro = champanhe #f0c46b (texto petróleo), no claro = petróleo (texto branco), destaques areia #f2c9a0 no escuro e verde-petróleo #1d6b78 no claro. Ele rejeitou paletas "vivas demais" (verde neon, laranja, magenta = cara de infoproduto barato). Celular: animação menor acima do título, botão na 1ª dobra (testado iPhone SE/14/Pro Max). Título da seção do problema: "Você atende o dia inteiro e ainda cuida da clínica. Chamar paciente antiga vai ficando pra depois."
