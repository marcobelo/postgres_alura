-- Usando HAVING para selecionar os cursos que nao tem nenhum aluno registrado
SELECT curso.nome,
    COUNT(aluno.id)
FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
GROUP BY curso.nome
HAVING COUNT(aluno.id) = 0;
-- Descobrindo quantos funcionarios possuem nome duplicado
SELECT nome,
    COUNT(id)
FROM funcionarios
GROUP BY nome
HAVING COUNT(id) > 1;
-- Descobrindo quantos funcionarios nao possuem nome duplicado
SELECT nome,
    COUNT(id)
FROM funcionarios
GROUP BY nome
HAVING COUNT(id) = 1;