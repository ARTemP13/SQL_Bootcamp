
WITH pizza_pizzeria_query AS (
    SELECT menu.id, pizza_name, name FROM menu JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
),
name_order_query AS (
    SELECT name, menu_id FROM person_order JOIN person ON person_order.person_id = person.id
    WHERE name = 'Denis' OR name = 'Anna'
)

SELECT ppq.pizza_name, ppq.name AS pizzeria_name FROM pizza_pizzeria_query AS ppq JOIN name_order_query AS noq
ON noq.menu_id = ppq.id
ORDER BY ppq.pizza_name, ppq.name;