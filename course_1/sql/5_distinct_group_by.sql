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
-- DISTINCT remove duplicacoes do resultado
-- Dessa forma com DISTINCT nao e possivel utilizar funcoes de agregacao
-- como o COUNT por exemplo
SELECT DISTINCT nome,
    sobrenome
FROM funcionarios
ORDER BY nome;
-- Para conseguir saber o COUNT e necessario agrupar o resultado com GROUP BY
SELECT nome,
    sobrenome,
    COUNT(*)
FROM funcionarios
GROUP BY nome,
    sobrenome -- Tambem e possivel referenciar pelo index da coluna: 1, 2
ORDER BY nome;
-- Descobrindo quantos alunos estao matriculados em cada curso
SELECT curso.nome,
    COUNT(aluno.id)
FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
GROUP BY curso.nome
ORDER BY curso.nome;