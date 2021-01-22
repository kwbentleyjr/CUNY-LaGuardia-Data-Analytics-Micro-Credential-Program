SELECT * FROM film;
SELECT * FROM film_actor;

-- 1.	Join the film to the film_actor table.

SELECT * FROM film_actor INNER JOIN film ON film_actor.film_id=film.film_id;

-- 2.	Join the actor table to the film_actor table. 

SELECT * FROM film_actor INNER JOIN actor ON film_actor.actor_id=actor.actor_id;

-- 3.	Try to join the actor, film_actor, and film table together (3 joins!)

SELECT * 
FROM film_actor 
INNER JOIN actor ON film_actor.actor_id=actor.actor_id
INNER JOIN film ON film_actor.film_id=film.film_id;