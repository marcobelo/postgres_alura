-- Doc: https://www.postgresql.org/docs/current/sql-createtype.html
CREATE TYPE CLASSIFICACAO AS ENUM (
    'LIVRE',
    '12_ANOS',
    '14_ANOS',
    '16_ANOS',
    '18_ANOS'
);

CREATE TEMPORARY TABLE filme (
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    classificacao CLASSIFICACAO
);

INSERT INTO filme (nome, classificacao)
    VALUES ('Um bom filme', '18_ANOS');

SELECT
    *
FROM
    filme;

