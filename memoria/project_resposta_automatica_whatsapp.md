---
name: project-resposta-automatica-whatsapp
description: Primeira resposta automatica no WhatsApp da Harmo (8054), construida 30/10/2026, sobe desligada; modos desligado/teste/sombra/ligado
metadata:
  type: project
---

30/10/2026 (commit 29914c6 no portal): numero novo que chama o 31 97132-8054 (Meta Cloud API em coexistencia, Vic usa o app no celular) ganha contato + cartao no Novos Leads; espera 3 min; se a equipe nao respondeu pelo celular (eco smb_message_echoes, Daniel ligou o campo na Meta em 30/10), a IA (METODO + ficha do Assistente IA) responde 1 mensagem ou passa pra equipe. Anuncio detectado pelo `referral` da Meta (cartao vira trafego-pago).

Codigo: lib/whatsapp/resposta-automatica.ts, webhook app/api/webhooks/whatsapp/route.ts, tela Configuracoes > Resposta automatica. Tabela wa_respostas_auto (migration 113, Daniel cola no Supabase).

**Why:** Daniel quer responder lead novo na hora, com resposta diferente por origem (anuncio/organico) e por pedido (valor/informacao/agendar).
**How to apply:** plano combinado: preencher ficha (estava vazia em 30/10) > teste com celular que nao seja o do Daniel (o dele vai pro Jarvis) > ~1 semana em sombra comparando com o que a Vic mandou > ligado. Audio na 1a mensagem ainda nao e transcrito. Ver [[project-followup-whatsapp]], [[project-sistema-clinica]].

Ajuste 30/10 (aa6efa6): busca de contato tolera mascara no telefone (63 de 2.843 contatos tinham traco/parenteses); cartao so e criado DEPOIS da IA ler, e nao e criado se intencao = ja_e_paciente ou nao_e_paciente. Nao duplica: 1 linha por numero (wa_numero unico) e cartao existente no Novos Leads e reaproveitado.

Ajuste 30/10 (732bb26): 1o teste real funcionou (enviada sozinha 19:36). Agora responde tambem paciente do cadastro que nao conversa ha 3 dias (depois trocado pra 12 HORAS, HORAS_SEM_CONVERSA; sem cartao novo, anota no existente); remarcar/cancelar/duvida de pagamento vao pra equipe; espera ajustavel em config wa_auto_espera_min (0 a 10, padrao 3); Daniel pediu 1 pergunta so na primeira resposta (regra no prompt).
Historico: IA le 7 dias de conversa e so se apresenta se a clinica nunca falou (Daniel pediu 'sequencia humana' 30/10).
Regra Daniel 30/10: 1a mensagem que cita procedimento SEMPRE pergunta 'primeira vez ou ja fez antes?' (unica pergunta).
Regra Daniel 30/10: falar de ROSTO, nunca focar na regiao citada (testa, mandibula...): 'plano certo pro seu rosto'.
Agenda 30/10 (commit seguinte a b622024): IA ve horarios livres reais so da Dra. Linda (consulta 30 min, seg-sex 8-19, sab 8-12, pula feriado nacional), oferece 2; NAO marca, anota 'CONFIRMAR NA AGENDA' no cartao pra Vic marcar e cobrar sinal (consulta R$200, sinal 50%, abate).
Conducao 30/10: IA segue a conversa que ELA abriu ate a Vic entrar (eco), ate passar pra equipe (manda 1 frase de acolhimento) ou CONFIRMAR NA AGENDA; so volta apos 12h de silencio. Teste agora segue as mesmas regras (pra re-testar do zero, apagar mensagens do dia do numero de teste).
