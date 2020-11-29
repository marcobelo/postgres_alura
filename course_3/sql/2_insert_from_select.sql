CREATE TEMPORARY TABLE cursos_programacao (
    id_curso INTEGER PRIMARY KEY,
    nome_curso VARCHAR(255) NOT NULL
);
INSERT INTO cursos_programacao
SELECT academico.curso.id,
    academico.curso.nome
FROM academico.curso
WHERE categoria_id = 2;
SELECT *
FROM cursos_programacao;
DROP TABLE cursos_programacao;