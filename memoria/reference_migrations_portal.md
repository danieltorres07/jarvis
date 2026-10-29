---
name: reference-migrations-portal
description: Migrations do portal Volo rodam na mao no SQL editor do Supabase, nao tem runner nem exec_sql
metadata:
  type: reference
---

As migrations do portal Volo ficam em `~/Daniel Torres/volo/portal/db/migrations/NNN-nome.sql`, numeradas em sequencia. Nao existe runner: nao ha script de migrate no package.json, nao ha psql na maquina, e a RPC `exec_sql` nao existe no banco (404 PGRST202). PostgREST com a service_role so faz DML, nao DDL.

Pra aplicar, o Daniel cola o arquivo no SQL editor do Supabase. Depois da pra conferir se foi com um GET no PostgREST da tabela nova (200 = existe).

**Por que importa:** codigo novo que depende de tabela nova sobe pro ar antes do banco ter a tabela. Entao a action precisa tratar o erro 42P01 e a tela mostrar o recado, em vez de quebrar a pagina inteira ate ele rodar o SQL.

**Como aplicar:** toda migration nova vem junto de um aviso explicito pro Daniel rodar, com o caminho completo do arquivo. Ver [[project-sistema-clinica]].
