cd "C:\Program Files\PostgreSQL\15\bin"
psql -h localhost -U postgres
\c amazon_sales_report
\d fact_sales

\COPY fact_sales (quantityvalue) FROM 'C:/Program Files/PostgreSQL/15/data/python_files/z_quantityvalue_extracted.csv' WITH CSV HEADER NULL '';

----------------------------------
<Display Column, Tables;>
SELECT	
	table_name,
	column_name
FROM
	information_schema.columns
WHERE
	table_schema NOT IN ('information_schema', 'pg_catalog')
ORDER BY
	table_name, ordinal_position;

<Rename Column:>
ALTER TABLE salesmetrics
RENAME COLUMN productcategoryid TO categoryid;

<Update Column:>
UPDATE salesmetrics
SET amount = NULL
WHERE amount IS NULL;

<Select Limit:>
select amount from salesmetrics
offset 15999
limit 1000

<Column Data Transfer:>
UPDATE salesmetrics AS sm
SET quantityvalue = q.quantityvalue
FROM quantity AS q
WHERE sm.common_key = q.common_key;

<Insert Data (add new data):>
INSERT INTO salesmetrics (quantityvalue)
SELECT quantityvalue
FROM quantity;

<Update Table (modify existing data):>
UPDATE fact_sales fs
SET productcategory_id = (
    SELECT pc.productcategory_id
    FROM productcategory pc
    WHERE pc.sales_id = fs.sales_id
)

<Delete Rows:>
DELETE FROM your_table
LIMIT 16000;

<Auto Increment:>
ALTER SEQUENCE fact_sales_sales_id_seq OWNED BY NONE;
SELECT setval('fact_sales_sales_id_seq', your_desired_start_value, false);

<Check triggers, Rules, Constraints:> 
SELECT tgname, tgisinternal, tgconstraint
FROM pg_trigger
WHERE tgrelid = 'your_table_name'::regclass;

<Add Constraints:>
ALTER TABLE fact_sales
ADD CONSTRAINT fk_fact_sales_category
FOREIGN KEY (category_id) REFERENCES productcategory(category_id);

<SQL SUM-JOIN_GROUP BY-ORDER BY:>
SELECT
    pc.category_name,
    ps.size_name,
    SUM(fs.amount) AS total_amount,
    SUM(fs.quantity) AS total_quantity
FROM
    fact_sales fs
JOIN
    productcategory pc ON fs.category_id = pc.category_id
JOIN
    productsize ps ON fs.size_id = ps.size_id
GROUP BY
    pc.category_name,
    ps.size_name
ORDER BY
    pc.category_name,
    ps.size_name;





<c NULL with empty Strings 
with open('z_amount_extracted.csv', 'r') as infile:
    with open('z_amount_preprocessed.csv', 'w') as outfile:
        for line in infile:
            processed_line = line.replace('NULL', '')
            outfile.write(processed_line)											 