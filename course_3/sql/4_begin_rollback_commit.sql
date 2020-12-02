-- Comeca uma transacao
BEGIN;
DELETE FROM teste.curso_programacao;
-- Desfaz tudo que foi feito
ROLLBACK;

-- Comeca outra transacao
BEGIN;
DELETE FROM teste.curso_programacao;
-- Confirma as alteracoes, dados foram deletados
COMMIT;

