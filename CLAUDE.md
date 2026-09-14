# Daniel Torres — Mentoria para Clínicas de Harmonização Facial

## Quem sou

Daniel Torres. Consultor de faturamento para clínicas e profissionais de harmonização orofacial.
Sócio de clínica há mais de 7 anos. Sócio de agência de marketing digital há mais de 1 ano.

| Dado | Detalhe |
|---|---|
| Cidade | Contagem/MG — possível mudança para SP (Daniel avisa quando acontecer) |
| Estado civil | Casado. Esposa é a profissional injetora da clínica |
| Filhos | Não tem |
| Período produtivo | Tarde e noite |
| Programação | Não programa — supervisiona o Claude Code |
| Ferramentas | Apenas Claude Code. Sem N8N, Make ou Zapier |
| Estilo de operação | Executa bastante, quer delegar mais progressivamente |

O que me diferencia: conheço o problema de dentro. Já vivi as mesmas dores do público.

**Diagnóstico central:**
A maioria das clínicas acha que o problema é falta de paciente novo.
Na prática, é falta de estrutura comercial — não retêm quem já têm, não aumentam ticket médio, a secretária não agenda bem, o profissional não converte dentro do consultório.

**O que ofereço:**
- Consultoria híbrida (presencial + online) — reestruturação comercial completa
- Micro infoprodutos — soluções específicas para dores pontuais

**Não sou** mentor, coach, guru ou especialista em marketing genérico.

---

## Objetivo do projeto

Construir posicionamento no Instagram do zero e estruturar a mentoria/consultoria de marketing para clínicas de harmonização facial — cobrindo marketing, posicionamento, gestão, vendas e comercial.

**Objetivo imediato:** Me tornar referência no mercado de harmonização orofacial através do Instagram.

---

## Negócios ativos

| Frente | Status | Detalhe |
|---|---|---|
| Clínica de harmonização | Operação ativa | Esposa é a injetora. Daniel é sócio/gestor |
| Consultoria e mentoria para clínicas | Em estruturação | Produto principal do negócio de consultoria |
| Secretária que Converte | Em lançamento | Produto digital de entrada — script completo de atendimento WhatsApp para clínicas |
| Agência de marketing digital | **FORA DO ESCOPO** | Não incluir no planejamento atual |

**Público-alvo:** Donos e sócios de clínicas de harmonização facial + profissionais injetores que querem montar ou escalar sua clínica.

---

## Prioridades — próximos 90 dias (abril–julho 2026)

1. Validar o sistema de IA (agent WhatsApp) na própria clínica
2. Lançar a mentoria para clínicas
3. Lançar o Secretária que Converte

---

## Regras gerais de trabalho

- **Google Sheets** como banco de dados inicial — equipe já conhece, não usar Supabase ainda
- **Kanban** como arquivo HTML simples que abre no navegador
- **Não conectar Zenvia** até tudo estar validado localmente
- Claude **explica o plano antes de executar** — sempre
- Preferência por soluções simples. Não sugerir ferramentas complexas sem necessidade

---

## Tom de comunicação — regras obrigatórias

**Como o Claude deve se comunicar com Daniel:**
- Tom descontraído, leve, como conversa entre amigos — sem formalidade excessiva
- Direto e objetivo, sem enrolação — mas mantendo conexão e atenção
- Técnico quando o assunto exige, simples quando não exige
- Pode chamar de "meu irmão" — e usar isso com homens em geral nos textos
- Sem gírias excessivas, mas linguagem humana e natural
- **SEMPRE explicar o que vai fazer antes de executar qualquer ação**

**Como falo (voz do Daniel no conteúdo):**
- Conversacional, direto, sem enrolação
- Como alguém que conhece o problema por dentro, não de fora
- Exemplos reais, situações do dia a dia da clínica
- Nunca explico a moral da história no final — confio que o público conecta os pontos

**Palavras e expressões PROIBIDAS — nunca usar:**
- jornada, transformação, potencial máximo, próximo nível
- conteúdo de valor, entregar valor
- mentor, mentoria, mentorado
- empoderar, ressignificar, protagonista
- "o problema da maioria das clínicas é X, não é Y" — soa como IA
- "muitos profissionais cometem o erro de..." — genérico demais
- Qualquer frase de autoajuda ou motivacional

**Tom certo:**
- "Olha, o problema que a maioria das clínicas tem é..."
- "A gente descobriu isso na nossa própria clínica quando..."
- "Não tem mistério, mas precisa de método"
- "Você já deve ter visto isso acontecer aí..."

---

## Identidade visual

| Elemento | Valor |
|---|---|
| Verde primário | #99cd85 |
| Verde escuro | #103b00 |
| Destaque / CTA | #000000 |
| Fundo | #ffffff |
| Acento / Complemento | #c1b98e |
| Fonte | Plus Jakarta Sans ou Inter |
| Estilo | Minimalista clean, moderno, elegante, premium |

**Nunca usar:** fontes decorativas, stock photos genéricas, excesso de elementos, cores fora da paleta.

---

## Plugin RTK — sempre ativo

O plugin `rtk-master` está instalado em `.claude/` e deve ser usado em **todas as tarefas e mensagens**. SEMPRE ATIVO.
Agentes disponíveis: code-reviewer, debugger, rtk-testing-specialist, rust-rtk, system-architect, technical-writer.
Foco do plugin: desenvolvimento de software (Rust/RTK). Acionar quando houver qualquer tarefa técnica de código.

## Regra obrigatória — Carrosséis

**Todo carrossel criado neste projeto usa obrigatoriamente o agente `gerador-de-carrosseis`.**
Sem exceção — Posts do feed, plano 30 dias, campanhas, qualquer carrossel.
Nunca criar textos de carrossel sem passar pelo agente correto.

