/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT * FROM animals
WHERE date_of_birth   BETWEEN '2016-01-01' AND '2019-01-01';

SELECT * FROM animals
WHERE escape_attempts < 3 AND neutered =true;

SELECT name, date_of_birth FROM animals
WHERE name = 'Pikachu' OR name = 'Agumon';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered =true;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals
WHERE weight_kg >= 10.4 and weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Updating species 
UPDATE animals SET species = 'digimon 'WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
SELECT * FROM animals;
COMMIT;

-- Deleting records
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT savepoint1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg <0;
COMMIT;

--      Queries

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;

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
JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT animals.name FROM animals
JOIN species ON species.id = animals.species_id
WHERE species.name = 'Pokemon';

SELECT  owners.full_name, animals.name FROM animals
 JOIN  owners ON owners.id = animals.owner_id;


SELECT species.name, COUNT(*) FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name FROM animals
JOIN owners ON owners.id = animals.owner_id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' 
AND species.name = 'Digimon';


SELECT animals.name FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name ='Dean Winchester' 
AND animals.escape_attempts = 0;


SELECT owners.full_name, COUNT(*) FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(*) DESC LIMIT 1;

-- Day 4
SELECT a.name AS animal_name
FROM animals AS a
JOIN visits AS v ON a.id = v.animal_id
JOIN vets AS vet ON v.vet_id = vet.id
WHERE vet.name = 'William Tatcher'
ORDER BY v.date_of_visit DESC
LIMIT 1;

SELECT  COUNT(DISTINCT v.animal_id) FROM visits AS v
JOIN vets AS vet ON vet.id = v.vet_id
WHERE vet.name = 'Stephanie Mendez';

SELECT v.name, s.name FROM vets as v
LEFT JOIN specializations AS spc ON v.id = vet_id
LEFT JOIN species AS s ON s.id = spc.species_id;

SELECT a.name FROM animals AS a
JOIN visits AS v ON v.animal_id = a.id
JOIN vets AS vet ON v.vet_id = vet.id
WHERE vet.name = 'Stephanie Mendez' 
AND v.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name, COUNT(vet.id) AS countes FROM animals AS a
JOIN visits as v ON v.animal_id = a.id
JOIN vets AS vet ON vet.id = v.vet_id
GROUP BY a.name 
ORDER BY COUNT(vet.id) DESC 
LIMIT 1;

SELECT a.name, v.date_of_visit, vet.name FROM animals AS a
JOIN visits AS v  ON  a.id = v.animal_id
JOIN vets AS vet ON vet.id = v.vet_id
WHERE vet.name ='Maisy Smith'
ORDER BY v.date_of_visit
LIMIT 1;

SELECT a.name, v.date_of_visit, vet.name FROM animals AS a
JOIN visits AS v ON v.animal_id = a.id
JOIN vets AS vet ON vet.id = v.vet_id
ORDER BY v.date_of_visit DESC
LIMIT 1;

SELECT COUNT(*)
FROM visits v
JOIN animals a ON v.animal_id = a.id
LEFT JOIN specializations s ON v.vet_id = s.vet_id AND a.species_id = s.species_id
WHERE s.species_id IS NULL;

SELECT a.species_id, s.name AS species_name, COUNT(*) AS num_visits
FROM visits AS v
JOIN animals AS a ON v.animal_id = a.id
JOIN vets AS vet ON v.vet_id = vet.id
JOIN species AS s ON a.species_id = s.id
WHERE vet.name = 'Maisy Smith'
GROUP BY a.species_id, s.name
ORDER BY num_visits DESC
LIMIT 1;