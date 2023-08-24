-- 1. Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]

CREATE OR REPLACE VIEW activ_user AS 
	SELECT from_user_id, count(*)
	FROM messages
	INNER JOIN users on users.id = messages.from_user_id
	WHERE to_user_id = 1
	GROUP BY from_user_id
	ORDER BY count(*) desc;

-- 2. Выведите данные, используя написанное представление [SELECT]

SELECT * 
FROM activ_user

-- 3. Удалите представление [DROP VIEW]

DROP VIEW activ_user

/* 4*. Сколько новостей (записей в таблице media) у каждого пользователя? 
  Вывести поля: news_count (количество новостей), user_id (номер пользователя), 
  user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.*/

WITH cte_1 AS (  
	SELECT COUNT(*) AS news_count,
		user_id
	FROM media
	GROUP BY user_id
	)
SELECT news_count, user_id, email
FROM cte_1
JOIN users ON users.id = cte_1.user_id;