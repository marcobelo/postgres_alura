CREATE TABLE instrutor (
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    salario DECIMAL(10, 2)
);

INSERT INTO instrutor (nome, salario)
    VALUES ('Marco', 100), ('Marco2', 200), ('Marco3', 300), ('Marco4', 400), ('Marco5', 500), ('Marco6', 600);

CREATE TABLE log_instrutores (
    id serial PRIMARY KEY,
    informacao varchar(255),
    momento_criacao timestamp DEFAULT CURRENT_TIMESTAMP
);

