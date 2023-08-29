/* 1.Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. 
 * Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, профиль 
 * и запись из таблицы users. Функция должна возвращать номер пользователя.
*/

CREATE DEFINER=`root`@`localhost` FUNCTION `vk`.`delete_user`(user_id INT) RETURNS int
    DETERMINISTIC
BEGIN
	DELETE FROM messages 
	WHERE user_id = user_id;
	
	DELETE FROM likes 
	WHERE user_id = user_id;

	DELETE FROM users 
	WHERE id = user_id;

	RETURN id;
END

-- 2.Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в транзакцию внутри процедуры.

DROP PROCEDURE IF EXISTS vk.delete_user_pr;

DELIMITER $$
$$
CREATE PROCEDURE vk.delete_user_pr(IN user_id INT(1))
BEGIN
	START TRANSACTION;

	DELETE FROM messages 
	WHERE user_id = user_id;
	
	DELETE FROM likes 
	WHERE user_id = user_id;

	DELETE FROM users 
	WHERE id = user_id;
	
COMMIT;
END$$
DELIMITER ;

/* 3.* Написать триггер, который проверяет новое появляющееся сообщество. Длина названия сообщества
 * (поле name) должна быть не менее 5 символов. Если требование не выполнено, то выбрасывать исключение с пояснением.
 */
USE vk;

DELIMITER $$
$$
CREATE TRIGGER chek_name
BEFORE INSERT  
ON communities FOR EACH ROW
BEGIN 
	IF NEW.name < '_____' THEN 
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Имя не подходит, придумайте другое';
	END IF;
END
$$
DELIMITER ;

-- Сохраненный тригер

CREATE DEFINER=`root`@`localhost` TRIGGER `chek_name` BEFORE INSERT ON `communities` FOR EACH ROW BEGIN 
	IF NEW.name < '_____' THEN 
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Имя не подходит, придумайте другое';
	END IF;
END
