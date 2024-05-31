

WITH dm1 AS (
    SELECT pizzeria.id, name FROM menu
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    WHERE price < 800
)

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) FROM person_visits)+1,
        (SELECT id FROM person
        WHERE name = 'Dmitriy'),
        (SELECT MAX(dm1.id) FROM dm1
            WHERE (dm1.name NOT IN(SELECT * FROM mv_dmitriy_visits_and_eats))),
        '2022-01-08'
        );

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
