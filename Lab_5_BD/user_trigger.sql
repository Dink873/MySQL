select * from user;

-- DELIMITER //

-- CREATE TRIGGER prevent_user_update
-- BEFORE UPDATE ON `mydb`.`user`
-- FOR EACH ROW
-- BEGIN
--   SIGNAL SQLSTATE '45000'
--   SET MESSAGE_TEXT = 'Modification of data in the user table is not allowed.';
-- END //

-- DELIMITER ;


-- UPDATE `mydb`.`user` SET `username` = 'new_username' WHERE `user_id` = 3;


--  DELIMITER //

--  CREATE TRIGGER prevent_user_delete
--  BEFORE DELETE ON `mydb`.`user`
--  FOR EACH ROW
--  BEGIN
--    SIGNAL SQLSTATE '45000'
--    SET MESSAGE_TEXT = 'DELETE of data in the user table is not allowed.';
--  END //

--  DELIMITER ;

-- delete from user where user_id = 3;

-- DELIMITER //

-- DELIMITER //

-- CREATE TRIGGER name_insert
-- BEFORE INSERT ON `mydb`.`user`
-- FOR EACH ROW
-- BEGIN
--   DECLARE allowed_names VARCHAR(255);
--   SET allowed_names = 'Svitlana,Petro,Olha,Taras';

--   IF NOT FIND_IN_SET(NEW.username, allowed_names) > 0 THEN
--     SIGNAL SQLSTATE '45000'
--     SET MESSAGE_TEXT = 'Invalid username. Allowed names are: Svitlana, Petro, Olha, Taras.';
--   END IF;
-- END //

-- DELIMITER ;



-- -- Спроба вставити дозволене ім'я
-- INSERT INTO `mydb`.`user` (`username`, `email`, `password`, `premium_subscription`, `playlist_id`, `user_id`)
-- VALUES ('Petro', 'svitlana@email.com', 'password123', 'yes', 1, 105);

-- Спроба вставити недозволене ім'я
-- INSERT INTO `mydb`.`user` (`username`, `email`, `password`, `premium_subscription`, `playlist_id`, `user_id`)
-- VALUES ('John', 'john@email.com', 'password456', 'no', 2, 2); 
-- select * from user;


-- SELECT * FROM user;

-- DROP TRIGGER IF EXISTS restrict_name_insert;

-- DELETE FROM user WHERE user_id = 1;

