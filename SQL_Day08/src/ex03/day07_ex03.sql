

WITH max_visit_rest AS (
    SELECT pizzeria.name AS name, COUNT(pizzeria_id) AS total_count FROM person_visits
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
),
max_order_rest AS (
    SELECT pizzeria.name AS name, COUNT(*) AS total_count FROM person_order
        JOIN menu ON person_order.menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
),
table1 AS (
    SELECT name, total_count FROM max_order_rest
    UNION ALL SELECT * FROM max_visit_rest
)

SELECT name, SUM(total_count) AS total_count FROM table1
GROUP BY name
ORDER BY total_count DESC, name ASC;

