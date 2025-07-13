
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,                 -- 20220101
    full_date DATE,                           -- 1/1/2022
    day TINYINT,                              -- 1–31
    month TINYINT,                            -- 1–12
    quarter TINYINT,                          -- 1–4
    year SMALLINT,                            -- 2022, 2023, etc.
    weekday VARCHAR(10)                       -- 'Monday', 'Saturday', etc.
);


CREATE TABLE dim_fault_type (
    fault_id INT PRIMARY KEY,           -- Unique fault identifier
    fault_name VARCHAR(50) NOT NULL     -- e.g., 'Overheat'
);


CREATE TABLE dim_machine (
    machine_id INT PRIMARY KEY,              -- Unique machine ID
    machine_type VARCHAR(50) NOT NULL,       -- e.g., 'Drill'
    install_date DATE                        -- e.g., '2012-10-03'
);


CREATE TABLE dim_operator (
    operator_id INT PRIMARY KEY,                -- Unique ID for each operator
    name VARCHAR(100) NOT NULL,                 -- e.g., 'Michelle Jones'
    experience_years TINYINT,                   -- e.g., 7
    department VARCHAR(50)                      -- e.g., 'Welding'
);


CREATE TABLE dim_plant (
    plant_id INT PRIMARY KEY,             -- Unique ID for each plant
    plant_name VARCHAR(50) NOT NULL,      -- e.g., 'Plant 1'
    region VARCHAR(50)                    -- e.g., 'Mexico'
);


CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,              -- Unique ID for each product
    product_name VARCHAR(100) NOT NULL,      -- e.g., 'Identify Part'
    category VARCHAR(50),                    -- e.g., 'Electrical'
    unit VARCHAR(10)                         -- e.g., 'kg', 'pcs'
);



CREATE TABLE dim_shift (
    shift_id INT PRIMARY KEY,             -- Unique ID for each shift
    shift_name VARCHAR(20) NOT NULL       -- e.g., 'Morning', 'Night'
);


CREATE TABLE fact_cost_journals (
    entry_id INT PRIMARY KEY,                   -- Unique cost journal entry
    product_id INT,                             -- FK to dim_product
    plant_id INT,                               -- FK to dim_plant
    date_key INT,                               -- FK to dim_date
    standard_cost DECIMAL(10,2),                -- Planned cost
    actual_cost DECIMAL(10,2),                  -- Incurred cost

    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (plant_id) REFERENCES dim_plant(plant_id),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);


CREATE TABLE fact_inventory_movements (
    movement_id INT PRIMARY KEY,                  -- Unique inventory movement entry
    product_id INT,                               -- FK to dim_product
    plant_id INT,                                 -- FK to dim_plant
    date_key INT,                                 -- FK to dim_date
    movement_type VARCHAR(10),                    -- 'IN' or 'OUT'
    quantity INT,                                 -- Quantity moved

    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (plant_id) REFERENCES dim_plant(plant_id),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);


CREATE TABLE fact_machine_downtime (
    event_id INT PRIMARY KEY,                      -- Unique event ID
    machine_id INT,                                -- FK to dim_machine
    plant_id INT,                                  -- FK to dim_plant
    date_key INT,                                  -- FK to dim_date
    fault_id INT,                                  -- FK to dim_fault_type
    operator_id INT,                               -- FK to dim_operator
    downtime_minutes INT,                          -- Total downtime in minutes

    FOREIGN KEY (machine_id) REFERENCES dim_machine(machine_id),
    FOREIGN KEY (plant_id) REFERENCES dim_plant(plant_id),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (fault_id) REFERENCES dim_fault_type(fault_id),
    FOREIGN KEY (operator_id) REFERENCES dim_operator(operator_id)
);



CREATE TABLE fact_production_orders (
    order_id INT PRIMARY KEY,                     -- Unique production order ID
    product_id INT,                               -- FK to dim_product
    plant_id INT,                                 -- FK to dim_plant
    date_key INT,                                 -- FK to dim_date
    shift_id INT,                                 -- FK to dim_shift
    planned_qty INT,                              -- Planned quantity for production
    actual_qty INT,                               -- Actual quantity produced

    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (plant_id) REFERENCES dim_plant(plant_id),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (shift_id) REFERENCES dim_shift(shift_id)
);


CREATE TABLE fact_quality_logs (
    log_id INT PRIMARY KEY,                         -- Unique quality log entry
    product_id INT,                                 -- FK to dim_product
    plant_id INT,                                   -- FK to dim_plant
    date_key INT,                                   -- FK to dim_date
    operator_id INT,                                -- FK to dim_operator
    defect_type VARCHAR(50),                        -- e.g., 'Scratch', 'Crack'
    rework_hours DECIMAL(5,2),                      -- Time spent reworking (e.g., 2.04 hrs)

    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (plant_id) REFERENCES dim_plant(plant_id),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (operator_id) REFERENCES dim_operator(operator_id)
);

