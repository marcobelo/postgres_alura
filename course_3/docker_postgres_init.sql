-- Criando e utilizando um schema
-- Schema no postgres serve para organizar/separar grupos de tabelas
CREATE SCHEMA academico;

CREATE TABLE academico.aluno (
    id serial PRIMARY KEY,
    primeiro_nome varchar(255) NOT NULL,
    ultimo_nome varchar(255) NOT NULL,
    data_nascimento date NOT NULL
);

CREATE TABLE academico.categoria (
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL UNIQUE
);

CREATE TABLE academico.curso (
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    categoria_id integer NOT NULL REFERENCES academico.categoria (id)
);

CREATE TABLE academico.aluno_curso (
    aluno_id integer NOT NULL REFERENCES academico.aluno (id),
    curso_id integer NOT NULL REFERENCES academico.curso (id),
    PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO academico.aluno (primeiro_nome, ultimo_nome, data_nascimento)
    VALUES ('Vinicius', 'Dias', '1997-10-15'), ('Patricia', 'Freitas', '1986-10-25'), ('Diogo', 'Oliveira', '1984-08-27'), ('Maria', 'Rosa', '1985-01-01');

INSERT INTO academico.categoria (nome)
    VALUES ('Front-end'), ('Programação'), ('Bancos de dados'), ('Ciencia de Dados');

INSERT INTO academico.curso (nome, categoria_id)
    VALUES ('HTML', 1), ('CSS', 1), ('JS', 1), ('PHP', 2), ('Java', 2), ('C++', 2), ('PostgreSQL', 3), ('MySQL', 3), ('Oracle', 3), ('SQL Server', 3), ('SQLite', 3), ('Pandas', 4), ('Machine Learning', 4), ('Power BI', 4);

INSERT INTO academico.aluno_curso
    VALUES (1, 4), (1, 11), (2, 1), (2, 2), (3, 4), (3, 3), (4, 4), (4, 6), (4, 5);

