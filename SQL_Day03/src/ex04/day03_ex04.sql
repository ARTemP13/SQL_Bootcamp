

WITH ps1 AS (
    SELECT piz.name AS name FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria piz ON m.pizzeria_id = piz.id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'male'
),
ps2 AS (
    SELECT piz.name AS name FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria piz ON m.pizzeria_id = piz.id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'female'
),
ps3 AS (
    SELECT name, COUNT(name) AS count FROM ps1
    GROUP BY name
),
ps4 AS (
    SELECT name, COUNT(name) AS count FROM ps2
    GROUP BY name
),
ps5 AS (
    SELECT name FROM ps4
    UNION SELECT name FROM ps3
),
ps6 AS (
    SELECT name FROM ps4
    INTERSECT SELECT name FROM ps3
)

SELECT name AS pizzeria_name FROM ps5
EXCEPT SELECT name FROM ps6
ORDER BY 1

