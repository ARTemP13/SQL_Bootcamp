

INSERT INTO person_discounts
    SELECT ROW_NUMBER() OVER () AS id, person_id, m.pizzeria_id,
        CASE
            WHEN count(*) = 1 THEN 10.5
            WHEN count(*) = 2 THEN 22
            ELSE 30
        END AS discount
            FROM person_order po JOIN menu m ON po.menu_id = m.id
    GROUP BY person_id, pizzeria_id