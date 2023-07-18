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

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animals_id INT REFERENCES animals(id),
  vets_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY(id)
);

CREATE INDEX visit_animal_id_idx  ON visits (animals_id DESC);

/* add indexing for vets id querying*/

CREATE INDEX visits_vets_id_idx ON visits(vets_id);

/* add indexing for owners email querying*/

CREATE INDEX owners_email_idx ON owners(email);