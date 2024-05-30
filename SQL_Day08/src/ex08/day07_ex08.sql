

SELECT person.address AS address, pizzeria.name AS name, COUNT(*) AS count FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person ON person_order.person_id = person.id
GROUP BY person.address, pizzeria.name
ORDER BY person.address, name;