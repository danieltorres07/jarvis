---
name: project-conciliacao-harmoclinic
description: Como conciliar faturamento da Harmoclinic (Itaú + Rede vs Sistema Clínico) e as exceções que não aparecem no extrato
metadata:
  node_type: memory
  type: project
  originSessionId: becb7afb-1866-4b33-9830-79fa446a3f8c
  modified: 2026-10-07T19:49:26.776Z
---

Conciliação de setembro/2026 feita em 2026-10-07 (extrato Itaú ag 4450 cc 32641-0 + CSV de vendas da Rede vs tabela `lancamentos` do Sistema Clínico, ver [[project-sistema-clinica]]).

- Dashboard/relatório do sistema = soma de `valor_bruto` dos lançamentos `entrada`+`recebido` por `data_pagamento`. Não é caixa nem orçamento fechado.
- Rede: maquininha cai D+1 útil com antecipação automática (~2/3 das taxas); link de pagamento cai em 31 dias, sem antecipação.
- **Existe outra maquininha e outra conta Pix** fora do Itaú/Rede. Venda que não aparece no extrato nem na Rede pode ser legítima (casos confirmados: Iara 2.900, Isabella dos Santos 550, Pix 995 de 08/09).
- Selleta Uniformes = paciente Geraldo Resende Vaz (receita legítima).
- Setembro fechado: real R$ 68.047,90. Faltavam corrigir Bruna 636,48→600, Isabella Mendes 3.501→3.500, Samanta 1.098→1.100 (Daniel ia fazer pelo ✎ do Financeiro).

**Why:** sem saber da 2ª maquininha/conta, toda conciliação vai acusar falso "lançamento sem pagamento".
**How to apply:** antes de chamar lançamento de erro, perguntar se passou na outra maquininha/conta.
