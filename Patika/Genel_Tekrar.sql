/* 
    Patika.dev SQL Recap Assignment
	
	Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
*/

-- Q1) film tablosundan 'K' karakteri ile başlayan en uzun ve replacement_cost u en düşük 4 filmi sıralayınız.
SELECT title, length, replacement_cost FROM film
WHERE title LIKE 'K%'
ORDER BY length DESC, replacement_cost ASC
LIMIT 4;


-- Q2) 	film tablosunda içerisinden en fazla sayıda film bulunduran rating kategorisi hangisidir?
SELECT rating, COUNT(*) FROM film
GROUP BY rating
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q3) 	customer tablosunda en çok alışveriş yapan müşterinin adı nedir?
SELECT first_name, last_name, SUM(amount) AS total_amount_of_spending FROM payment AS p
INNER JOIN customer AS c ON p.customer_id = c.customer_id
GROUP BY first_name, last_name, p.customer_id
ORDER BY SUM(amount) DESC
LIMIT 1;


-- Q4) 	category tablosundan kategori isimlerini ve kategori başına düşen film sayılarını sıralayınız.
SELECT cat.name, COUNT(*) FROM category AS cat
INNER JOIN film_category AS fc ON fc.category_id = cat.category_id
GROUP BY fc.category_id, cat.name
/* 
 Alternative Solution
	SELECT cat.name, COUNT(*) FROM category AS cat
	INNER JOIN film_category AS fc ON fc.category_id = cat.category_id
	INNER JOIN film AS f ON f.film_id = fc.film_id
	GROUP BY cat.name
*/


-- Q5) 	film tablosunda isminde en az 4 adet 'e' veya 'E' karakteri bulunan kaç tane film vardır?
SELECT COUNT(*) FROM film
WHERE title ILIKE '%e%e%e%e%';
