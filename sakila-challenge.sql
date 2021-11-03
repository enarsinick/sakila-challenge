USE sakila;
SHOW TABLES;

SELECT * FROM rental;
SELECT * FROM inventory;
SELECT * FROM category;
SELECT * FROM film;
SELECT * FROM film_category;

# 1. List all actors
SELECT * FROM actor;

# 2. Find the surname of the actor with the forename 'John'.
SELECT last_name FROM actor WHERE first_name='John';

# 3. Find all actors with surname 'Neeson'.
SELECT * FROM actor WHERE last_name='Neeson';

# 4. Find all actors with ID numbers divisible by 10.
SELECT * FROM actor WHERE actor_id % 10 = 0;

# 5. What is the description of the movie with an ID of 100?
SELECT description FROM film WHERE film_id=100;

# 6. Find every R-rated movie.
SELECT * FROM film WHERE rating='R';

# 7. Find every non-R-rated movie.
SELECT * FROM film WHERE rating != 'R';

# 8. Find the ten shortest movies.
SELECT * FROM film ORDER BY length ASC LIMIT 10;

# 9. Find the movies with the longest runtime, without using LIMIT.
SELECT * FROM film ORDER BY length DESC;

# 10. Find all movies that have deleted scenes.
SELECT * FROM film WHERE special_features LIKE 'Deleted Scenes%';

# 11. Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT *, COUNT(last_name) 
FROM actor GROUP BY last_name 
HAVING COUNT(last_name) < 2 
ORDER BY last_name DESC;

# 12. Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name, COUNT(last_name) AS count 
FROM actor GROUP BY last_name 
HAVING COUNT(last_name) > 1 ORDER BY count DESC;

# 13. Which actor has appeared in the most films?
SELECT *, COUNT(actor_id) AS count FROM film_actor GROUP BY actor_id ORDER BY count DESC;

# 14. When is 'Academy Dinosaur' due?
SELECT f.title, r.return_date FROM inventory AS i
JOIN rental AS r ON r.inventory_id=i.inventory_id
JOIN film AS f ON f.film_id=i.film_id
WHERE f.title='Academy Dinosaur'
GROUP BY f.title;

# 15. What is the average runtime of all films?
SELECT AVG(length) AS average_runtime FROM film;

# 16. List the average runtime for every film category.
SELECT fc.category_id, c.name AS category, AVG(f.length) AS average_runtime 
FROM film_category AS fc
JOIN film AS f ON f.film_id=fc.film_id
JOIN category AS c ON c.category_id=fc.category_id
GROUP BY fc.category_id;

# 17. List all movies featuring a robot.
SELECT * FROM film WHERE description LIKE '%Robot%';

# 18. How many movies were released in 2010?
SELECT COUNT(release_year) FROM film WHERE release_year='2010';

# 19. Find the titles of all the horror movies.
SELECT f.title, c.name AS category FROM film_category AS fc
JOIN film AS f ON fc.film_id=f.film_id
JOIN category AS c ON fc.category_id=c.category_id
WHERE c.name='Horror';

# 20. List the full name of the staff member with the ID of 2.
SELECT * FROM staff WHERE staff_id=2;

# 21. List all the movies that Fred Costner has appeared in.
SELECT f.title, a.first_name, a.last_name FROM film_actor AS fa
JOIN film AS f ON fa.film_id=f.film_id
JOIN actor AS a ON fa.actor_id=a.actor_id
WHERE a.last_name='Costner';

# 22. How many distinct countries are there?
SELECT DISTINCT COUNT(country_id) FROM country;

# 23. List the name of every language in reverse-alphabetical order.
SELECT * FROM language ORDER BY name DESC;

# 24. List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT first_name, last_name FROM actor WHERE last_name LIKE '%-son' ORDER BY first_name ASC;

# 25. Which category contains the most films?
SELECT c.name, COUNT(fc.category_id) AS count FROM film_category AS fc
JOIN category AS c ON fc.category_id=c.category_id
GROUP BY fc.category_id
ORDER BY count DESC;









