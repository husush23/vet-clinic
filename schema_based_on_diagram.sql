CREATE TABLE patients (
    id PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
)

CREATE TABLE medical_histories(
    id PRIMARY KEY
    admitted at TIMESTAMP,
    patient_id REFERENCES patients(id),
    status VARCHAR(50)
)
--table for many-to-many relations
CREATE TABLE medicals(
    medical_history_id REFERENCES medical_histories(id),
    treamtment_id REFERENCES treamtments(id)
)
CREATE TABLE treatmets(
    id PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
)
