-- 1. Подсчитать количество групп (сообществ), в которые вступил каждый пользователь.

SELECT user_id, COUNT(*)
FROM users
INNER JOIN users_communities ON users.id = users_communities.user_id
GROUP BY users_communities.user_id;

-- 2. Подсчитать количество пользователей в каждом сообществе.

SELECT communities.name, COUNT(*)
FROM users_communities 
INNER JOIN communities on users_communities.community_id = communities.id
GROUP BY communities.id;

/* 3. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
который больше всех общался с выбранным пользователем (написал ему сообщений).*/

SELECT from_user_id, count(*)
FROM messages
INNER JOIN users on users.id = messages.from_user_id
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY count(*) desc
LIMIT 1;

-- 4.* Подсчитать общее количество лайков, которые получили пользователи младше 18 лет.

SELECT COUNT(*)
FROM likes
INNER JOIN media ON likes.media_id = media.id 
INNER JOIN profiles ON media.user_id = profiles.user_id 
WHERE TIMESTAMPDIFF(YEAR, profiles.birthday, NOW()) < '18';

-- 5.* Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT gender,COUNT(*)
FROM likes
INNER JOIN profiles ON profiles.user_id=likes.user_id
GROUP BY gender;
