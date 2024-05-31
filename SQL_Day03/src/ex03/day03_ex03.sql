

WITH ps1 AS (
    SELECT piz.name AS name FROM person_visits pv
    JOIN pizzeria piz ON piz.id = pv.pizzeria_id
    JOIN person p ON p.id = pv.person_id
    WHERE gender = 'male'
),
ps2 AS (
    SELECT piz.name AS name, p.gender AS gender FROM person_visits pv
    JOIN pizzeria piz ON piz.id = pv.pizzeria_id
    JOIN person p ON p.id = pv.person_id
    WHERE gender = 'female'
),
ps3 AS (
    SELECT name, COUNT(name) AS count FROM ps1
    GROUP BY name
),
ps4 AS (
    SELECT name, COUNT(name) AS count FROM ps2
    GROUP BY name
)

SELECT ps3.name AS pizzeria_name FROM ps3
JOIN ps4 ON ps3.name = ps4.name
WHERE ps3.count <> ps4.count
ORDER BY pizzeria_name
