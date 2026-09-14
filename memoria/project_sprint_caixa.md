---
name: project-sprint-caixa-30-dias
description: Produto de entrada da consultoria (sprint comercial 30 dias) pra gerar caixa rapido e cases
metadata: 
  node_type: memory
  type: project
  originSessionId: f4c645ec-5fff-4fb2-84de-7268f4cdf352
---

Produto de entrada da consultoria, desenhado em `Daniel Torres/metodo/sprint-caixa-30-dias.md`.
Sprint comercial hands-on de 30 dias: a fatia comercial do 4D (Diálogo + Consulta + recuperação
da Devoção, SEM Demanda) pra colocar no caixa o dinheiro que a clínica já tem parado (base
inativa, orçamento aberto, recall vencido) + apertar agendamento e fechamento.

**Formato:** Daniel cria os entregáveis e treina a equipe, com 1 visita presencial/semana (4 no
total). Clínica executa. Arco de 4 semanas: Baseline+Munição, Recuperação dispara, Fechamento
aperta, Consolida+Case.

**Diagnóstico do sprint:** `Daniel Torres/metodo/diagnostico-sprint.html` (clone do motor do
diagnostico-4d.html). Bloco 1 contexto + baseline (orçamentos parados R$, base inativa, recall
vencido, ticket). Bloco 2 as 3 frentes (Recuperação, Agendamento, Fechamento) verde/amarelo/
vermelho. Gera plano das 4 semanas + estimativa de "caixa parado" (conservadora: 25% orçamentos
+ 6% base × ticket + 20% recall × ticket, % editáveis no topo do JS). Nasce roteador (aponta
entregáveis, não gera conteúdo inline). Daniel ia revisar perguntas e % antes de rodar.

**Pricing da PRIMEIRA cliente (amiga, primeiro case):** R$500 + 15-20% do que aumentar (sobre o
incremento atribuível, não o faturamento todo), com piso ~R$1000. O % é melhor que fixo porque
obriga a medir o resultado = gera o número do case, e é indolor (sai do caixa novo). Vale só se
a clínica tiver base pra recuperar; se for clínica nova, fixo. Essa é a Opção B que vira padrão
pros próximos.

**Entregáveis (formato decidido: OS DOIS):** copiável dentro do `diagnostico-sprint.html` (botão
Copiar por mensagem, seção "Entregáveis prontos pra usar" no plano gerado) + PDF premium gerado
de markdown. Fonte em `Daniel Torres/metodo/entregaveis/*.md`; gerador `entregaveis/pdf.py`
(processa todos os .md, paleta dourada, roda com Chrome headless). Lista de entregáveis foi
refinada pelo Daniel (a lista dele substitui o mapeamento teórico por semanas):
- **Lote 1 PRONTO:** guia-listas, mensagens-reativacao (base que JÁ veio e sumiu), script-whatsapp + objeções.
- **Lote 2 PRONTO:** boas-vindas pós-agendamento (estacionamento/menu/duração), follow-up de novos leads (até agendar), recuperação de leads que NUNCA foram (furou/sumiu antes de ir, ≠ reativação de base).
- **Cuidados pós-procedimento:** JÁ EXISTE pronto em `clinica/banco-mensagens-pos-procedimento/` (4 trilhas), não recriar.
- **Lote 3 A FAZER (fechamento, Daniel mandou incluir):** régua de resgate de orçamento aberto, roteiro de consulta em 5 etapas, cardápio de objeções de fechamento.
- **Lote 4 A FAZER:** orçamento padrão (documento). **Conexão** (paciente de 1º atendimento, 2 msg/mês) PENDENTE: Daniel vai mandar os exemplos dele primeiro, só produzir depois.

**Bug corrigido no diagnostico-sprint.html:** campos de R$ (faturamento, ticket, orc-valor)
agora têm máscara de milhar (data-money + moneyVal/maskMoney). Antes liam "36.000" como 36 e a
estimativa saía 20x menor. Primeira rodada da Brenda (26/05/26) saiu errada por isso (deu R$1.689,
correto ~R$10.680); precisa re-preencher os 3 campos de R$.

**Caso em andamento:** Dra. Brenda Guedes (clínica Combo, 5 anos). Gargalo: Fechamento e
Agendamento travados, Recuperação capenga. Comparecimento marcado 5% (verificar se é erro de
digitação). (2) nome do produto ainda provisório.
Ver [[project-caminho-cliente-4d]] e [[project-aceleracao-4d]].
