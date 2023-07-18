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
