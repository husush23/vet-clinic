/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 date_of_birth DATE NOT NULL,
 escape_attempts INTEGER NOT NULL,
 weight_kg DECIMAL(10,2),
 neutered BOOLEAN
);

/* DAY 2*/
-- Add new column to the table
ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

/*DAY 3*/
CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INTEGER
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- Remove Species column
ALTER TABLE animals DROP COLUMN species;

-- Adding species_id
ALTER TABLE animals ADD species_id INT  REFERENCES species(id);

-- Adding owner_id
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);

-- Day 4

CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    date_of_graduation DATE 
);
CREATE TABLE specializations (
    vet_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
    PRIMARY KEY(vet_id, species_id)
);

CREATE TABLE visits (
    animal_id INT REFERENCES animals(id),
    vet_id INT  REFERENCES vets(id),
    date_of_visit DATE 
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Creating indices
CREATE INDEX idx_visits_animal_id ON visits (animal_id);
CREATE INDEX idx_visits_vet_id ON visits (vet_id);
CREATE INDEX idx_owners_email ON owners (email);