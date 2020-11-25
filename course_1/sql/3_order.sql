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
-- Ordernando os resultados:
-- Ordenando por nome e matricula
SELECT *
FROM funcionarios
ORDER BY nome,
    matricula;
-- DESC aplicasse apenas a matricula nesse exemplo
-- A ordem listada em ORDER BY importa, ele ordena primeiro todas colunas pelo
-- primeiro argumento passado em ORDER BY, depois pelo proximo... no exemplo
-- ordena primeiro pelo nome e depois pela matricula
SELECT *
FROM funcionarios
ORDER BY nome,
    matricula DESC;
-- Essa outra forma de ordenacao se passa o indice da coluna resultante do SELECT
-- 3 = nome, 4 = sobrenome, 2 = matricula
-- DESC pode ser utilizado da mesma forma que antes, exemplo: 3, 4 DESC, 2
SELECT *
FROM funcionarios
ORDER BY 3,
    4,
    2;