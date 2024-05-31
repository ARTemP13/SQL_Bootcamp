
WITH ps1 AS (
    SELECT piz.name FROM person_visits pv
    JOIN pizzeria piz ON piz.id = pv.pizzeria_id
    JOIN person p on pv.person_id = p.id
    WHERE p.name = 'Andrey'
),
ps2 AS (
    SELECT piz.name FROM person_order po
    JOIN menu m on po.menu_id = m.id
    JOIN pizzeria piz on piz.id = m.pizzeria_id
    JOIN person p on po.person_id = p.id
    WHERE p.name = 'Andrey'
)

SELECT name AS pizzeria_name FROM ps1
EXCEPT SELECT name FROM ps2
ORDER BY 1