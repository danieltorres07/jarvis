---
name: project-relatorio-ceo
description: "Relatorio diario + semanal do CRM e da clinica, por push no telefone. PEDIDO EM 19/10/2026, AINDA NAO FEITO."
metadata:
  node_type: memory
  type: project
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
  modified: 2026-10-20T02:34:55.673Z
---

Pedido em 2026-10-19, no meio da edicao do reel dos 10 mil. Eu respondi "anotado" e nao voltei. **Nada foi construido ainda.**

**O que ele quer:** um relatorio que chega por PUSH no telefone, no mesmo caminho que ja avisa dos posts agendados e das tarefas diarias.

- **Diario:** resumo do dia.
- **Semanal:** na segunda-feira, o fechamento da semana anterior (ele falou "de segunda a sexta").

**Numeros que ele citou:**
- leads no CRM: quantos novos entraram no dia
- quantos responderam
- quantos agendaram
- quantos fecharam
- pacientes agendados no geral
- quantos foram na consulta
- quantos faltaram
- quantos cancelaram

**Palavras dele:** "pense como um CEO da clinica. Eu quero todas as informacoes necessarias para eu avaliar e melhorar o atendimento, todos os numeros que eu preciso avaliar para aumentar o faturamento e fazer a clinica crescer. Como um CEO de experiencia." Ou seja: nao e painel de numero solto, e leitura pra decidir.

**Ja existe aba de Relatorios no sistema** (ele mencionou), entao o trabalho e o push + a analise, nao a coleta do zero.

**Armadilhas conhecidas antes de comecar:**
- CRM "fechou/perdeu" nao e confiavel: a equipe nao move o cartao. "Quantos fecharam" pode vir zerado. Ver [[feedback-numeros-reais-sistema]].
- 3.443 de 3.645 lancamentos recebidos NAO tem orcamento vinculado, entao nao da pra ligar pagamento a paciente (descoberto em 19/10 tentando achar "quanto recuperei").
- Falta so comeca a valer a partir de ago/2026: antes disso a agenda nao marcava.
- Faturamento pode estar incompleto, ver [[conciliacao-harmoclinic]].

**Onde olhar:** push e cron em `~/Daniel Torres/volo/portal/app/api/cron/`, agentes launchd em `~/Library/LaunchAgents/com.danieltorres.*`. O aviso-slot.sh de `carrosseis/_master/` e o exemplo de push que ja funciona.

Relacionado: [[project-sistema-clinica]], [[project-carrossel-automatico]].
