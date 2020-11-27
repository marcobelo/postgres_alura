-- Usando aggregadores
-- COUNT conta a quantidade de linhas, aceita * ou um campo especifico
SELECT COUNT(id),
    -- SUM somatoria dos valores, apenas campos numericos
    SUM(id),
    -- MAX retorna o maior valor encontrado
    MAX(id),
    -- MIN retorna o menor valor encontrado
    MIN(id),
    -- AVG retorna o valor medio, ROUND arredonda o valor com n casas decimais
    ROUND(AVG(id), 2)
FROM funcionarios;