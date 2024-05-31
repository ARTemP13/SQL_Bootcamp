SELECT order_date, person.name || ' (age:' || age::varchar || ')' AS person_information FROM person_order AS po NATURAL JOIN 
(SELECT name, age, id AS person_id FROM person) AS person
ORDER BY order_date, person_information