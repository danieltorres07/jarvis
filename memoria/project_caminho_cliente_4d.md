---
name: project-caminho-cliente-4d
description: Mapa-mestre da entrega da consultoria 4D e decisão de arquitetura entregaveis-padrao + diagnostico-roteador
metadata: 
  node_type: memory
  type: project
  originSessionId: f4c645ec-5fff-4fb2-84de-7268f4cdf352
---

O caminho de entrega da consultoria (Programa de Aceleração Clínica 4D) está mapeado em
`Daniel Torres/metodo/caminho-do-cliente.md`. É a fonte de verdade da jornada de ENTREGA (não
de venda): 8 paradas em 4 blocos — Diagnóstico 4D, Plano, Kickoff, os 4 D's (Demanda, Diálogo,
Consulta, Devoção), Fechamento. Mesmas paradas pros 3 modelos (Essencial/Completo/Premium); o
gargalo só define onde apertar, não a ordem.

**Decisão de arquitetura (chave):** entregáveis padrão = fonte única (PDF premium, produzidos
uma vez, servem todo cliente com adaptação leve). O `diagnostico-4d.html` deixa de GERAR
entregáveis e vira ROTEADOR: a partir do gargalo, só indica qual entregável usar e como. Os
entregáveis embutidos hoje no diagnóstico (5 réguas em REGUAS_SCRIPTS + "material das 12
objeções") NÃO se apagam ainda: são matéria-prima pros padrões. Refatorar o diagnóstico só
depois que os padrões existirem.

**Próximo trabalho (ainda não feito):** produzir os entregáveis padrão em lotes, na ordem do
caminho (lote 1 entrada, lote 2 Diálogo, lote 3 Consulta, lote 4 Demanda+Devoção). Catálogo
completo com status e matéria-prima está no próprio mapa. Devoção já tem o `banco-mensagens.pdf`
pronto. Ver [[project-aceleracao-4d]].
