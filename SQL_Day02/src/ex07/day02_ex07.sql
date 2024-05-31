
WITH pizza_pizzeria_query AS (
    SELECT menu.id, name, pizzeria_id FROM menu JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    WHERE price < 800
),
name_order_query AS (
    SELECT p.name, pv.pizzeria_id FROM person_visits AS pv
        JOIN person AS p ON pv.person_id = p.id
    WHERE p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08'
)
SELECT ppq.name FROM pizza_pizzeria_query AS ppq
JOIN name_order_query AS noq ON noq.pizzeria_id = ppq.pizzeria_id


