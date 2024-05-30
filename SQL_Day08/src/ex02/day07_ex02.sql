
WITH max_visit_rest AS (
    SELECT pizzeria.name AS name, COUNT(pizzeria_id) AS count, 'visit' AS action_type FROM person_visits
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY count DESC
    LIMIT 3
),
max_order_rest AS (
    SELECT pizzeria.name AS name, COUNT(*) AS count, 'order' AS action_type FROM person_order
        JOIN menu ON person_order.menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY count DESC
    LIMIT 3
)

SELECT * FROM max_order_rest
    UNION SELECT * FROM max_visit_rest
ORDER BY action_type ASC, count DESC;
