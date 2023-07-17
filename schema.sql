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

ALTER TABLE animals ADD species_id integer REFERENCES species(id);

ALTER TABLE animals ADD owner_id integer REFERENCES owners(id);

CREATE TABLE owners(
id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
full_name CHAR(50),
age integer,
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE TABLE species(
id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name CHAR(50),
);

CREATE TABLE vets (
id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name CHAR(50),
age integer,
date_of_graduation date
);

CREATE TABLE specializations (
species_id integer, 
vets_id integer,
PRIMARY KEY (species_id, vet_id),
FOREIGN KEY (species_id) REFERENCES species(id) ,
FOREIGN KEY (vets_id) REFERENCES vets(id),
);

CREATE TABLE visits (
animals_id integer,
vets_id integer,
date_of_visit date,
PRIMARY KEY (animals_id, vets_id),
FOREIGN KEY (animals_id) REFERENCES animals(id),
FOREIGN KEY (vets_id) REFERENCES vets(id)
);