---
name: feedback-landing-visual-clean
description: "Visual padrão das landings/funis do Daniel desde 2026-10-14 é o \"noir\" (preto, creme e dourado, Fraunces + DM Sans) da LP v3 do Do WhatsApp à Consulta; substituiu o clean branco"
metadata:
  node_type: memory
  type: feedback
  originSessionId: d63e4217-89d7-4064-8386-db9131401d27
  modified: 2026-10-14T18:17:31.824Z
---

Landing ou página de funil nova do Daniel = visual "noir" da LP oficial `~/Daniel Torres/volo/landings/do-whatsapp-a-cadeira-consulta-v3/index.html` (baseada na LP Viver de Vendas da Thaize Tavares): hero escuro com foto, seções alternando creme #ede2cf e preto #0a0a0a, Fraunces (títulos, destaque dourado em itálico fino) + DM Sans, fontes self-hosted, CTA dourado em degradê com caixa alta, cards creme com borda dourada fina. NÃO usar o neobrutalista do CLAUDE.md nem o clean branco antigo (Instrument Sans + Inter Tight).

**Why:** 2026-10-14 Daniel aprovou a v3 e pediu "replique em todas atuais (playbook, raio-x, diagnostico comercial)". Antes (2026-10-05) o padrão era o clean branco da v1; ele já tinha rejeitado o neobrutalista pra landing. A regra de não pôr eyebrow ainda vale pra LP nova; nas páginas antigas que já tinham selo, mantive o selo só restilizado.

**How to apply:** no portal, ligar `NoirStyles` (`app/(editorial)/_noir-style.tsx`) + classe `pbnoir` no wrapper `.pbclean` (redefine variáveis por contexto claro/escuro, sem mexer em copy). Fontes em `portal/public/fonts/noir/`. Migrados e aprovados em 2026-10-14: Playbook (+obrigado e pop-up), Raio-X (7 telas; formulário legado e telas solicitar/recebido/completo cobertos por uma camada própria no _noir-style.tsx) e Sprint 30 dias (HTML estático: bloco noir no fim do <style>, fontes em /fonts/noir/). Meus links novo pronto em `landings/meus-links-noir/` (Daniel sobe; foto grande no topo estilo Linda, 4 cards em tons diferentes, Sobre mim, Dúvidas comuns). Ao testar local: bloquear fbevents.js e nunca abrir /diagnostico-comercial/completo/[token] sem desligar registrarAbertura (grava abertura do cliente). Animação sempre por JS, ver [[feedback-animacao-js-nao-css]]. Ver [[project-lp-whatsapp-consulta-v3]].
