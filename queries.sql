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

SELECT neutered, COUNT(*) AS escape_count
FROM animals
WHERE escape_attempts > 0
GROUP BY neutered;


SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

/* Day 3 */
SELECT name FROM animals
JOIN owners ON animals.id = owners.id
WHERE full_name = 'Melody Pond'

SELECT * FROM animals
JOIN species ON species.id = animals.species_id
WHERE name 'Pokemon' 

SELECT  owners.name, animals.name FROM animals
JOIN  owners ON owner.id = animals.id --right/left

SELECT species.name, COUNT(*) FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name

SELECT animals.name FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE full_name ' Jennifer Orwell'

SELECT animals.name FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE full_name 'Dean Winchester' AND escape_attempts = 0

SELECT owners.full_name, COUNT(*) FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(*) DESC LIMIT 1