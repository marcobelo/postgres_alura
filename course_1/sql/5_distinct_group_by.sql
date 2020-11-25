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
-- Exemplo usando as tabelas de aluno, aluno_curso e curso
-- Descobrindo quantos alunos estao matriculados em cada curso
SELECT curso.nome,
    COUNT(aluno.id)
FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
GROUP BY curso.nome
ORDER BY curso.nome;