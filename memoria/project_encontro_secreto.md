---
name: project-encontro-secreto
description: "Encontro Secreto Método Láureo, evento online GRATUITO (era R$ 27 até 25/11) domingo 29/11/2026 20h no Meet com Linda, Daniel e Matheus Cabral; arte, copy e LP em andamento"
metadata:
  node_type: memory
  type: project
  originSessionId: 4356cfaa-0833-4a03-bc76-4f241de56158
  modified: 2026-11-24T15:59:33.347Z
---

Evento online pra profissionais HOF e donos de clínica, domingo 29/11/2026 às 20h, Google Meet. DESDE 25/11 É GRATUITO: Asaas e CPF saíram. Formulário → POST /api/encontro-secreto salva no funil (etapa "Inscrito", era Aguardando Pix) → /encontro/obrigado?r=<cartaoId> → GET confere o cartão e devolve o link do grupo. Pixel: Lead + CompleteRegistration (sem valor). Cobrança de prévia do Asaas apagada. Código do Asaas pro encontro (confirmarPagamentoEncontro, webhook) ficou no lib sem uso. Quem fala: Dra. Linda (técnica/consulta), Daniel (vendas e gestão), Matheus Cabral (gestor de tráfego). O presente (mesma ferramenta mostrada no encontro) é o CRM da clínica, REVELADO na página desde 25/11 (leads, follow-up, caminho da paciente, recuperação da base).

- Arte pronta: `~/Daniel Torres/encontro-secreto-laureo/FINAL/` (quadrado + story), recortes em `assets/`
- Textos aprovados em 24/11: texto curto com a arte (voz Daniel) e áudio de 30s da Linda
- LP NO AR desde 24/11: https://clinicasaltovoo.vercel.app/encontro (variante A escura + tipografia 5 "estilo Central": Outfit + Archivo larga, escolhida pelo Daniel inspirado em central.online). Fonte em `~/Daniel Torres/volo/landings/encontro-secreto/_src/` (a.html, shared.js); editar e rodar `zsh _src/publicar.sh`, depois commit+push no portal. Rota `portal/app/api/encontro-secreto/route.ts`: FUNIL PRÓPRIO 'Encontro Secreto' (slug encontro-secreto, id c9d457d6, criado 24/11): Aguardando Pix → Disse que pagou (botão 'Já paguei' move sozinho) → Pago confirmado (Daniel arrasta após extrato) → Participou | Não pagou. Etapa antiga no Leads Daniel foi apagada. 3 cartões de teste do Daniel (tes/teste/TESTE) em Aguardando Pix. Pixels 523322823980617 + 1687631822321853 + 1842485093107692 (PageView, ViewContent, Lead com CAPI, InitiateCheckout, DissePagou custom; nunca Purchase pq Pix não confirma) + aviso WhatsApp; botão 'Já paguei' marca 'DISSE QUE PAGOU' e avisa. Abertura = lista de dores (paciente não chega, tráfego, WhatsApp sem agendar, botox isolado, follow-up). Antes: Daniel pediu estilo novo "moderno e clean" conversando com a arte. Formulário: nome, WhatsApp, Instagram, já atua na área?, posição, onde atende (clínica própria / aluga sala / clínica de terceiros). Destino: clinicasaltovoo.vercel.app/encontro, cai no Leads Daniel, tela de obrigado com link do grupo do WhatsApp
- Grupo: https://chat.whatsapp.com/GWG78R8RNZT7NXiveTgUrP. FICA GRAVADO (corrigido 24/11), participante recebe gravação + transcrição. Pix: CNPJ 32110356000174; QR usa o "copia e cola" gerado no banco (Harmoclinic Saude e Estet, Contagem, R$ 27, recebido 24/11)

Relacionado: [[project-lp-sprint-30-dias]], [[feedback-visual-sem-cara-ia]].
