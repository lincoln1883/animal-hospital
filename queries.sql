/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon%';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered is true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Pikachu' OR name = 'Agumon';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name NOT LIKE '%Gabumon%';
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN

UPDATE animals SET species = 'unspecified';

ROLLBACK;

BEGIN

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

COMMIT;

BEGIN

DELETE FROM animals;

ROLLBACK;

BEGIN

DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete1;

UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete1;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) escape_attempts FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg)::numeric(10,2) FROM animals;

SELECT neutered, SUM(escape_attempts) AS total_escape_attempts
FROM animals
WHERE escape_attempts > 0   
GROUP BY neutered
ORDER BY total_escape_attempts DESC;

SELECT species,MIN(weight_kg),MAX(weight_kg) FROM animals GROUP BY species; 

SELECT species, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

/* query tables using joins*/

SELECT a.name as animal_name
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';


SELECT a.name AS animal_name
FROM animals AS a
JOIN species AS s ON a.species_id = s.id
WHERE s.name = 'pokemon';

SELECT o.full_name AS owner_name, COALESCE(a.name, 'No animal') AS animal_name
FROM owners AS o
LEFT JOIN animals AS a ON o.id = a.owner_id;