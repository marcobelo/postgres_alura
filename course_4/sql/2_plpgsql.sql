CREATE OR REPLACE FUNCTION primeira_pl ()
    RETURNS integer
    AS $$
DECLARE
    primeira_variavel integer DEFAULT 3;
BEGIN
    primeira_variavel := primeira_variavel * 2;
    -- criando um bloco dentro de outro bloco, caso também se DECLARE a primeira_variavel
    -- então ela passa a ser uma nova variavel valida apenas nesse escopo, e e esse bloco
    -- deixa de enxergar a primeira_variavel de fora
    BEGIN
        primeira_variavel := 42;
    END;
    RETURN primeira_variavel;
END
$$
LANGUAGE plpgsql;

--
SELECT
    primeira_pl ();

-- Recriando funções antigas agora com plpgsql
CREATE OR REPLACE FUNCTION cria_instrutor_falso ()
    RETURNS instrutor
    AS $$
BEGIN
    RETURN ROW (22,
        'Nome Falso',
        200::DECIMAL)::instrutor;
END;
$$
LANGUAGE plpgsql;

--
SELECT
    id,
    nome,
    salario
FROM
    cria_instrutor_falso ();

-- recriando funcao de cima de outra forma
CREATE OR REPLACE FUNCTION cria_instrutor_falso ()
    RETURNS instrutor
    AS $$
DECLARE
    retorno instrutor;
BEGIN
    SELECT
        22,
        'Nome Falso',
        200::DECIMAL INTO retorno;
    RETURN retorno;
END;
$$
LANGUAGE plpgsql;

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
BEGIN
    RETURN QUERY
    SELECT
        *
    FROM
        instrutor
    WHERE
        salario > valor_salario;
END;
$$
LANGUAGE plpgsql;

--
SELECT
    *
FROM
    instrutores_bem_pagos (300);

