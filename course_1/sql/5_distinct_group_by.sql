-- DISTINCT remove duplicacoes do resultado
-- Dessa forma com DISTINCT nao e possivel utilizar funcoes de agregacao
-- como o COUNT por exemplo
SELECT DISTINCT
    nome,
    sobrenome
FROM
    funcionarios
ORDER BY
    nome;

-- Para conseguir saber o COUNT e necessario agrupar o resultado com GROUP BY
SELECT
    nome,
    sobrenome,
    COUNT(*)
FROM
    funcionarios
GROUP BY
    nome,
    sobrenome -- Tambem e possivel referenciar pelo index da coluna: 1, 2
ORDER BY
    nome;

-- Descobrindo quantos alunos estao matriculados em cada curso
SELECT
    curso.nome,
    COUNT(aluno.id)
FROM
    aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
GROUP BY
    curso.nome
ORDER BY
    curso.nome;

