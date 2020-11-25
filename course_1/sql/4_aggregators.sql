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