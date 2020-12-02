CREATE OR REPLACE FUNCTION primeira_funcao ()
    RETURNS integer
    AS $$
    SELECT
        42;

$$
LANGUAGE SQL;

--
SELECT
    *
FROM
    primeira_funcao () AS numero;

--
CREATE OR REPLACE FUNCTION soma_dois_numeros (numero_1 integer, numero_2 integer)
    RETURNS integer
    AS $$
    SELECT
        numero_1 + numero_2
$$
LANGUAGE SQL;

--
SELECT
    soma_dois_numeros (4, 5);

CREATE OR REPLACE FUNCTION soma_dois_numeros_2 (integer, integer)
    RETURNS integer
    AS $$
    SELECT
        $1 + $2
$$
LANGUAGE SQL;

--
SELECT
    soma_dois_numeros_2 (1, 5);

--
CREATE TABLE IF NOT EXISTS a (
    nome varchar(255) NOT NULL
);

--
CREATE OR REPLACE FUNCTION cria_a (nome varchar)
    RETURNS varchar
    AS $$
    INSERT INTO a (nome)
        VALUES (cria_a.nome);

SELECT
    nome;

$$
LANGUAGE SQL;

--
SELECT
    cria_a ('Marco');

--
--
CREATE FUNCTION dobro_do_salario (instrutor)
    RETURNS DECIMAL
    AS $$
    SELECT
        $1.salario * 2 AS dobro;

$$
LANGUAGE SQL;

--
SELECT
    nome,
    dobro_do_salario (instrutor.*)
FROM
    instrutor;

--
CREATE OR REPLACE FUNCTION cria_instrutor_falso ()
    RETURNS instrutor
    AS $$
    SELECT
        22,
        'Nome Falso',
        200::DECIMAL;

$$
LANGUAGE SQL;

--
SELECT
    id,
    nome,
    salario
FROM
    cria_instrutor_falso ();

--
CREATE OR REPLACE FUNCTION instrutores_bem_pagos (valor_salario DECIMAL)
    RETURNS SETOF instrutor
    AS $$
    SELECT
        *
    FROM
        instrutor
    WHERE
        salario > valor_salario;

$$
LANGUAGE SQL;

SELECT
    *
FROM
    instrutores_bem_pagos (300);

--
CREATE TYPE dois_valores AS (
    soma integer,
    produto integer
);

--
CREATE OR REPLACE FUNCTION soma_e_produto (num_1 integer, num_2 integer)
    RETURNS dois_valores
    AS $$
    SELECT
        num_1 + num_2 AS soma,
        num_1 * num_2 AS produto;

$$
LANGUAGE SQL;

--
SELECT
    *
FROM
    soma_e_produto (3, 3);

--
CREATE OR REPLACE FUNCTION soma_e_produto_2 (num_1 integer, num_2 integer, OUT soma integer, OUT produto integer
)
AS $$
    SELECT
        num_1 + num_2 AS soma,
        num_1 * num_2 AS produto;

$$
LANGUAGE SQL;

--
SELECT
    *
FROM
    soma_e_produto_2 (3, 3);

