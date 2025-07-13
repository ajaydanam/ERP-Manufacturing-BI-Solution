BULK INSERT dim_product
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\dim_product.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);



BULK INSERT dim_date
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\dim_date.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


BULK INSERT dim_fault_type
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\dim_fault_type.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


BULK INSERT dim_machine
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\dim_machine.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


BULK INSERT dim_operator
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\dim_operator.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


BULK INSERT dim_plant
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\dim_plant.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);



BULK INSERT dim_shift
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\dim_shift.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


BULK INSERT fact_cost_journals
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\fact_cost_journals.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


BULK INSERT fact_inventory_movements
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\fact_inventory_movements.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


BULK INSERT fact_machine_downtime
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\fact_machine_downtime.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


BULK INSERT fact_production_orders
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\fact_production_orders.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


BULK INSERT fact_quality_logs
FROM 'C:\Users\ajayd\OneDrive\Documents\GitHub\ERP-Manufacturing-BI-Solution\Datasets\\fact_quality_logs.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

