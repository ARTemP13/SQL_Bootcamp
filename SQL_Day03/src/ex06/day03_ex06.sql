
WITH ps1 AS (
    SELECT p.id, pizza_name, p.name, price FROM menu
    JOIN pizzeria p on menu.pizzeria_id = p.id
),
ps2 AS (
    SELECT p.id, pizza_name, p.name, price FROM menu
    JOIN pizzeria p on menu.pizzeria_id = p.id
)


SELECT ps1.pizza_name AS pizza_name, ps1.name AS pizzeria_name_1, ps2.name AS pizzeria_name_2, ps1.price AS price FROM ps1
CROSS JOIN ps2
WHERE ps1.price = ps2.price AND ps1.pizza_name = ps2.pizza_name AND ps1.id > ps2.id
ORDER BY pizza_name