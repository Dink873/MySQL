-- DELIMITER //

-- CREATE PROCEDURE CustomAggregateProcedure(
--     p_table_name VARCHAR(255),
--     p_column_name VARCHAR(255),
--     p_aggregate_type VARCHAR(10)
-- )
-- BEGIN
--     DECLARE result DECIMAL(10,2);
--     SET @sql = CONCAT('SELECT ', p_aggregate_type, '(', p_column_name, ') INTO @result FROM ', p_table_name);
--     PREPARE stmt FROM @sql;
--     EXECUTE stmt;
--     DEALLOCATE PREPARE stmt;
--     
--     SELECT @result AS result;
-- END //

-- DELIMITER ;


--  select * from word;


--  CALL CustomAggregateProcedure('word', 'word_count', 'Max');
--  CALL CustomAggregateProcedure('word', 'word_count', 'Min');
--  CALL CustomAggregateProcedure('word', 'word_count', 'Sum');
--  CALL CustomAggregateProcedure('word', 'word_count', 'Avg');

-- select * from word;

 --  DELIMITER //

--   CREATE PROCEDURE InsertSongIntoPlaylist3(IN playlistName VARCHAR(45), IN trackName VARCHAR(45))
--   BEGIN
--     INSERT INTO `mydb`.`playlist_has_song` (`playlist_playlist_id`, `song_song_id`)
--     SELECT
--       p.`playlist_id`,
--       t.`song_id`
--     FROM
--       `mydb`.`playlist` p
--       JOIN `mydb`.`song` t ON t.`song_title` = trackName
--     WHERE
--       p.`playlist_name` = playlistName;
--   END //

--   DELIMITER ;


 select * from song;
 select * from playlist;


 CALL InsertSongIntoPlaylist3('Назва плейлисту 1', 'Назва пісні 1');
select * from playlist_has_song;
-- DELETE FROM playlist_has_song WHERE playlist_playlist_id = 90;\
--  select * from playlist_has_song;





--  DELIMITER //

--  CREATE PROCEDURE insertrowsptableperformer1()
--  BEGIN
--      DECLARE counter INT DEFAULT 22;
--      DECLARE performer_id INT;
--      DECLARE region_id INT;
--      DECLARE music_lable_id INT;
--      DECLARE performer_name VARCHAR(45);

--      WHILE counter <= 31 DO
--         SET performer_id = counter;
--         SET performer_name = CONCAT('Artist', counter); 

--       SET music_lable_id = 1; 
--       SET region_id = 2; 

--         INSERT INTO performer (performer_id, performer_name, music_lable_id, region_id)
--         VALUES (performer_id, performer_name, music_lable_id, region_id);

--         SET counter = counter + 1;
--      END WHILE; 

--  END //

--  DELIMITER ;

-- DROP PROCEDURE IF EXISTS insertrowsptable;

-- CALL insertrowsptableperformer1();

-- DROP TRIGGER IF EXISTS prevent_user_delete;


-- DELETE FROM performer WHERE region_id = 2;

-- SELECT * FROM performer;



-- DELIMITER //

-- CREATE PROCEDURE mydb.InsertCity(
--     IN p_city_id INT,
--     IN p_country_id INT,
--     IN p_name VARCHAR(255)
-- )
-- BEGIN
--     INSERT INTO city (city_id, country_id, name)
--     VALUES (p_city_id, p_country_id, p_name);
-- END //

-- DELIMITER ;


-- CALL mydb.InsertCity(900, 1, 'Київ');
-- select * from city