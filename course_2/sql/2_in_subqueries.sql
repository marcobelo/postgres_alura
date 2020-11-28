-- (query_1) Selecionando cursos da categoria 1 e 2
SELECT *
FROM curso
WHERE categoria_id IN (1, 2);
--- (query_2) Ids das categorias que nao possuem espaco no nome
SELECT id
FROM categoria
WHERE nome NOT LIKE '% %';
-- SUB QUERIES: chamando a query_2 como sub query de query_1
SELECT *
FROM curso
WHERE categoria_id IN (
        SELECT id
        FROM categoria
        WHERE nome NOT LIKE '% %'
    );
-- Sub queries tambem pode ser utilizadas diretamente no FROM como se fosse uma tabela
SELECT categoria
FROM (
        SELECT categoria.nome AS categoria,
            COUNT(curso.id) AS numero_cursos
        FROM categoria
            JOIN curso ON curso.categoria_id = categoria.id
        GROUP BY categoria
    ) AS categoria_cursos
WHERE numero_cursos > 3;
-- Geralmente voce nao precisa utilizar sub-query, no exemplo acima uma forma
-- de obter mesmo resultado sem a subquery usando HAVING
SELECT categoria.nome AS categoria,
    COUNT(curso.id) AS numero_cursos
FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria
HAVING COUNT(curso.id) > 3;
-- Mais um exemplo, agora transformando HAVING para subquery
SELECT curso.nome,
    COUNT(aluno_curso.aluno_id) numero_alunos
FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id
GROUP BY 1
ORDER BY numero_alunos DESC
HAVING COUNT(aluno_curso.aluno_id) > 2;
-- A forma com subquery
SELECT curso_nome
FROM (
        SELECT curso.nome AS curso_nome,
            COUNT(aluno_curso.aluno_id) AS numero_alunos
        FROM curso
            JOIN aluno_curso ON aluno_curso.curso_id = curso.id
        GROUP BY 1
        ORDER BY numero_alunos
    ) AS cursos_alunos
WHERE numero_alunos > 2;