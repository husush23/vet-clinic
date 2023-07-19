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
('Boarmon', '200-06-07', 7, 20.4, true),
('Blossom', '1998-10-13', 3, 17, true),
('Ditto', '2022-05-14', 4, 22, true)

/* Day 3*/
INSERT INTO owners(full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob ', 45),
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
WHERE name IN('Boarmon', 'Angemon ')




