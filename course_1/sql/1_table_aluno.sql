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