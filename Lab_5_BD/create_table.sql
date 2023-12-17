-- CREATE TABLE IF NOT EXISTS `mydb`.`producer000` (
--   `producer_id` INT NOT NULL,
--   `producer_name` VARCHAR(255) NOT NULL,
--   PRIMARY KEY (`producer_id`)
-- ) ENGINE = InnoDB;

--   DELIMITER //

--  CREATE TRIGGER insert_into_producer1
--  AFTER INSERT ON song
--  FOR EACH ROW
--  BEGIN
--    INSERT INTO producer000 (producer_id, producer_name)
--    VALUES (NEW.producer_id, CONCAT('Producer for Song ID ', NEW.song_id));
--  END //

--  DELIMITER ;

-- Видалення колонки producer_id з таблиці song, якщо вона існує
-- ALTER TABLE song DROP COLUMN IF EXISTS producer_id;

-- Додавання колонки producer_id до таблиці song
-- ALTER TABLE song ADD COLUMN producer_id INT;

-- Перезапуск тригера
-- DELIMITER //

-- CREATE TRIGGER insert_into_producer1
-- AFTER INSERT ON song
-- FOR EACH ROW
-- BEGIN
--   INSERT INTO producer000 (producer_id, producer_name)
--   VALUES (NEW.producer_id, CONCAT('Producer for Song ID ', NEW.song_id));
-- END //producer000

-- DELIMITER ;


-- Вставка значень в таблицю "song"
-- INSERT INTO song (song_id, song_title, genre, release_date, performer_id, album_id, word_id, producer_id)
-- VALUES 
--   (100670, 'Song Title 1', 'Pop', '2023-01-01 00:00:00', 1, 1, 1, 1),
--   (200680, 'Song Title 2', 'Rock', '2023-02-01 00:00:00', 2, 2, 2, 1);
-- Вставка значень в таблицю "producer000"
-- INSERT INTO producer000 (producer_id, producer_name)
-- VALUES
--   (1, 'Producer 1'),
--   (2, 'Producer 2'),
--   (3, 'Producer 3');


-- Перевірка результатів в таблиці "producer000"
SELECT * FROM producer000;

-- Перевірка результатів в обох таблицях
SELECT * FROM song;
SELECT * FROM producer000;

SELECT
  p.producer_id,
  COUNT(s.song_id) AS song_count
FROM
  producer000 p
  LEFT JOIN song s ON p.producer_id = s.producer_id
GROUP BY
  p.producer_id;


-- Видалення тригера
-- DROP TRIGGER IF EXISTS insert_into_producer1;
