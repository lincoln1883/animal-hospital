/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon%';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered is true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Pikachu' OR name = 'Agumon';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name NOT LIKE '%Gabumon%';
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
