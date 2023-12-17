DELIMITER $$

CREATE PROCEDURE CreateDynamicTables4()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE city VARCHAR(255);
  DECLARE timestamp_column VARCHAR(255);
  DECLARE num_columns INT;
  DECLARE i INT;

  DECLARE table_cursor CURSOR FOR 
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'mydb'
    ORDER BY table_name;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN table_cursor;

  read_tables: LOOP
    FETCH table_cursor INTO city;  -- Change the variable name to city

    IF done THEN
      LEAVE read_tables;
    END IF;

    SET timestamp_column = (SELECT column_name FROM information_schema.columns WHERE table_name = city ORDER BY RAND() LIMIT 1);
    SET num_columns = FLOOR(1 + RAND() * 9);

    SET @sql_query = CONCAT('CREATE TABLE IF NOT EXISTS `', city, '_', UNIX_TIMESTAMP(NOW()), '` ( ');
    SET i = 1;

    WHILE i <= num_columns DO
      SET @column_name = CONCAT('column_', i);
      SET @data_type = CASE FLOOR(1 + RAND() * 3)
                        WHEN 1 THEN 'INT'
                        WHEN 2 THEN 'VARCHAR(50)'
                        WHEN 3 THEN 'DECIMAL(10,2)'
                      END;

      SET @sql_query = CONCAT(@sql_query, '`', @column_name, '` ', @data_type, ', ');
      SET i = i + 1;
    END WHILE;

    SET @sql_query = SUBSTRING(@sql_query, 1, LENGTH(@sql_query) - 2);
    SET @sql_query = CONCAT(@sql_query, ');');

    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

  END LOOP;

  CLOSE table_cursor;
END $$

DELIMITER ;

CALL CreateDynamicTables4();
