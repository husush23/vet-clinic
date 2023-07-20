/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 date_of_birth DATE NOT NULL,
 escape_attempts INTEGER NOT NULL,
 weight_kg DECIMAL(10,2)
 neutered BOOLEAN
)

/* DAY 2*/
-- Add new column to the table
ALTER TABLE animals
ADD COLUMN species VARCHAR(50)

/*DAY 3*/
CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INTEGER
)

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
)

-- Remove Species column
ALTER TABLE animals DROP COLUMN species

-- Adding species_id
ALTER TABLE animals ADD species_id INT  REFERENCES species(id);

-- Adding owner_id
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id)
