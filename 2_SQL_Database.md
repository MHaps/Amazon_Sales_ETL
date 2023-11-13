<Star Schema:>
Fact table "salesmetrics"
Key references to dimension tables "productcategory," "productsize," and "quantity".

<Primary Keys:>
-A primary key is a column or set of columns in a table that uniquely identifies each row in that table.
-Primary keys are used as the basis for creating indexes.

<Foreign Keys:>
-The foreign key column(s) in one table refers to the primary key column(s) in another table. This creates a parent-child relationship between the tables.
-A foreign key is a column or set of columns in one table that establishes a link between data in two tables.
-They help prevent orphaned records.

<Aliases:>
Aliases in SQL allow you to create shortcuts for table names or column names. They serve as temporary alternative names that you can use within the context of a specific query, making it easier to work with complex queries 

<Surrogate Keys:> 
Add Surrogate Key to Fact Table: Add a primary key column (surrogate key) to the fact table. This will uniquely identify each record in the fact table.

<Clauses:>                          <Statement:>
1-SELECT                            One or More Clauses
2-FROM
3-WHERE
4-GROUP BY
5-HAVING
6-ORDER BY
7-JOIN
8-UPDATE
9-DELETE
10-INSERT INTO
11-ALTER TABLE
12-CREATE TABLE



<Systematic Approach>
1-Clean data.
2-Explore: Visualization tools.
3-Analyze: Statistical methods to analyze.
4-Presentation/Documentation.