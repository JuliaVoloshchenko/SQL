/* 1. Создать БД vk, исполнив скрипт _vk_db_creation.sql (в материалах к уроку)
2. Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы (с перечнем полей, 
указанием индексов и внешних ключей) (CREATE TABLE)
*/

USE vk;

# Создадим таблицу, которая хранит информацию о комментариях
DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
	id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
    created_at DATETIME DEFAULT NOW(),
    
    # Создадим связь с таблицей users через внешний ключ по id
    FOREIGN KEY (user_id) REFERENCES users(id)
);

# Создадим таблицу, которая хранит информацию о связи медиа файла и комментария к нему
DROP TABLE IF EXISTS comment_to_media;
CREATE TABLE comment_to_media (
    id SERIAL,
    media_id BIGINT UNSIGNED NOT NULL,
    comment_id BIGINT UNSIGNED NOT NULL,

# Сождадим связь с таблицей media по id
# Создадим связь с таблицей comments по id
    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (comment_id) REFERENCES comments(id)
);

# 3. Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)
INSERT INTO `users` (`firstname`, `lastname`, `email`, `phone`)
VALUES ('Петр', 'Петров', 'trust@mail.ru', '80574545678'),
	   ('Ольга', 'Иванова', 'rets@mail.ru', '80687683234'),
       ('Виктория', 'Смирнова', 'smirnoo@mail.ru', '89065577123'),
       ('Григорий', 'Бублик', 'kjsfd@ru', '86543044555'),
       ('Вера', 'Вилкова','vilkova_vera@yandex.ru','89300040055'),
       ('Филипп', 'Трулев', 'filgl@ru', '84567370773'),
       ('Александр', 'Александров', 'sdgf@mail.ru', '7680549332'),
       ('Анна', 'Крылова', 'reds@ru', '8677470663'),
       ('Владимир', 'Дроздов', 'vladimirer@yandex.ru','89606543616'),
       ('Ксения', 'Антонова', 'refg@mail.ru', '8550667432');
       
       
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`)
VALUES ('1','М','2000-01-11',NULL,NOW(),'Москва'),
    ('2','Ж','2002-02-12',NULL,NOW(),'Евпатория'),
    ('3','Ж','2001-03-13',NULL,NOW(),'Калининград'),
    ('4','М','2021-04-14',NULL,NOW(),'Симферополь'),
    ('5','Ж','2014-05-15',NULL,NOW(),'Екатеринбург'),
    ('6','М','2007-06-16',NULL,NOW(),'Архангельск'),
    ('7','М','2005-07-27',NULL,NOW(),'Санкт-Петербург'),
    ('8','Ж','2010-08-01',NULL,NOW(),'Владивосток'),
    ('9','М','2015-09-05',NULL,NOW(),'Ростов'),
    ('10','Ж','2020-10-07',NULL,NOW(),'Севастополь');
  
# 5*. Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней) (DELETE)
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`)
VALUES ('1', '1','77', 'Некоторый текст', '2023-02-20'),
    ('2', '72','74', 'Еще текст', '2021-04-01'),
    ('3', '73','74', 'И еще текст', '2025-01-06');

DELETE FROM messages 
WHERE created_at > NOW();