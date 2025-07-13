*** Query to check the row-count of  all the tables ***

SELECT 'dim_date' AS TableName, COUNT(*) AS Row_Count FROM dim_date
UNION ALL
SELECT 'dim_product', COUNT(*) FROM dim_product
UNION ALL
SELECT 'dim_plant', COUNT(*) FROM dim_plant
UNION ALL
SELECT 'dim_machine', COUNT(*) FROM dim_machine
UNION ALL
SELECT 'dim_operator', COUNT(*) FROM dim_operator
UNION ALL
SELECT 'dim_fault_type', COUNT(*) FROM dim_fault_type
UNION ALL
SELECT 'dim_shift', COUNT(*) FROM dim_shift
UNION ALL
SELECT 'fact_production_orders', COUNT(*) FROM fact_production_orders
UNION ALL
SELECT 'fact_cost_journals', COUNT(*) FROM fact_cost_journals
UNION ALL
SELECT 'fact_inventory_movements', COUNT(*) FROM fact_inventory_movements
UNION ALL
SELECT 'fact_machine_downtime', COUNT(*) FROM fact_machine_downtime
UNION ALL
SELECT 'fact_quality_logs', COUNT(*) FROM fact_quality_logs


*** Sample Join Check - Production orders with Product & Date ***

SELECT TOP 10
    p.product_name,
    d.full_date,
    f.planned_qty,
    f.actual_qty
FROM fact_production_orders f
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_date d ON f.date_key = d.date_key;


*** Join Check - Downtime by Operator and Fault ***

SELECT TOP 10
    o.name AS operator_name,
    ft.fault_name,
    d.full_date,
    f.downtime_minutes
FROM fact_machine_downtime f
JOIN dim_operator o ON f.operator_id = o.operator_id
JOIN dim_fault_type ft ON f.fault_id = ft.fault_id
JOIN dim_date d ON f.date_key = d.date_key
ORDER BY f.downtime_minutes DESC;


*** Inventory Movement Summary by Type ***

SELECT movement_type, SUM(quantity) AS total_qty
FROM fact_inventory_movements
GROUP BY movement_type;


*** Quality Issues by defect Type ***

SELECT defect_type, COUNT(*) AS num_issues, SUM(rework_hours) AS total_rework
FROM fact_quality_logs
GROUP BY defect_type
ORDER BY total_rework DESC;
