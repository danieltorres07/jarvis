---
name: feedback-numeros-reais-sistema
description: "Carrossel com numero da clinica puxa dado real do sistema clinico (Harmoclinic) automaticamente; Daniel corrige na aprovacao, nao precisa perguntar antes"
metadata:
  node_type: memory
  type: feedback
  originSessionId: fced702b-4225-4970-b22e-406b511e90c9
  modified: 2026-10-14T16:54:24.856Z
---

Decidido em 2026-10-14. Todo dado do sistema clinico (portal Volo, mesmo Supabase) e real e atual da Harmoclinic. Carrossel que cita numero da clinica usa esse dado sem perguntar; Daniel da feedback quando for aprovar.

**Why:** Daniel achou mais pratico que mandar numero na mao. Ele mesmo criou a aba Relatorios (agenda + CRM por mes) em 14/10.

**How to apply:** `numeros_reais_clinica()` em `_master/gerar-automatico.py` calcula por mes (falta, comparecimento, primeiras consultas, faturamento recebido, ticket por paciente, leads que entraram por funil), cache diario em `_master/.cache-numeros/`, e entra nos dois prompts com `NUMEROS_REGRAS`. Fora do calculo de proposito:
- antes de ago/2026, porque a agenda ainda nao marcava falta
- CRM fechou/perdeu, porque a equipe nao move o cartao
- status de orcamento, porque a importacao do Clinicorp marcou quase tudo como fechado

So numero agregado, nunca nome ou caso de paciente. Numero real nao autoriza historia em 1a pessoa ("comecei a...") sem o Daniel confirmar. Pra carrossel manual, rodar a mesma funcao. Faturamento pode estar incompleto, ver [[conciliacao-harmoclinic]] (2a maquininha/Pix). Relacionado: [[feedback-cta-rx26-padrao]], [[sistema-clinica]].
