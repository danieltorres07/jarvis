---
name: arquitetura-praxis
description: "Template mestre canônico das Praxis do Programa Principium. Toda Praxis II, III, IV deve ser criada a partir do _template-praxis duplicando a pasta."
metadata: 
  node_type: memory
  type: reference
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
---

Template mestre vivo das Praxis do Programa Principium.

## Localização

`~/Daniel Torres/programa-aceleracao-4d/_template-praxis/`

Conteúdo da pasta:
- `gerar.py` — renderizador (NÃO editar por Praxis)
- `conteudo.py` — única coisa a editar por Praxis nova (toda configuração)
- `_css.py` — identidade visual mestre extraída (NÃO editar por Praxis)
- `volo-claro.svg`, `volo-escuro.svg` — logos VOLO
- `README.md` — instruções de uso

Praxis I de referência (template canônico de onde foi extraído): `~/Daniel Torres/programa-aceleracao-4d/guia-atendimento/`

## Estrutura fixa (ordem das páginas)

1. **Capa** (sempre) — fundo preto, foto Daniel à direita com gradiente, logo VOLO, selo "PROGRAMA PRINCIPIUM" + "IMPLEMENTAÇÃO", título "Praxis X" + nome do tema, rodapé "VOLO · PROGRAMA PRINCIPIUM"
2. **Como utilizar esta Praxis** (sempre) — 4 cards (Objetivo · Responsável · Quando · Tempo "1 dia") + bloco preto "Resultado esperado"
3. **Apresentação** (sempre) — parágrafos contextualizando o tema, sempre reforçando "scripts/recomendações como referência, não roteiro fixo"
4. **Fluxo** (opcional · `FLUXO["ativo"]`) — snake BPMN 3×3 com 9 etapas, card 06 destacado (decisão), card 09 em preto (fechamento)
5. **Capítulos** (lista em `CAPITULOS`) — cada capítulo tem tag CAPS + título "Como X" + subtítulo + blocos. 5 tipos de bloco: `texto`, `lista`, `cards`, `destaque`, `exemplo`
6. **Regra de Ouro própria** (opcional · `REGRA_DE_OURO_PROPRIA["ativo"]`) — quando há regra TÃO importante que merece página própria
7. **Erros comuns** (opcional · `ERROS_COMUNS["ativo"]`) — até 7 erros em cards numerados
8. **Objetivo da Praxis** (sempre) — 3 sentidos finais em cards pretos + caixa dourada de fechamento + parágrafo + rodapé com identidade

## Padronização de títulos (3 níveis em toda página interna)

```
PRAXIS X       (tag fixa dourada no topo · automática)
CAPÍTULO       (page-tag em caps · ex: "RESULTADOS")
Como [verbo + tema]  (secao-tit · h2)
[Subtítulo curto]    (secao-sub · 1 frase)
```

Exemplo:
- PRAXIS I → RESULTADOS → Como apresentar resultados → Transformando confiança em agendamento.

## Identidade visual

- **Paleta**: dourado `#a88312` / claro `#c8b066` / escuro `#7a5f0d` / preto suave `#0a0a0a` / cinza bg `#faf9f5`
- **Fontes**: Inter + Plus Jakarta Sans
- **Tag "PRAXIS X"** dourada no topo de TODA página interna (parametrizada via `NUMERO_PRAXIS`)
- **Logo VOLO** discreto no rodapé esquerdo das internas (opacity 0.5) · `@danieltorres.b` no rodapé direito
- **Nomenclatura oficial**: "Programa Principium · Praxis X — [Tema]"
- **Nunca** usar: "4D", "Programa de Aceleração", "Daniel Torres" como tag de rodapé. "Daniel Torres" só pode aparecer como autor implícito via handle.

## Como criar Praxis nova

```bash
cd ~/Daniel\ Torres/programa-aceleracao-4d
cp -r _template-praxis praxis-ii-[tema-kebab]
cd praxis-ii-[tema-kebab]
# editar SOMENTE conteudo.py
python3 gerar.py --pdf
```

O `conteudo.py` controla tudo: nomenclatura, capa, "Como utilizar", apresentação, fluxo (com toggle), capítulos (lista de blocos), regra de ouro própria (toggle), erros comuns (toggle), objetivo final.

## Diretrizes obrigatórias antes de finalizar

- continua **prática**, parecendo manual operacional
- pode ser aplicada **imediatamente**
- **não virou e-book** (ritmo curto, denso)
- **não ficou maior desnecessariamente** (Praxis I tem 19 páginas como referência de tamanho)
- parece **parte de um sistema operacional completo**, não material isolado

**Why:** Daniel pediu explicitamente que cada Praxis "nasça igual". Sem template mestre, cada documento vira algo diferente — perde a coerência do Programa Principium como sistema. Praxis II/III/IV precisam parecer parte do mesmo sistema operacional pra clínica, não materiais soltos.

**How to apply:** Antes de criar qualquer Praxis nova, duplicar `_template-praxis/` e editar SOMENTE `conteudo.py`. Não tocar em `gerar.py`, `_css.py` ou logos. Se a identidade visual mestre precisar evoluir, mudar em `_template-praxis/_css.py` e replicar para Praxis existentes (em vez de divergir cada uma). [[caminho-cliente-4d]] orienta para qual fase do método cada Praxis serve.
