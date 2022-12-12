# How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT title, COUNT(inventory_id) AS copies
FROM film
JOIN inventory
USING (film_id)
WHERE title = 'Hunchback Impossible'
GROUP BY title;
# List all films whose length is longer than the average of all the films.
select category.name, avg(length)
from film join film_category using (film_id) join category using (category_id)
group by category.name
having avg(length) > (select avg(length) from film)
order by avg(length) desc;

# Use subqueries to display all actors who appear in the film Alone Trip.

SELECT last_name, first_name
FROM actor
WHERE actor_id in
	(SELECT actor_id FROM film_actor
	WHERE film_id in 
		(SELECT film_id FROM film
		WHERE title = "Alone Trip"));
# Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

SELECT title, category
FROM film_list
WHERE category = 'Family';
# Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT country, last_name, first_name, email
FROM country c
LEFT JOIN customer cu
ON c.country_id = cu.customer_id
WHERE country = 'Canada';
# Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select concat(a.FIRST_NAME,' ', a.LAST_NAME) as Full_name
from ACTOR a
left join FILM_ACTOR fa on a.ACTOR_ID = fa.ACTOR_ID
group by a.ACTOR_ID, a.FIRST_NAME, a.LAST_NAME
order by count(*) desc
limit 1;