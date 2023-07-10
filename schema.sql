/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name CHAR(25),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);
