<Table by Size>

SELECT 
    t.NAME AS TableName,
    s.Name AS SchemaName,
    p.rows AS RowCounts,
    SUM(a.total_pages) * 8 AS TotalSpaceKB
FROM 
    sys.tables t
INNER JOIN 
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.is_ms_shipped = 0
GROUP BY 
    t.Name, s.Name, p.Rows
ORDER BY 
    TotalSpaceKB DESC;

<Table schema>
SELECT 
    c.COLUMN_NAME, 
    c.DATA_TYPE, 
    c.CHARACTER_MAXIMUM_LENGTH,
    c.IS_NULLABLE
FROM 
    INFORMATION_SCHEMA.COLUMNS c
WHERE 
    c.TABLE_NAME = 'FlightSegmentAlternate';
-- Constraints (Primary keys, Foreign keys, Unique keys)
SELECT 
    tc.CONSTRAINT_NAME, 
    tc.CONSTRAINT_TYPE, 
    ccu.COLUMN_NAME, 
    ccu.TABLE_NAME AS ReferencedTable,
    ccu.CONSTRAINT_NAME AS ReferencedConstraint
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
JOIN 
    INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS ccu 
    ON tc.CONSTRAINT_NAME = ccu.CONSTRAINT_NAME
WHERE 
    tc.TABLE_NAME = 'FlightSegmentAlternate';
-- Other important information about the table
EXEC sp_spaceused 'FlightSegmentAlternate'; -- Provides space usage information for the specified table
EXEC sp_help 'FlightSegmentAlternate'; -- Returns information about the table's columns, data types, constraints, and indexes


<Primary Keys>
SELECT 
    TC.TABLE_NAME,
    CCU.COLUMN_NAME,
    TC.CONSTRAINT_NAME
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
JOIN 
    INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE CCU 
    ON TC.CONSTRAINT_NAME = CCU.CONSTRAINT_NAME
WHERE 
    TC.CONSTRAINT_TYPE = 'PRIMARY KEY'
ORDER BY 
    TC.TABLE_NAME, CCU.COLUMN_NAME;


<Foreign _keys>
SELECT 
    fk.name AS 'FK Name',
    tp.name AS 'Parent Table',
    cp.name AS 'Parent Column',
    tr.name AS 'Referenced Table',
    cr.name AS 'Referenced Column'
FROM 
    sys.foreign_keys fk
INNER JOIN 
    sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN 
    sys.tables tp ON fkc.parent_object_id = tp.object_id
INNER JOIN 
    sys.columns cp ON fkc.parent_object_id = cp.object_id AND fkc.parent_column_id = cp.column_id
INNER JOIN 
    sys.tables tr ON fkc.referenced_object_id = tr.object_id
INNER JOIN 
    sys.columns cr ON fkc.referenced_object_id = cr.object_id AND fkc.referenced_column_id = cr.column_id;


