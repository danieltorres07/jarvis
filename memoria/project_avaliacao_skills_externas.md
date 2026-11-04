---
name: avaliacao-skills-externas
description: Avaliação de repositórios de skills/agentes externos (GitHub) pra ver se cabem no fluxo de marketing do Daniel — critério e veredito de cada um analisado
metadata: 
  node_type: memory
  type: project
  originSessionId: cf5202cd-8940-4c90-8772-2396426e6af1
  modified: 2026-11-04T15:49:21.714Z
---

Daniel manda links de repositórios de skills/agentes de IA pra marketing/vendas achados no GitHub, pra avaliar se valem instalar no projeto. Fluxo: ele manda a URL, uso WebFetch pra ler o repo e dou parecer.

**Critério de avaliação usado:**
- O negócio dele é B2C/B2B pequeno: dono de clínica ou injetora de harmonização facial, funil curto (conteúdo Instagram → DM/WhatsApp → fechamento direto no consultório)
- Não é SaaS, não é venda enterprise com ciclo longo, não é cold outreach corporativo
- Ele já tem agentes calibrados na própria voz (regras de tom, palavras proibidas, handle @danieltorres.b, paleta VOLO) — skill genérica de copy tende a regredir a qualidade, não somar
- Prioridade: manter o projeto enxuto, evitar duplicar fonte de verdade de copy (ver [[feedback_comunicacao]], decisão de apagar agentes/squads não usados)

**Repositórios avaliados até agora:**

| Repo | Foco | Veredito |
|---|---|---|
| github.com/coreyhaines31/marketingskills | 60+ skills de marketing genérico, viés SaaS/growth (CRO, paywall, onboarding, SEO programático) | Não instalar — quase nada aplica ao nicho dele |
| github.com/zubair-trabzada/ai-sales-team-claude | Sistema de prospecção B2B (BANT/MEDDIC, outreach frio, análise firmográfica de empresa) | Não instalar — funil totalmente diferente do dele |
| github.com/mfwarren/entrepreneur-claude-skills | 24 skills genéricas de fundador (marketing, vendas, operações, finanças, liderança) | Não instalar o pacote inteiro, mas é o mais próximo do caso dele. Vale garimpar frameworks pontuais (pricing strategy, SOP builder, objection handling) como referência de raciocínio, sem trazer a geração de texto genérica |
| github.com/hardikpandya/stop-slop | Skill de "anti-slop" — detecta e remove cara de IA no texto, 8 regras + scoring 1-10 em 5 dimensões | Não instalar, sobrepõe com o `humanizer` que já usa obrigatoriamente. Mas tem 4 reforços que faltam no humanizer atual: banir advérbios, evitar sujeito inanimado fazendo ação humana, preferir listas de 2 itens (não 3), voz ativa exclusiva. Daniel ainda vai decidir se quer incorporar isso como checagem extra pós-humanizer |
| github.com/remotion-dev/skills | Skills oficiais do Remotion (framework de vídeo via React/código) — criar projeto, legenda automática, renderização, mapas, upgrade | Não instalar agora, mas é o único dos 5 avaliados com potencial real: automatizaria edição de Reels/Shorts (legenda estilizada automática no padrão VOLO) pros roteiros que os agentes conteudos-flash-daniel/linda já geram e hoje param no texto. Exige setup técnico (montar template em código antes de virar "peça pronta"). Reavaliar quando o Conteúdo Flash tiver mais volume |
| github.com/paullabs/edit-labs-ai | Plugin Claude Code de edição de vídeo: podcast longo → cortes verticais (corte, rosto rastreado, motion, B-roll via Higgsfield, legenda queimada) | INSTALADO 2026-10-16 a pedido do Daniel (plugin user scope, venvs em ~/.local/share/edit-labs-ai/, python@3.12 via brew). Sobrepõe em parte com a skill propria editor-videos-daniel ([[project_editor_videos]]); motion dele tem identidade propria, nao a noir |
| github.com/ohmyjahh/efeitos-claude | Skill /efeito (Rafa Grandi, MIT, Remotion): 17 templates fixos de Reel (palavra gigante atrás da cabeça, comment-box, split-headline, spotlight...), recorte da pessoa via Vision do macOS (tools/personmask.swift) | Avaliado 2026-11-03: não instalar como está (roxo/magenta, texto em inglês, meta-conteúdo "Claude edita meu reel", animação não nasce da fala, efeitos de prova social dependem de views/capas do criador). Código limpo, sem rede. Vale portar pro editor-videos-daniel: o personmask (texto ATRÁS da pessoa) e 3-4 layouts redesenhados no noir (palavra atrás, comment-box digitando CRM26, split-headline, spotlight) |
| orquestra.zip (baixado 2026-11-04, MIT, sem autor) | 5 skills curtas em markdown: maestro (setup+plano), tráfego, conteúdo, propostas, documentos. Genérico pra "negócio de serviços" | Avaliado 2026-11-04: não instalar. Seguro (sem rede, script só apaga os próprios arquivos de setup). Tudo já existe mais calibrado (copywriter+humanizer, gestor-de-trafego-pago, estruturador/copywriter-de-vendas, CLAUDE.md faz o papel do maestro). Único naipe sem equivalente: documentos (contrato com [PREENCHER] + aviso "não substitui advogado") |
| Alavanca.zip (Maestros da IA/Circle, 2026-11-04) | Conhecimento → produto digital (6 modos + calculadora de preço Python offline) | Não instalar. Limpo; duplica arquiteto-de-micro-produtos e ai-expert-conhecimento. SETUP.md manda `rm -rf "$(dirname "$0")"` (instrução mal feita) |
| Forja.zip (Maestros da IA, 2026-11-04) | Profissão + IA → oferta de serviço de IA (preço 3 faixas, one-pager HTML, plano 30 dias) | Não instalar. Limpo, Python offline; feito pra quem começa a vender serviço de IA, Daniel já passou dessa fase |
| Cadinho.zip (Maestros da IA, 2026-11-04) | Validador de ideia (lojas de app, autocompletar Google, OSM, Wikipedia) → prosseguir/pivotar/matar | Não instalar fixo. Limpo, sem chave; scraping Google zona cinzenta; .claude/CLAUDE.md próprio conflita (proíbe Google Fonts). Aproveitável: collect_keywords.py --alfabeto pra pauta/ideia de produto, rodado em pasta isolada |
| cinematic-3d-site-builder.zip (2026-11-04) | Site 1 página com 3D (Three.js) ou frames de vídeo Seedance via fal.ai | Não instalar. Limpo mas: claude.md manda executar sem pedir permissão (gasta US$10-30/site), link de afiliado Higgsfield, CTA href="#", pesado no celular, temas de vitrine de produto |

**Padrão de resposta:** nunca recomendar instalar pacote genérico completo. Se algo tiver valor, é como framework/referência isolada, não como substituto dos agentes já calibrados na voz dele.
