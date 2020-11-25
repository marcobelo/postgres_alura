-- creating tables, and populating
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
-- Selecionando aluno e curso (INNER JOIN = JOIN)
SELECT aluno.nome AS aluno,
    curso.nome AS curso
FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON aluno_curso.curso_id = curso.id;
-- Selecionando todos alunos independente de ter curso cadastrado, e os cursos
SELECT aluno.nome AS aluno,
    curso.nome AS curso
FROM aluno
    LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    LEFT JOIN curso ON aluno_curso.curso_id = curso.id;
-- Selecionando todos cursos independente de ter aluno cadastrado, e os alunos 
SELECT aluno.nome AS aluno,
    curso.nome AS curso
FROM aluno
    RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    RIGHT JOIN curso ON aluno_curso.curso_id = curso.id;
-- Selecionando todos alunos e cursos, mesmo que aluno nao tenha curso e curso nao tenha aluno
SELECT aluno.nome AS aluno,
    curso.nome AS curso
FROM aluno
    FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    FULL JOIN curso ON aluno_curso.curso_id = curso.id;
-- Cross join: para cada linha na tabela aluno ele vai preencher com todas linhas de cursos
SELECT aluno.nome AS aluno,
    curso.nome AS curso
FROM aluno
    CROSS JOIN curso;
-- clean database after this part
DROP TABLE aluno_curso;
DROP TABLE aluno;
DROP TABLE curso;