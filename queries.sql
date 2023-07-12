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

SELECT a.name AS animal_name, s.name AS animal_type
FROM animals AS a
JOIN species AS s ON a.species_id = s.id
JOIN owners AS o ON a.owner_id = o.id 
WHERE o.full_name = 'Melody Pond';


SELECT a.name AS animal_name, s.name AS animal_type
FROM animals AS a
JOIN species AS s ON a.species_id = s.id
WHERE s.name = 'pokemon';

SELECT o.full_name AS owner_name, COALESCE(a.name, 'No animal') AS animal_name
FROM owners AS o
LEFT JOIN animals AS a ON o.id = a.owner_id;

SELECT s.name AS species_name, COUNT(*) AS animal_count
FROM animals AS a
JOIN species AS s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name AS digimon_name
FROM animals AS a
join owners  AS o on a.owner_id = o.id
JOIN species AS s ON a.species_id = s.id
where o.full_name = 'Jennifer Orwell' and s.name = 'digimon';

/* animals that havent tried to escape count*/

SELECT COUNT(*) AS animal_count
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

/* animals that have tried to escape list*/
SELECT a.name AS animal_name
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts < 1;

/* who owns most animals*/

SELECT o.full_name AS owner_name, COUNT(a.id) AS animal_count
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
GROUP BY o.full_name;

/* who was the last animal william tatcher see*/
SELECT a.name FROM visits AS v
INNER JOIN animals AS a ON v.animal_id = a.id
INNER JOIN vets AS v2 ON v.vet_id = v2.id
WHERE v2.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

/* how many different animals visited stephanie mendez*/
SELECT COUNT(DISTINCT a.name) AS animal_count
FROM animals AS a
JOIN visits AS v ON a.id  = v.animals_id 
JOIN vets AS v2 ON v.vets_id  = v2.id 
WHERE v2.name = 'Stephanie Mendez';
