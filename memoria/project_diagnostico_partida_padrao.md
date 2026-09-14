---
name: diagnostico-partida-padrao
description: "Versão oficial do Diagnóstico de Partida do Daniel. 10 blocos, multi-select em tudo, observação opcional por pergunta, sem classificações. Vive em app/admin/clientes/[id]/diagnostico-partida/ no portal 4d. Instrumento admin que Daniel preenche na call e apresenta pra profissional."
metadata: 
  node_type: memory
  type: project
  originSessionId: d8bc2e71-d600-4b8a-bd1c-34498ec864ed
---

O Diagnóstico de Partida virou padrão oficial nesta versão. Fim das iterações estruturais. Ajustes futuros são no motor (`resultado.ts`) ou na copy de perguntas específicas, mas a arquitetura fica.

**Why:** Daniel iterou 3 versões (menor/escolha única → intermediário/mesclado → esta versão multi+obs). Definiu que essa é a base pra próximas conversas com profissionais iniciantes. Já foi validada com Emanuelle (Manu) e virou instrumento principal da call de partida.

**How to apply:** Antes de mudar qualquer coisa estrutural do form (adicionar/remover blocos, tirar multi-select, tirar observações), voltar aqui e conferir se ainda faz sentido. Iterações menores (copy de opção, tom, regra do motor) podem ir direto.

## Local no código

`~/aceleracao-4d/app/admin/clientes/[id]/diagnostico-partida/`

- `page.tsx` — server component wrapper
- `form.tsx` — form + resultado + modo apresentação + PDFs de impressão
- `resultado.ts` — motor que gera cenário + passos táticos
- API: `~/aceleracao-4d/app/api/diagnostico-partida/[clienteId]/route.ts`
- Persistência: tabela `diagnosticos_partida` no Supabase (schema `cliente_id` PK + `dados_json` jsonb)

## Os 10 blocos fixos

| # | Bloco | Formato |
|---|---|---|
| 01 | Abertura: onde ela tá na carreira em 1 frase | Texto curto |
| 02 | Onde atende hoje | **Multi**: sem espaço / sala alugada / clínica parceira / vai abrir |
| 03 | Tempo de procedimento | **Multi**: comecei agora / até 1 ano / 1 a 3 / mais de 3 |
| 04 | Volume: pacientes/semana + ativos na base | 2 números |
| 05 | Meta 6m: faturamento + frase do sonho | Número + texto curto |
| 06 | Posicionamento: paciente ideal + como cobra hoje | 2 textos curtos |
| 07 | Origem (multi) + Instagram (multi) | 2 blocos multi |
| 08 | Atendimento WhatsApp/consulta/o que trava | Texto livre grande |
| 09 | Dificuldade principal | **Multi**: pouca gente / medo de cobrar / posicionar / fechar orçamento / agenda |
| 10 | Observações finais da call | Texto livre grande |

**Todas as perguntas de escolha são multi-select** (pode marcar mais de uma). Nunca voltar pra radio button.

**Cada pergunta (1 a 9) tem observação opcional** — botão "+ adicionar observação" que abre um textarea pequeno. Estado gravado em `observacoesPergunta: { obs01, obs02, ... }`.

## Regras invioláveis

- **Sem classificações** Iniciante/Intermediário/Avançado. Nunca voltar isso.
- **Sem IA** no motor. Passos e cenário são if/else puro em `resultado.ts`.
- **Cenário** montado por regras que agregam as respostas em 3-5 frases naturais.
- **Passos táticos** dinâmicos (3 a 6 passos, conforme respostas): lugar → posicionamento → Instagram → conteúdo → atendimento padronizado → dificuldade extra.
- **Modo apresentação** (fullscreen slides) e **PDFs de impressão** (diagnóstico + apresentação) fazem parte do padrão. Não remover.
- **Voz do Daniel** — aplicar [[feedback-tom-conversa]] em toda copy nova.
- **Helper `hasOpt(arr, substr)`** em resultado.ts é como o motor lê arrays. Toda comparação nova usa isso.

## Como as respostas viram cenário

`gerarCenario(r)` monta em ordem:
1. Frase de abertura (se ela deu)
2. Onde atua + tempo (agregando multi com "e")
3. Volume (pacientes/semana + ativos)
4. Origem (juntando com "e", exceto "Não sei direito")
5. Meta 6m + sonho (juntos formam a ponte pro futuro)

## Como as respostas viram passos

`gerarPassos(r)` chama 6 helpers em ordem tática. Cada helper decide sozinho se entra ou não. Ordem:
- passoLugar (só entra se "Sem espaço" ou "Vai abrir")
- passoPosicionamento (entra se medo de cobrar / não posiciona / semana<5 / fechar orçamento)
- passoInstagram (entra se não tem / não posta / posta às vezes)
- passoConteudo (entra se ativos≥1 ou semana≥1)
- passoAtendimento (SEMPRE entra)
- passoDificuldadeExtra (agenda ou meta+baixo volume)

## Iterações fora de escopo (podem entrar depois)

- Aprofundar passos usando `pacienteIdeal` + `cobraHoje`
- Versão pública (profissional preenche sozinha antes da call)
- Migrar dado legado da Emanuelle pro novo schema

Combina com [[feedback-tom-conversa]] e [[portal-4d]].
