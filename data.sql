/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Agumon','2020-03-20',0,true,10.23);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Gabumon', '2018-11-15',2 ,true, 8);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Devimon', '2017-05-12',5 ,true, 11);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Pikachu', '2021-01-07',1 ,false, 15.04);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Charmander', '2020-02-08',0 ,false, -11);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Plantmon', '2021-11-15',2 ,true, -5.7);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Squirtle', '1993-04-02',3 ,false, -12.13);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Angemon', '2005-06-12',1 ,true, -45);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Boarmon', '2005-06-07',7 ,true, 20.4);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Blossom', '1998-10-13',3 ,true, 17);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Ditto', '2022-05-14',4 ,true, 22);

/* owners table data*/

INSERT INTO owners (full_name,age) VALUES ('Sam Smith', 34),('Jennifer Orwell',19)('Bob', 45),('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker', 38);

/* species table data*/

INSERT INTO species (name) VALUES ('pokemon'),('digimon');

/* modify animals table*/

UPDATE animals SET species_id = ( select id FROM species where name = 'digimon') where name like '%mon%';
UPDATE animals SET species_id = ( select id FROM species where name = 'pokemon') where species_id is null;

/* modify animals table set owner id*/

UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name in ('Gabumon','Pikachu');
UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name in ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id = ( SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name in ('Angemon','Boarmon');

/* insert data for vets*/

INSERT INTO vets (name,age,date_of_graduation) VALUES ('William Tatcher', 45,'2000-04-23'),('Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez', 64, '1981-05-04'),('Jack Harkness', 38, '2008-06-08');

/* insert data into specialization table*/

with inputvalues(vets,species) as (
VALUES
('William Tatcher','pokemon'),
('Stephanie Mendez','pokemon'),
('Stephanie Mendez','digimon'),
('Jack Harkness','digimon')
)
INSERT INTO specializations (vets_id,species_id)
SELECT DISTINCT ON (v.id,s.id) v.id, s.id
FROM inputvalues AS d
LEFT JOIN vets AS v ON v.name = d.vets
LEFT JOIN species AS s ON s.name = d.species;

/* insert data for visits*/

with inputvalues (animal,vet,date_of_visit) AS (
VALUES
('Agumon','William Tatcher','2020-05-24'),('Agumon','Stephanie Mendez','2020-07-22'),
('Gabumon','Jack Harkness','2021-02-02'),('Pikachu','Maisy Smith','2020-01-05'),
('Pikachu','Maisy Smith','2020-03-08'),('Pikachu','Maisy Smith','2020-05-14'),
('Devimon','Stephanie Mendez','2021-05-04'),('Charmander','Jack Harkness','2021-02-24'),
('Plantmon','Maisy Smith','2019-12-21'),('Plantmon','William Tatcher','2020-08-10'),
('Plantmon','Maisy Smith','2021-04-07'),('Squirtle','Stephanie Mendez','2019-09-29'),
('Angemon','Jack Harkness','2020-10-03'),('Angemon','Jack Harkness','2020-11-04'),
('Boarmon','Maisy Smith','2019-01-24'),('Boarmon','Maisy Smith','2019-05-15'),
('Boarmon','Maisy Smith','2020-02-27'),('Boarmon','Maisy Smith','2020-08-03'),
('Blossom','Stephanie Mendez','2020-05-24'),('Blossom','William Tatcher','2021-01-1')
)
INSERT INTO visits (animals_id,vets_id,date_of_visit)
SELECT DISTINCT ON (a.id,v.id) a.id, v.id, to_date(d.date_of_visit::text,'YYYY-MM-DD')
FROM inputvalues AS d
LEFT JOIN animals AS a ON a.name = d.animal
LEFT JOIN vets AS v ON v.name = d.vet;

/*insert more data into visits*/
INSERT INTO visits (animals_id, vets_id, date_of_visit)
SELECT DISTINCT ON (animals_id,vets_id) animals_id.id, vets_id.id, visit_timestamp
FROM (SELECT id FROM animals) AS animals_id,
(SELECT id FROM vets) AS vets_id,
generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') AS visit_timestamp;

INSERT INTO owners (full_name, email) SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
