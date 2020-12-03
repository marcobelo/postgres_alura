CREATE OR REPLACE FUNCTION cria_curso (nome_curso varchar, nome_categoria varchar)
    RETURNS void
    AS $$
DECLARE
    id_categoria integer;
BEGIN
    SELECT
        id
    FROM
        academico.categoria
    WHERE
        nome = nome_categoria INTO id_categoria;
    IF NOT FOUND THEN
        INSERT INTO academico.categoria (nome)
            VALUES (nome_categoria)
        RETURNING
            id INTO id_categoria;
    END IF;
    INSERT INTO academico.curso (nome, categoria_id)
        VALUES (nome_curso, id_categoria);
END;
$$
LANGUAGE plpgsql;

SELECT
    cria_curso ('flutter', 'Programação');

SELECT
    *
FROM
    academico.curso;

SELECT
    *
FROM
    academico.categoria;

------------
CREATE OR REPLACE FUNCTION cria_instrutor (nome_instrutor varchar, salario_instrutor DECIMAL)
    RETURNS void
    AS $$
DECLARE
    id_instrutor_inserido integer;
    media_salarial DECIMAL;
    instrutores_recebem_menos integer DEFAULT 0;
    total_instrutores integer DEFAULT 0;
    salario DECIMAL;
    percentual DECIMAL;
BEGIN
    INSERT INTO instrutor (nome, salario)
        VALUES (nome_instrutor, salario_instrutor)
    RETURNING
        id INTO id_instrutor_inserido;
    --
    SELECT
        AVG(instrutor.salario) INTO media_salarial
    FROM
        instrutor
    WHERE
        id != id_instrutor_inserido;
    --
    IF salario_instrutor > media_salarial THEN
        INSERT INTO log_instrutores (informacao)
            VALUES (nome_instrutor || ' recebe acima da média');
    END IF;
    --
    FOR salario IN
    SELECT
        instrutor.salario
    FROM
        instrutor
    WHERE
        id != id_instrutor_inserido LOOP
            total_instrutores := total_instrutores + 1;
            IF salario_instrutor > salario THEN
                instrutores_recebem_menos := instrutores_recebem_menos + 1;
            END IF;
        END LOOP;
    --
    percentual := instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;
    --
    INSERT INTO log_instrutores (informacao)
        VALUES (nome_instrutor || ' recebe mais do que ' || percentual || '% da grade de instrutores');
END;
$$
LANGUAGE plpgsql;

SELECT
    *
FROM
    instrutor;

SELECT
    cria_instrutor ('Fulano de tal', '1000');

SELECT
    *
FROM
    log_instrutores;

