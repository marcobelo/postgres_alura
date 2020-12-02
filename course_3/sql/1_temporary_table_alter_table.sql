-- Creating temporary tables
-- Create table doc: https://www.postgresql.org/docs/12/sql-createtable.html
CREATE TEMPORARY TABLE IF NOT EXISTS a (
    coluna1 varchar(255) NOT NULL CHECK (coluna1 != ''),
    coluna2 varchar(255) NOT NULL,
    UNIQUE (coluna1, coluna2)
);

INSERT INTO a
    VALUES ('a', 'b');

INSERT INTO a
    VALUES ('a', 'c');

-- Alter table doc: https://www.postgresql.org/docs/12/sql-altertable.html
ALTER TABLE IF EXISTS a RENAME TO teste;

ALTER TABLE IF EXISTS teste RENAME coluna1 TO primeira_coluna;

ALTER TABLE IF EXISTS teste RENAME coluna2 TO segunda_coluna;

SELECT
    *
FROM
    teste;

