/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 date_of_birth DATE NOT NULL,
 escape_attempts INTEGER NOT NULL,
 weight_kg DECIMAL(10,2)
 neutered BOOLEAN
)

-- Add new column to the table
ALTER TABLE animals
ADD COLUMN species VARCHAR(50)
