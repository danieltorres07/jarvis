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
- Gera 7 carrosseis por dia (worker-manha 10:30, --quantos 7 --max-fila 15) todos os dias
- Daniel aprova 5 por dia (desde 2026-10-19; antes eram 2)
- Slots de postagem: desde 2026-10-19 sao 10:30, 12:30, 15:30, 17:30, 19:00 (antes 17:50 e 19:30). Fonte unica: portal lib/posts-slots.ts (slotsDoDia por data). Launchd com.danieltorres.publicar-HHMM pra cada um (os antigos 1750/1930 ficaram carregados, inofensivos, podem ser removidos).
- Jarvis avisa no WhatsApp 30 min antes de cada slot se nao tem post aprovado (carrossel ou reel): rota /api/cron/aviso-post-sem-aprovado, launchd com.danieltorres.aviso-post-HHMM -> _master/aviso-slot.sh. Cai no e-mail se a janela de 24h da Meta estiver fechada. Disparo preciso pelo launchd do Mac (com.danieltorres.publicar-1750 / -1930 -> _master/publicar-slot.sh, log em _master/publicar-slot.log, auth com POSTS_INGEST_TOKEN). Cron da Vercel (Hobby, sem precisao de minuto, chegou a atrasar 1h) virou rede de seguranca as 22:00 BRT
- Rejeitar dispara regeneracao infinita do mesmo tema
- Botao Arquivar manda tema pro banco de reserva
- Temas: eu gero (5 pilares + voz Daniel, COPYWRITER.md)
- CTA: desde 2026-10-14 fixo em todo carrossel, briefing do Jarvis nao muda mais o CTA. Ver [[feedback-cta-rx26-padrao]]

**Auto-post Instagram:** FUNCIONANDO (portal/lib/instagram/publicar.ts). Teto de 10 imagens por carrossel. CRON_SECRET na Vercel e 'sensitive' (vercel env pull devolve [ENCRYPTED]), por isso o disparo local usa POSTS_INGEST_TOKEN.

**Stack:**
- Tabela `posts_pendentes` (migration 091, rodada 2026-09-04)
- Tabela `temas_carrossel` (a criar)
- Bucket Storage `carrosseis` (publico)
- Env var `POSTS_INGEST_TOKEN` no Vercel (valor: pb26-ingest-x9k2mq4vf8)
- Painel `/admin/posts` com botoes Aprovar, Rejeitar+Regerar, Arquivar

**Why:** Daniel quer delegar producao de conteudo. Ele so quer aprovar/rejeitar, nunca criar do zero.

**How to apply:** ao construir/ajustar o fluxo, respeitar 7 gera + 5 aprova + regeneracao infinita. Nao mudar horarios sem pedir (ultimo pedido: 5 por dia a partir de 19/10).

