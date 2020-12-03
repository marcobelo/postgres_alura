CREATE OR REPLACE FUNCTION tabuada (numero integer)
    RETURNS SETOF varchar
    AS $$
DECLARE
    multiplicador integer DEFAULT 1;
    resultado integer;
BEGIN
    LOOP
        resultado := numero * multiplicador;
        RETURN NEXT CONCAT(numero, ' x ', multiplicador, ' = ', resultado);
        multiplicador := multiplicador + 1;
        EXIT
        WHEN multiplicador = 10;
    END LOOP;
END;
$$
LANGUAGE plpgsql;

SELECT
    tabuada (2);

--
CREATE OR REPLACE FUNCTION tabuada (numero integer)
    RETURNS SETOF varchar
    AS $$
DECLARE
    multiplicador integer DEFAULT 1;
    resultado integer;
BEGIN
    WHILE multiplicador < 10 LOOP
        resultado := numero * multiplicador;
        RETURN NEXT CONCAT(numero, ' x ', multiplicador, ' = ', resultado);
        multiplicador := multiplicador + 1;
    END LOOP;
END;
$$
LANGUAGE plpgsql;

SELECT
    tabuada (2);

--
CREATE OR REPLACE FUNCTION tabuada (numero integer)
    RETURNS SETOF varchar
    AS $$
DECLARE
    resultado integer;
BEGIN
    FOR multiplicador IN 1..9 LOOP
        resultado := numero * multiplicador;
        RETURN NEXT CONCAT(numero, ' x ', multiplicador, ' = ', resultado);
    END LOOP;
END;
$$
LANGUAGE plpgsql;

SELECT
    tabuada (2);

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

CREATE OR REPLACE FUNCTION instrutor_com_salario (OUT nome varchar, OUT salario_ok varchar)
    RETURNS SETOF record
    AS $$
DECLARE
    instrutor instrutor;
BEGIN
    FOR instrutor IN
    SELECT
        *
    FROM
        instrutor LOOP
            nome := instrutor.nome;
            salario_ok := salario_ok (instrutor);
            RETURN NEXT;
        END LOOP;
END;
$$
LANGUAGE plpgsql;

SELECT
    *
FROM
    instrutor_com_salario ();

