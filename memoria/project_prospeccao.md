---
name: prospeccao
description: "Prospeccao B2B de clinicas HOF via Google Maps -> CRM Volo (Leads Daniel / Prospect). CONSERTADO 26/10/2026, 20 clinicas/dia, Brasil todo com Grande BH por ultimo"
metadata:
  node_type: memory
  type: project
  originSessionId: bc9728fe-8561-4c48-873e-125aaffc694a
  modified: 2026-10-26T21:25:49.647Z
---

Consertado em 26/10/2026 (estava quebrado desde set/2026: env apontava pra pasta apagada e faltava `requests`).

**Como funciona hoje:**
- `~/Daniel Torres/prospeccao/coletar.py` roda com o Python de `.venv/` (requests + playwright), NUNCA o python3 do sistema.
- LaunchAgent `com.danieltorres.prospeccao` às 10h chama `worker-diario.sh`, que roda `coletar.py --lote --limite 20`. Se falhar, notificação no Mac + "ERRO" no `worker.log`.
- Destino: CRM do portal Volo, funil **Leads Daniel** (slug `playbook-atendimento-trafego`), etapa **Prospect**, `canal_origem = prospeccao_google_maps`. WhatsApp no contato, clinica/cidade/uf/instagram/sinal_operacao (nota Google) no cartão, endereço/site/link Maps/wa.me nas observações.
- Só entra quem tem celular. Dedup: `estado.json` (place_ids vistos + data de cada cidade buscada), WhatsApp (últimos 11 dígitos em `contatos`) e @ (cartões do funil).
- Ordem das cidades: `cidades.txt`, Brasil todo; Grande BH (BH, Contagem, Betim) por último, pedido do Daniel. Cidade não repete por 30 dias.
- Teste 26/10: Curitiba, 5 clínicas entraram certinhas.

Funil antigo `leads-prospeccao` foi ARQUIVADO em 26/10 (cartões passaram pro Leads Daniel). Tabelas `prospeccao_leads`/`leads_prospeccao` são mortas.

Relaciona com [[project-projeto-teste-prospeccao]] (robô do Instagram, que também alimenta o Leads Daniel).

**Why:** Daniel quer lista de clínicas com WhatsApp pra mandar a 1ª mensagem na mão, dentro do CRM dele.

**How to apply:** (1) nunca automatizar envio de WhatsApp/DM por aqui, (2) manter delays generosos, (3) não subir o limite de 20/dia sem pedido. A mensagem pronta de WhatsApp da etapa Prospect ainda não existe (só a de Instagram).

**DESLIGADA EM 16/11/2026.** Daniel pediu pra parar: "nao preciso de mais leads por enquanto". O launchd `com.danieltorres.prospeccao` (10:00 todo dia, coletar.py --lote --limite 20) foi descarregado e o plist renomeado pra `~/Library/LaunchAgents/com.danieltorres.prospeccao.plist.desligado`. Ultima coleta que rodou: 15/11/2026. Os leads ja coletados continuam no CRM (Leads Daniel / Prospect) e a regua de follow-up deles continua rodando.

Pra religar: renomear o plist de volta pra `.plist` e rodar `launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.danieltorres.prospeccao.plist`.
