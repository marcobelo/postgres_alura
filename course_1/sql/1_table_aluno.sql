-- Criando tabela aluno, explorando principais tipos de fields:
CREATE TABLE IF NOT EXISTS aluno (
    id SERIAL,
    nome VARCHAR(255),
    cpf CHAR(11),
    observacao TEXT,
    idade INTEGER,
    dinheiro NUMERIC(10, 2),
    altura REAL,
    ativo BOOLEAN,
    data_nascimento DATE,
    hora_aula TIME,
    matriculado_em TIMESTAMP
);
-- Inserindo um novo aluno
INSERT INTO aluno (
        nome,
        cpf,
        observacao,
        idade,
        dinheiro,
        altura,
        ativo,
        data_nascimento,
        hora_aula,
        matriculado_em
    )
VALUES (
        'Marco',
        '12345678901',
        'Lorem Ipsum is simply dummy text of the printing...',
        30,
        18023.50,
        1.72,
        TRUE,
        '1990-06-04',
        '08:30:00',
        '2020-07-18 14:35:02'
    );
-- Selecionando apenas os campos desejados da tabela aluno
SELECT nome AS "Nome do Aluno",
    idade,
    matriculado_em AS quando_se_matriculou
FROM aluno;
-- Atualizando dados do aluno criado
UPDATE aluno
SET nome = 'Mulder',
    cpf = '12312332112',
    observacao = 'nova obs',
    idade = 51,
    dinheiro = 5322345.23,
    altura = 1.70,
    ativo = FALSE,
    data_nascimento = '1980-12-12',
    hora_aula = '18:30:00',
    matriculado_em = '2010-07-18 10:35:02'
WHERE id = 1;
-- Removendo o aluno
DELETE FROM aluno
WHERE nome = 'Mulder';
-- Operador IS e IS NOT:
-- Vai trazer todos alunos que nao possuem o cpf preenchido
SELECT *
FROM aluno
WHERE cpf IS NULL;
-- Vai trazer todos alunos que possuem o cpf preenchido
SELECT *
FROM aluno
WHERE cpf IS NOT NULL;
-- Selecionando alunos com idade entre 20 e 35 anos *(ele e inclusivo, traz tmb 20 e 35)
SELECT *
FROM aluno
WHERE idade BETWEEN 20 AND 35;
-- Combinando filtros com AND
SELECT *
FROM aluno
WHERE nome LIKE 'D%'
    AND cpf IS NOT NULL;
-- Combinando filtros com OR
SELECT *
FROM aluno
WHERE nome LIKE 'Di_go' -- Lembrando que esse _ significa qualquer caracter naquela posicao
    OR nome LIKE 'Marco'
    OR nome LIKE 'Rodrigo';
-- Clean database
DROP TABLE aluno;