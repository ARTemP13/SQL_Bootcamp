
WITH ps1 AS (
    SELECT visit_date, pizzeria_id FROM person_visits
    JOIN person p on person_visits.person_id = p.id
    JOIN pizzeria p3 on person_visits.pizzeria_id = p3.id
    WHERE p.name = 'Kate'
),
ps2 AS (
    SELECT p2.id, pizza_name, price, p2.name FROM menu
    JOIN pizzeria p2 on menu.pizzeria_id = p2.id
    WHERE price BETWEEN 800 AND 1000
)


SELECT pizza_name, price, name AS pizzeria_name, visit_date FROM ps2
JOIN ps1 ON ps2.id = ps1.pizzeria_id
ORDER BY pizza_name, price, pizzeria_name;

-- SELECT * FROM ps2