**Formato versus (desde 2026-10-15):** 3o formato, replica do carrossel "Stories que ninguem liga vs que vendem" (ref. @mariaeduardasv). Tela dividida vermelho/verde, capa com 2 recortes do Daniel (midias/images/transparents), comparacoes story/whatsapp/story_triplo, salvar no slide 5, RX26 no 10. CHANCE_VERSUS = 0.25 em gerar-automatico.py; regeneracao mantem versus; fica fora da conta 70/30. Render em _master/template_versus.py, banco de 58 fotos Pexels em _master/banco-versus/index.json. Modelo devolve nao_cabe -> cai no formato normal. Daniel aprovou o visual da referencia ("ficou sensacional").
Regras do Daniel pro pos (15/10): no pos-consulta/retorno quem manda a 1a mensagem e a CLINICA; retorno pos-procedimento e em media 15 dias (nunca 30) e ja sai agendado no dia do procedimento, entao a msg dessa fase e pos-retorno com cuidados de casa, nunca oferta de horario; conversa de WhatsApp com ida e volta real (linha "P: " = paciente no template_versus) em vez da clinica falando sozinha.
Aviso no app do Claude (15/10): rotinas na nuvem jarvis-aviso-post (cron UTC 45 12,14,17,19) e jarvis-aviso-post-1815 (15 21), 45 min antes de cada slot (pedido do Daniel por causa do atraso da nuvem); status-post olha 75 min a frente, mesmo ambiente do jarvis-status-diario. Leem /api/status-post (publico, so devolve se o slot da proxima hora tem aprovado + qtd pendentes) e chamam PushNotification se avisar=true. Disparo da nuvem atrasa ~5-15 min. Se mudar os slots, ajustar o cron dessas rotinas.
2026-10-16: a nuvem do Claude BLOQUEIA clinicasaltovoo.vercel.app (proxy, connect_rejected), entao as rotinas nao chamam mais /api/status-post. Caminho atual: launchd com.danieltorres.aviso-jarvis (Mac, 09:35 11:35 14:35 16:35 18:05) roda _master/aviso-jarvis.sh -> /api/cron/aviso-post-jarvis grava memoria/aviso-post.json no repo danieltorres07/jarvis -> rotinas jarvis-aviso-post/-1815 leem o arquivo (ignoram se gerado_em > 40 min) e mandam PushNotification. Depende do Mac ligado, igual a publicacao. Se mudar horario de rotina, mudar o plist junto.
- 2026-10-16: versus com WhatsApp so quando a comparacao e conversa de verdade (teto 4/3/2 por tipo de tema, sempre >=2 tipos); novo tipo 'acao' (foto + jeito de agir, sem mensagem simulada); foto escolhida pelo modelo por id do catalogo banco-versus/index.json (descricao + ativa), tag so de reserva. Doc em CARROSSEL_MASTER.md secao 15.
- 2026-10-16 (tarde): versus SEM cota de WhatsApp (teto e mistura de 2 tipos removidos, modelo decide pela necessidade; regra de conteudo mantida); banco-versus ganhou 10 fotos (secretaria x6, retorno, equipe, estoque x2; 4 Pexels + 6 Higgsfield, 9 creditos); foto que falta vira "foto_ideal" -> banco-versus/pedidos.json, resolver com _master/pedidos-versus.py (--resolver pv-00X --foto id re-renderiza e re-sobe com ?v= se o post ainda esta pendente); caption do versus reprovada se fechar com moral (checar_moral_legenda). Doc em CARROSSEL_MASTER secao 15.
Capa do versus tem que mostrar que e de clinica (Daniel 16/10, "Respostas que congelam ali" foi vago): caixas nomeiam a paciente/consulta/clinica (ex. "Respostas que fazem a paciente agendar") + faixa capa.publico em cima ("No WhatsApp da clinica de harmonizacao"). Filtro _RE_NICHO barra capa e publico sem palavra do nicho. Na capa provocante o texto continua amarrado na imagem.
Temas acabam: o gerador NAO cria tema, so pega temas_carrossel status=pendente. Em 16/10 a lista zerou (geracao parada) e cadastrei 25 temas novos (comercial/gestao/marketing/micro_resultado, angulo "MODO: ACAO"; experiencia_real e pessoal so com historia real do Daniel). Com 5 posts/dia, ~35 temas/semana: conferir estoque de temas pendentes sempre que mexer na fila.
Reposicao automatica de temas (16/10): repor_temas() no inicio do main do gerar-automatico.py (nao roda em --previa/--tema-id). Se pendentes < TEMAS_MINIMO (10), pede TEMAS_REPOR (15) ao Claude: metade assunto ja usado com ANGULO novo (Daniel: "temas podem se repetir, so mudar o angulo"), metade novo; pilares comercial/gestao/marketing/micro_resultado; angulo "MODO: ACAO | ...". Titulo sempre reescrito e checado contra temas e pastas existentes (mesmo titulo = mesma pasta = sobrescreve carrossel antigo).
Entrega literal (16/10, carrossel "As perguntas que fazem a paciente contar a dor" so explicava): tema que promete perguntas/mensagens/frases/respostas tem que trazer a fala escrita entre aspas no lado verde; validar_versus exige >=4 perguntas com "?" e barra pergunta repetida (raiz de 5 letras, Jaccard >= 0.4). VERSUS_EFEITO pega "nao compra X. Ela compra Y". Falha nas 3 tentativas devolve o tema pra pendente (main e worker-regenerar), antes ficava travado em_producao.
Slide 10 (RX26) do versus: fundo NEUTRO em gradiente escuro (brilho vermelho em cima/esquerda, verde embaixo/direita, grao), sem foto (Daniel 16/10; antes saia mulher do banco). As 3 fotos dele no palco ficam em midias/images so pra usar quando precisar (FOTOS_CTA_DANIEL guardado em template_versus.py, nao usado).
Capa do versus (aprovada 16/10, teste A/B): CHANCE_LADO_A_LADO = 0.5 em template_versus.py, sorteio na criacao, gravado em _origem.capa_disposicao pra comparar desempenho depois.
- "empilhado" (ref. capa da fumaca): faixa publico + caixa vermelha a esquerda, VS pequeno (44px) abaixo do centro da vermelha sem encostar em nada (JS posiciona), caixa verde encostada na direita. Margem 28px dos dois lados (grade 3:4 do perfil corta ~13px de cada lado). Na provocante o grupo de textos desce e encolhe (0.82) e a imagem encolhe ate o "foco" ficar inteiro acima.
- "lado_a_lado" (ref. capa do terno): imagem em cima (410px, fundo desfocado + degrade), faixa e as 2 caixas lado a lado embaixo com "vs", mesma letra nas duas.
- Nenhum texto cobre o rosto do Daniel nem o objeto da metafora: "foco" [x0,y0,x1,y1] de cada imagem em midias/provocantes/banco.json (imagem nova precisa de foco). Recorte do Daniel com cabeca 150px pra rosto ficar acima da caixa vermelha.
Modelos de carrossel hoje: versus empilhado, versus lado a lado, nativo (foto do Daniel + caixa branca), texto (capa provocante as vezes).
Capa empilhada (19/10): os dois cards (vermelho e verde) sempre com a MESMA letra e a MESMA largura (JS iguala: fonte da menor, largura da maior). Template aceita mais de 5 comparacoes (cs[3:]) e etiqueta "sequencia" pra conversa dividida em 2 slides ("CONVERSA · PARTE 1 DE 2 · CONTINUA NO SLIDE X"). Carrossel com 11 slides nao publica (API max 10): Daniel escolhe o que tirar.
- 19/10: 10 fotos novas do Daniel geradas no Higgsfield (Element Daniel, nano_banana_2) pro formato nativo, salvas em ~/Daniel Torres/midias/carrosseis/ (selfie-recepcao-*, selfie-cafe-*, selfie-carro-*, escritorio-notebook-*, corredor-clinica-*, consultorio-bracos-cruzados-*, selfie-sala-*). Os 8 nativos da fila trocaram de foto pra elas. Caixa "cima" (slide com 2 textos) tapa ate ~30% da altura: foto boa tem os olhos abaixo disso.
- 19/10 (tarde): selfies IA sorrindo reprovadas, movidas pra midias/carrosseis/_descartadas-ia/. Fotos "tema-*" em midias/carrosseis/ = foto seria do Daniel com a metafora do tema (Higgsfield nano_banana_2 + Element + 2 fotos reais como referencia, que deixa a barba cheia como a real), uma por carrossel nativo; fotos_disponiveis() ignora "tema-" (fora do rodizio). Composicao: rosto no meio (olhos ~38%), objeto logo abaixo; quando a caixa de baixo tapa o objeto, usar "pos":"cima" no copy.json.
Formato "com foto" NOVO (19/10, Daniel escolheu o estilo 2 de 4 previas): capa = foto dele em tela cheia + faixa publico + hook com marca-texto; miolo = passo a passo com "print" (whatsapp/ficha/agenda/lista) e rabisco a mao (circulo, sublinhado, seta, nota em Caveat), fundo claro pontilhado. Sem comparacao, sem vermelho/verde. Substitui o nativo. Contrato: _master/FORMATO-PRINT.md (print-copy.json). Ref visual: carrosseis/_estilos-foto/estilo-2-print/. Ele REJEITOU o hibrido capa-foto + miolo versus.
- 19/10 (noite): formato PRINT implementado no gerador. `template_print.py` (render de print.json), `fotos-tema.json` (slug -> foto tema- da capa; senao rodizio de fotos reais), `gerar_copy_print`/`validar_print`/`montar_print` no gerar-automatico.py; o lado "foto" do 70/30 agora sai print (nativo so com --formato nativo), print.json marca a pasta, rejeitado regera print. Converter existente: `_master/converter-para-print.py <slug>` (le print-copy.json, guarda antigo em _antes-print/, nao sobe). Doc: CARROSSEL_MASTER.md secao 16.
Legenda padrao CURTA (19/10, Daniel escolheu "como a dos stories"): 1a linha @, ate 2 paragrafos curtos (situacao + 1 acao concreta), RX26, 4 a 6 hashtags do vocabulario. Os 8 print da fila foram reescritos assim.
