CREATE TABLE DimCptHcpcs (
    cpt_id INT IDENTITY(1,1) PRIMARY KEY,
    code VARCHAR(32) NOT NULL UNIQUE,
    short_description VARCHAR(128),
    long_description VARCHAR(2048)
);

CREATE TABLE DimHospitals (
    hospital_id INT IDENTITY(1,1) PRIMARY KEY,
    npi_number CHAR(16) NOT NULL UNIQUE,
    name VARCHAR(256),
    url VARCHAR(512),
    street_address VARCHAR(512),
    city VARCHAR(64),
    state VARCHAR(32),
    zip_code VARCHAR(16)
);

CREATE TABLE DimPayer (
    payer_id INT IDENTITY(1,1) PRIMARY KEY,
    payer VARCHAR(128) NOT NULL UNIQUE
);

CREATE TABLE FactPrices (
    price_id INT IDENTITY(1,1) PRIMARY KEY,
    cpt_id INT,
    hospital_id INT,
    payer_id INT,
    price DECIMAL(18,2),
    FOREIGN KEY (cpt_id) REFERENCES DimCptHcpcs(cpt_id),
    FOREIGN KEY (hospital_id) REFERENCES DimHospitals(hospital_id),
    FOREIGN KEY (payer_id) REFERENCES DimPayer(payer_id)
);