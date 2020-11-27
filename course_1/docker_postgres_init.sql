CREATE TABLE IF NOT EXISTS aluno_completo (
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
INSERT INTO aluno_completo (
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
    ),
    (
        'Diogo',
        '12345678901',
        'Lorem Ipsum is simply dummy text of the printing...',
        30,
        18023.50,
        1.72,
        TRUE,
        '1990-06-04',
        '08:30:00',
        '2020-07-18 14:35:02'
    ),
    (
        'Diego',
        '12345678901',
        'Lorem Ipsum is simply dummy text of the printing...',
        30,
        18023.50,
        1.72,
        TRUE,
        '1990-06-04',
        '08:30:00',
        '2020-07-18 14:35:02'
    ),
    (
        'Rodrigo',
        '12345678901',
        'Lorem Ipsum is simply dummy text of the printing...',
        30,
        18023.50,
        1.72,
        TRUE,
        '1990-06-04',
        '08:30:00',
        '2020-07-18 14:35:02'
    ),
    (
        'Deleteme',
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
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255)
);
INSERT INTO aluno (id, nome)
VALUES (1, 'Marco');
INSERT INTO aluno (id, nome)
VALUES (2, 'Julia');
INSERT INTO aluno (id, nome)
VALUES (3, 'Bruna');
CREATE TABLE curso (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);
INSERT INTO curso (id, nome)
VALUES (1, 'HTML');
INSERT INTO curso (id, nome)
VALUES (2, 'Javascript');
INSERT INTO curso (id, nome)
VALUES (3, 'CSS');
CREATE TABLE aluno_curso(
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),
    FOREIGN KEY (aluno_id) REFERENCES aluno (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES curso (id)
);
INSERT INTO aluno_curso (aluno_id, curso_id)
VALUES (1, 1);
INSERT INTO aluno_curso (aluno_id, curso_id)
VALUES (1, 2);
INSERT INTO aluno_curso (aluno_id, curso_id)
VALUES (2, 1);
CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);
INSERT INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M002', 'Vinicius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M004', 'Joao', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M006', 'Alberto', 'Martins');
INSERT INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M007', 'Diogo', 'Oliveira');