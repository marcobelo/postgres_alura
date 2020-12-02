CREATE SCHEMA teste;

CREATE TABLE teste.cursos_programacao (
    id_curso integer PRIMARY KEY,
    nome_curso varchar(255) NOT NULL
);

INSERT INTO teste.cursos_programacao
SELECT
    academico.curso.id,
    academico.curso.nome
FROM
    academico.curso
WHERE
    categoria_id = 2;

SELECT
    *
FROM
    teste.cursos_programacao;

UPDATE
    academico.curso
SET
    nome = 'PHP Basico'
WHERE
    id = 4;

UPDATE
    academico.curso
SET
    nome = 'Java Basico'
WHERE
    id = 5;

UPDATE
    academico.curso
SET
    nome = 'C++ Basico'
WHERE
    id = 6;

UPDATE
    teste.cursos_programacao
SET
    nome_curso = nome
FROM
    academico.curso
WHERE
    teste.cursos_programacao.id_curso = academico.curso.id;

