

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
WITH dm1 AS (
    SELECT piz.name FROM person_visits pv
    JOIN pizzeria piz on piz.id = pv.pizzeria_id
    JOIN person p on p.id = pv.person_id
    WHERE p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08'
),
dm2 AS (
    SELECT name FROM menu
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    WHERE price < 800
)
(SELECT * FROM dm1
    INTERSECT ALL (SELECT * FROM dm2))