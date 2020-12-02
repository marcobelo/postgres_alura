-- Selecionando aluno e curso (INNER JOIN = JOIN)
SELECT
    aluno.nome AS aluno,
    curso.nome AS curso
FROM
    aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON aluno_curso.curso_id = curso.id;

-- Selecionando todos alunos independente de ter curso cadastrado, e os cursos
SELECT
    aluno.nome AS aluno,
    curso.nome AS curso
FROM
    aluno
    LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    LEFT JOIN curso ON aluno_curso.curso_id = curso.id;

-- Selecionando todos cursos independente de ter aluno cadastrado, e os alunos
SELECT
    aluno.nome AS aluno,
    curso.nome AS curso
FROM
    aluno
    RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    RIGHT JOIN curso ON aluno_curso.curso_id = curso.id;

-- Selecionando todos alunos e cursos, mesmo que aluno nao tenha curso e curso nao tenha aluno
SELECT
    aluno.nome AS aluno,
    curso.nome AS curso
FROM
    aluno
    FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    FULL JOIN curso ON aluno_curso.curso_id = curso.id;

-- Cross join: para cada linha na tabela aluno ele vai preencher com todas linhas de cursos
SELECT
    aluno.nome AS aluno,
    curso.nome AS curso
FROM
    aluno
    CROSS JOIN curso;

