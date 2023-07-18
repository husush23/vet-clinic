/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon'

SELECT * FROM animals
WHERE date_of_birth   BETWEEN '2016-01-01' AND '2019-01-01'

SELECT * FROM animals
WHERE escape_attempts < 3 AND neutered =true

SELECT name, date_of_birth FROM animals
WHERE name = 'Pikachu' OR name = 'Agumon'

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5

SELECT * FROM animals WHERE neutered =true

SELECT * FROM animals WHERE name != 'Gabumon'

SELECT * FROM animals
WHERE weight_kg >= 10.4 and weight_kg <= 17.3

BEGIN;
UPDATE animals SET species = 'unspecified'
SELECT * FROM animals
ROLLBACK
SELECT * FROM animals

-- Updating species 
UPDATE animals SET species = 'digimon 'WHERE name LIKE '%mon'
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon'
SELECT * FROM animals
COMMIT

-- Deleting records
BEGIN
DELETE FROM animals
ROLLBACK
SELECT * FROM animals
BEGIN
DELETE FROM animals WHERE date_of_birth > '2022-01-01'
SAVEPOINT savepoint1
UPDATE animals SET weight_kg = weight_kg * -1
ROLLBACK TO SAVEPOINT savepoint1
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg <0
COMMIT

--      Queries

SELECT COUNT(*) FROM animals
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0
SELECT AVG(weight_kg) FROM animals

SELECT name, id FROM animals
ORDER BY escape_attempts DESC
LIMIT 1

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
