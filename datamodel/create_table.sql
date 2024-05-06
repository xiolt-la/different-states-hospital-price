- Creating Dimension Table for CPT/HCPCS Codes
CREATE TABLE different_states_hospital_price.DimCptHcpcs (
    cpt_id INT64 NOT NULL,
    code STRING,
    short_description STRING,
    long_description STRING
) OPTIONS(
    description="Dimension table for CPT/HCPCS Codes"
);

-- Creating Dimension Table for Hospitals
CREATE TABLE different_states_hospital_price.DimHospitals (
    hospital_id INT64 NOT NULL,
    npi_number INT64,
    name STRING,
    url STRING,
    street_address STRING,
    city STRING,
    state STRING,
    zip_code STRING
) OPTIONS(
    description="Dimension table for Hospitals"
);

-- Creating Dimension Table for Payers
CREATE TABLE different_states_hospital_price.DimPayer (
    payer_id INT64 NOT NULL,
    payer STRING
) OPTIONS(
    description="Dimension table for Payers"
);

-- Creating Fact Table for Prices
CREATE TABLE different_states_hospital_price.FactPrices (
    fact_id INT64 NOT NULL,
    cpt_id INT64,
    hospital_id INT64,
    payer_id INT64,
    price NUMERIC
) PARTITION BY DATE(_PARTITIONTIME)
CLUSTER BY cpt_id, hospital_id, payer_id
OPTIONS(
    description="Fact table for Prices with partitioning and clustering"
);