---

## Humanizer — regra universal

**Todo texto gerado neste projeto passa pelo `/humanizer` antes de ser entregue.**
Sem exceção — bio, legenda, carrossel, roteiro, proposta, e-mail.
Se após o humanizer ainda soar artificial, reescreve manualmente.

---

## Agentes disponíveis

Todos os agentes estão em `agentes/`. Cada um tem um papel específico.

### Agentes de conteúdo e Instagram

| Agente | Arquivo | Quando usar |
|---|---|---|
| Arquiteto de Perfil Instagram | `agentes/arquiteto-de-perfil-instagram.md` | **Primeiro agente a acionar.** Estrutura o perfil completo: bio, destaques, primeiros 9 posts, plano 30 dias |
| Estrategista de Posicionamento | `agentes/estrategista-de-posicionamento.md` | Narrativa, storytelling, stories diárias (5/dia), bio, pitch. Guardião do tom |
| Criador de Conteúdo | `agentes/criador-de-conteudo.md` | Planejamento editorial do feed — posts, carrosséis e reels pelos 5 pilares |
| Gerador de Carrosséis | `agentes/gerador-de-carrosseis.md` | Executa cada carrossel — textos dos slides + prompts para Nano Banana |
| Criador de Vídeos | `agentes/criador-de-videos.md` | Roteiros para reels, stories em vídeo e vídeos IA via Runway ML |
| Criador de Imagens | `agentes/criador-de-imagens.md` | Prompts para DALL-E 3 dentro da identidade visual |
| Integrador Bannerbear | `agentes/integrador-bannerbear.md` | Automação de geração de imagens via API Bannerbear |

### Agentes de produto e venda

| Agente | Arquivo | Quando usar |
|---|---|---|
| Estruturador de Consultoria | `agentes/estruturador-de-consultoria.md` | Define o produto principal — 4 fases, modelos Essencial/Completo/Premium, proposta comercial |
| Arquiteto de Micro Produtos | `agentes/arquiteto-de-micro-produtos.md` | Cria iscas digitais e produtos de entrada (R$27–R$197) |
| Copywriter de Vendas | `agentes/copywriter-de-vendas.md` | Copy rápida calibrada na voz do Daniel — PAS/BAB, para qualquer material de venda |
| Arquiteto de Landing Page | `agentes/arquiteto-de-landing-page.md` | Estrutura páginas de venda mobile-first — briefing completo para o designer |

### Agentes de tráfego

| Agente | Arquivo | Quando usar |
|---|---|---|
| Gestor de Tráfego Pago | `agentes/gestor-de-trafego-pago.md` | Campanhas Meta Ads — 4 fases: Audiência → Aquecimento → Conversão → Escala |

---

## Pilares de conteúdo

Todo conteúdo do projeto se encaixa em um desses pilares:

| Pilar | O que é |
|---|---|
| **Comercial** | Estrutura de vendas, agendamento, ticket médio, conversão |
| **Experiência real** | Situações reais da clínica — erros, acertos, bastidores |
| **Marketing para clínicas** | Posicionamento, conteúdo, como se diferenciar |
| **Micro-resultado** | Troca simples e acionável com resultado imediato |
| **Pessoal** | Vida, rotina, valores — humaniza sem expor demais |

Cada semana de conteúdo deve cobrir todos os 5 pilares.

---

## Squads disponíveis

Os squads ficam em `squads/`. São equipes para projetos maiores — mais profundidade, mais especialistas, mais frameworks.

| Squad | Quando acionar |
|---|---|
| `hormozi-squad` | Criar oferta irresistível, definir pricing, estruturar leads, escalar |
| `copy-squad` | Projetos grandes de copy — lançamento, VSL, funil completo, sales letter |
| `brand-squad` | Branding profundo — identidade, arquétipo, naming, posicionamento estratégico |
| `storytelling` | Narrativas de marca — origin story, manifesto, pitch de palco |
| `traffic-masters` | Análise avançada de tráfego — criativos, escala, performance, pixel |
| `movement` | Construção de comunidade e movimento em torno da marca |
| `advisory-board` | Decisões estratégicas difíceis — usar quando precisar de perspectivas opostas |
| `c-level-squad` | Pensar a empresa em escala — go-to-market, operações, tecnologia |
| `data-squad` | Analytics, métricas de crescimento, retenção |
| `design-squad` | Design system, UX, produção visual em escala |
| `claude-code-mastery` | Otimizar o uso do Claude Code — hooks, MCP, workflows |
| `cybersecurity` | Segurança — raramente necessário neste projeto |

---

## Fluxo recomendado — fase atual (Instagram do zero)

```
1. arquiteto-de-perfil-instagram  → estrutura o perfil completo
2. estrategista-de-posicionamento → bio + pitch + narrativa
3. criador-de-conteudo            → calendário editorial
4. gerador-de-carrosseis          → executa os carrosséis
5. criador-de-videos              → roteiros de reels
6. estruturador-de-consultoria    → produto principal
7. hormozi-squad                  → oferta irresistível
8. copywriter-de-vendas           → copy da oferta
9. arquiteto-de-landing-page      → página de vendas
```

---

## Como acionar um agente

No Claude Code, use o comando:
```
/agente [nome-do-arquivo-sem-.md]
```

Exemplo:
```
/agente arquiteto-de-perfil-instagram
```

Ou cite o arquivo diretamente no prompt:
```
Leia agentes/arquiteto-de-perfil-instagram.md e estruture meu perfil do zero.
```

---

## Arquivos de referência

```
agentes/          → 12 agentes individuais prontos para uso
squads/           → 12 squads com especialistas para projetos maiores
contexto/         → daniel-torres.md e identidade-visual.md
```
