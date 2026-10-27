---
name: project_operacao_cliente_oculto
description: "Operacao de venda do Atende & Vende Implantado via cliente oculto + metodo Chris Voss, toda dentro do Leads Daniel no CRM Volo; blocos A-D, estado em 26/10/2026"
metadata:
  node_type: memory
  type: project
  originSessionId: bc9728fe-8561-4c48-873e-125aaffc694a
  modified: 2026-10-26T22:34:04.928Z
---

Decidido 26/10/2026. Oferta: Atende & Vende Implantado (implanta o comercial da clínica em 30 dias, decidido 26/10; antes era 7), 3 primeiras R$ 997 (troca por depoimento), 4ª a 10ª R$ 1.997, garantia de mais consulta agendada em 30 dias. Meta 10 clínicas em 90 dias, Daniel com 3h/dia.

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
