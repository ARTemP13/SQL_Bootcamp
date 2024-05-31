SELECT pizzeria.name FROM pizzeria 
WHERE pizzeria.name NOT IN(SELECT DISTINCT pizzeria.name FROM pizzeria JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id);

SELECT pizzeria.name AS name FROM pizzeria 
WHERE NOT EXISTS(SELECT * FROM person_visits WHERE person_visits.pizzeria_id = pizzeria.id);

