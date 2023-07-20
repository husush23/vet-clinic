/* Populate database with sample data. */

 INSERT INTO animals(name, date_of_birth, escape_attempts, weight_kg, neutered)
VALUES ('Agumon', '2020-02-03', 0, 10.23, true),
('Gabumon', '2018-11-15', 2, 8, true),
('Pikachu', '2021-01-07', 1, 15.04, flase),
('Devimon','2017-05-12', 5, 11, false )

INSERT INTO animals(name, date_of_birth, escape_attempts, weight_kg, neutered)

VALUES ('Charmander', '2020-02-08', 0, -11, false),
('Plantmon', '2021-11-15',2,  -5.7, true ),
('Squirtle', '1993-04-02',  3, -12.13, false),
('Angemon', '2005-06-12', 1,-45, true),
('Boarmon', '2005-06-07', 7, 20.4, true),
('Blossom', '1998-10-13', 3, 17, true),
('Ditto', '2022-05-14', 4, 22, true)

/* Day 3*/
INSERT INTO owners(full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean WinchesteR', 14),
('Jodie Whittaker', 38)

INSERT INTO species(name)
VALUES
('Pokemon'),
('Digimon')


UPDATE animals SET species_id = (
 CASE
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE
        (SELECT id FROM species WHERE name = 'Pokemon')
 END
);

UPDATE animals SET  owner_id = (
SELECT id FROM owners WHERE full_name = 'Sam Smith'
)
WHERE name IN ('Agumon' )

UPDATE animals SET  owner_id = (
SELECT id FROM owners WHERE full_name = 'Jennifer Orwell'
)
WHERE name IN ('Pikachu', 'Gabumon' )

UPDATE animals SET  owner_id = (
SELECT id FROM owners WHERE full_name = 'Bob'
)
WHERE name IN ( 'Devimon', 'Plantmon' )

UPDATE animals SET owner_id = (
    SELECT id FROM owners WHERE full_name ='Melody Pond'
)
WHERE name IN('Charmander', 'Squirtle',  'Blossom')

UPDATE animals SET owner_id = (
    SELECT id FROM owners WHERE full_name ='Dean Winchester'
)
WHERE name IN('Angemon', 'Boarmon')

-- Day 4
INSERT INTO vets(name, age, date_of_graduation)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-14'),
('Jack Harkness', 38, '2008-06-08'),

INSERT INTO specializations(vet_id, species_id)
VALUES
((SELECT id FROM vets WHERE name ='William Tatcher'), (SELECT id FROM species WHERE name='Pokemon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO visits(animal_id, vet_id, date_of_visit)
VALUES
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name ='William Tatcher'), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Agumon'),(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),'2020-07-22'),
((SELECT id FROM animals WHERE name='Gabumon'), (SELECT id FROM vets WHERE name='Jack Harkness'), '2021-02-02'),
((SELECT id FROM animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-01-05'),
((SELECT id FROM animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-03-08'),
((SELECT id FROM animals WHERE name ='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-05-14'),
((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name ='Stephanie Mendez'), '2021-05-04'),
((SELECT id FROM animals WHERE name='Charmander'), (SELECT id FROM vets WHERE name='Jack Harkness'), '2021-02-24'),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2019-12-21'),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='William Tatcher'), '2020-08-10'),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2021-04-07'),
((SELECT id FROM animals WHERE name='Squirtle'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), '2019-09-29'),
((SELECT id FROM animals WHERE name='Angemon'), (SELECT id FROM vets WHERE name='Jack Harkness'), '2020-10-03'),
((SELECT id FROM animals WHERE name='Angemon'), (SELECT id FROM vets WHERE name='Jack Harkness'),'2020-11-04'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'),'2019-01-19'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'),'2019-05-15'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'),'2020-02-27'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'),'2020-08-03'),
((SELECT id FROM animals WHERE name='Blossom'), (SELECT id FROM vets WHERE name='Stephanie Mendez'),'2020-05-24'),
((SELECT id FROM animals WHERE name='Blossom'), (SELECT id FROM vets WHERE name='William Tatcher'),'2021-01-11')



