-- Verificando se algum instrutor precisa receber um aumento de salario
CREATE OR REPLACE FUNCTION salario_ok (instrutor instrutor)
    RETURNS varchar
    AS $$
BEGIN
    IF instrutor.salario > 200 THEN
        RETURN 'Salario está ok';
    ELSE
        RETURN 'Salario pode aumentar';
    END IF;
END;
$$
LANGUAGE plpgsql;

--
SELECT
    nome,
    salario_ok (instrutor)
FROM
    instrutor;

-- Agora verificando de uma outra forma, passando o id *(menos performatico, executa mesma query 2x)
CREATE OR REPLACE FUNCTION salario_ok (id_instrutor integer)
    RETURNS varchar
    AS $$
DECLARE
    instrutor instrutor;
BEGIN
    SELECT
        *
    FROM
        instrutor
    WHERE
        id = id_instrutor INTO instrutor;
    IF instrutor.salario > 200 THEN
        RETURN 'Salario está ok';
    ELSE
        RETURN 'Salario pode aumentar';
    END IF;
END;
$$
LANGUAGE plpgsql;

SELECT
    nome,
    salario_ok (instrutor.id)
FROM
    instrutor;

--
CREATE OR REPLACE FUNCTION salario_ok (instrutor instrutor)
    RETURNS varchar
    AS $$
BEGIN
    IF instrutor.salario > 300 THEN
        RETURN 'Salario está ok';
        ELSEIF instrutor.salario = 300 THEN
        RETURN 'Salario pode aumentar';
    ELSE
        RETURN 'Salario está defassdo';
    END IF;
END;
$$
LANGUAGE plpgsql;

--
SELECT
    nome,
    salario_ok (instrutor)
FROM
    instrutor;

--
CREATE OR REPLACE FUNCTION salario_ok (instrutor instrutor)
    RETURNS varchar
    AS $$
BEGIN
    CASE instrutor.salario
    WHEN 100 THEN
        RETURN 'Salario muito baixo';
    WHEN 200 THEN
        RETURN 'Salario baixo';
    WHEN 300 THEN
        RETURN 'Salario ok';
    ELSE
        RETURN 'Salario ótimo';
    END CASE;
END;
$$
LANGUAGE plpgsql;

--
SELECT
    nome,
    salario_ok (instrutor)
FROM
    instrutor;

