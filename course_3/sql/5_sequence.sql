CREATE SEQUENCE prox_id;

-- Esse select retorna o proximo inteiro
-- SELECT NEXTVAL('prox_id');
-- Esse select retorna o valor atual
-- SELECT CURRVAL('prox_id');
CREATE TEMPORARY TABLE auto (
    id integer PRIMARY KEY DEFAULT NEXTVAL('prox_id'),
    nome varchar(30) NOT NULL
);

INSERT INTO auto (nome)
    VALUES ('nome_1');

INSERT INTO auto (nome)
    VALUES ('nome_2');

INSERT INTO auto (nome)
    VALUES ('nome_3');

SELECT
    *
FROM
    auto;

