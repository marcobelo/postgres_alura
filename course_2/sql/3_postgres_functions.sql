-- Doc: https://www.postgresql.org/docs/current/functions.html
-- String functions
-------------------
-- Essa forma de concatenar quando encontra o valor NULL ela resulta em NULL
SELECT
    (primeiro_nome || NULL || ultimo_nome) AS nome_completo
FROM
    aluno;

-- Usando a funcao CONCAT o NULL passa a ser ignora, no exemplo retorna: MarcoBelo
SELECT
    CONCAT('Marco', NULL, 'Belo');

-- Podemos chamar uma funcao dentro da outra, nesse caso a string
-- e concatenada, depois UPPER deixa as letras maiusculas,
-- e TRIM remove espacos no comeco e final da string
SELECT
    TRIM(UPPER(CONCAT('potato', ' ', 'bread')) || '    ');

-- Date functions
-----------------
-- A funcao age retorna a idade apresentando anos, meses e dias,
-- tem como extrair essas informacoes com a funcao EXTRACT
SELECT
    (primeiro_nome || NULL || ultimo_nome) AS nome_completo,
    EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade
FROM
    aluno;

-- Other functions
-----------------------
-- TO_CHAR e usado para converter um tipo de dados para string
-- seguindo o formato passado para ele, veja documentacao para mais detalhes
SELECT
    TO_CHAR(NOW(), 'DD(DAY), MM(MONTH), YYYY');

SELECT
    TO_CHAR(128.3111::real, '999D99');

