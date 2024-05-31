
WITH ps1 AS (
    SELECT id FROM menu
    WHERE id NOT IN(SELECT menu_id FROM person_order)
    ORDER BY id
)

SELECT pizza_name, price, name AS pizzeria_name FROM menu
JOIN pizzeria p on menu.pizzeria_id = p.id
JOIN ps1 ON ps1.id = menu.id
ORDER BY 1,2
