SELECT * FROM mobile_phones.new_phones;

SELECT product_name, manufacturer, price 
FROM mobile_phones.new_phones
WHERE product_count > 2;

SELECT * FROM mobile_phones.new_phones WHERE manufacturer = 'Samsung';

SELECT *
FROM mobile_phones.new_phones
WHERE product_name LIKE 'IPhone' || manufacturer LIKE 'Apple';

SELECT * 
FROM mobile_phones.new_phones 
WHERE product_name REGEXP 'IPhone' || manufacturer REGEXP 'Apple';

SELECT *
FROM mobile_phones.new_phones
WHERE manufacturer LIKE 'Samsung';

SELECT * 
FROM mobile_phones.new_phones 
WHERE manufacturer REGEXP 'Samsung';

SELECT *
FROM mobile_phones.new_phones
WHERE product_name REGEXP '[0-9]';

SELECT *
FROM mobile_phones.new_phones
WHERE product_name REGEXP '[8]';