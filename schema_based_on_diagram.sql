CREATE TABLE patients (
    id PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
)

CREATE TABLE medical_histories (
    id PRIMARY KEY
    admitted at TIMESTAMP,
    patient_id REFERENCES patients(id),
    status VARCHAR(50)
)
--table for many-to-many relations
CREATE TABLE medicals (
    medical_history_id REFERENCES medical_histories(id),
    treamtment_id REFERENCES treatments(id)
)
CREATE TABLE treatments (
    id PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
)

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL(10,2),
    quantity INT,
    total_price DECIMAL(10,2),
    invoice_id INTEGER REFERENCES invoices(id),
    treatment_id INTEGER REFERENCES treatments(id)
);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    name VARCHAR(100)
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total DECIMAL(10,2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INTEGER REFERENCES medical_histories(id)
);

-- Creating indexes on the foreign key columns
CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON medicals (medical_history_id);
CREATE INDEX ON medicals (treatment_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON invoices (medical_history_id);
