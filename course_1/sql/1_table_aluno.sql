-- Selecionando apenas os campos desejados da tabela aluno
SELECT
    nome AS "Nome do Aluno",
    idade,
    matriculado_em AS quando_se_matriculou
FROM
    aluno_completo;

-- Atualizando dados do aluno criado
UPDATE
    aluno_completo
SET
    nome = 'Mulder',
    cpf = '12312332112',
    observacao = 'nova obs',
    idade = 51,
    dinheiro = 5322345.23,
    altura = 1.70,
    ativo = FALSE,
    data_nascimento = '1980-12-12',
    hora_aula = '18:30:00',
    matriculado_em = '2010-07-18 10:35:02'
WHERE
    id = 1;

-- Removendo o aluno
DELETE FROM aluno_completo
WHERE nome = 'Deleteme';

-- Operador IS e IS NOT:
-- Vai trazer todos alunos que nao possuem o cpf preenchido
SELECT
    *
FROM
    aluno_completo
WHERE
    cpf IS NULL;

-- Vai trazer todos alunos que possuem o cpf preenchido
SELECT
    *
FROM
    aluno_completo
WHERE
    cpf IS NOT NULL;

-- Selecionando alunos com idade entre 20 e 35 anos *(ele e inclusivo, traz tmb 20 e 35)
SELECT
    *
FROM
    aluno_completo
WHERE
    idade BETWEEN 20 AND 35;

-- Combinando filtros com AND
SELECT
    *
FROM
    aluno_completo
WHERE
    nome LIKE 'D%'
    AND cpf IS NOT NULL;

-- Combinando filtros com OR
SELECT
    *
FROM
    aluno_completo
WHERE
    nome LIKE 'Di_go' -- Lembrando que esse _ significa qualquer caracter naquela posicao
    OR nome LIKE 'Mulder'
    OR nome LIKE 'Rodrigo';

