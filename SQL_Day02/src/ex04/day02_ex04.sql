
WITH menu_query AS (
    SELECT pizza_name, price, pizzeria_id FROM menu
    WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
)
SELECT mq.pizza_name, p.name, mq.price FROM pizzeria AS p JOIN menu_query AS mq ON mq.pizzeria_id = p.id
ORDER BY mq.pizza_name, p.name