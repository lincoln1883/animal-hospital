/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
name CHAR(25),
date_of_birth date,
escape_attempts integer,
neutered boolean,
weight_kg decimal
);

ALTER TABLE animals ADD species CHAR(100);

ALTER TABLE animals ADD PRIMARY KEY (id);

ALTER TABLE animals DROP COLUMN species;

CREATE TABLE owners(
id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
full_name CHAR(50),
age integer,
);

CREATE TABLE species(
id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name CHAR(50),
);
