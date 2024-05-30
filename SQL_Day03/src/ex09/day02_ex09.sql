 WITH ppv AS (
     SELECT menu_id, name FROM person_order
     JOIN person ON person.id = person_order.person_id
     WHERE gender = 'female'
     ORDER BY name
 ),
pps AS (
    SELECT menu.id, pizza_name FROM menu
    WHERE pizza_name = 'cheese pizza' OR pizza_name = 'pepperoni pizza'
),
res AS (
    SELECT name, pizza_name FROM ppv JOIN pps ON ppv.menu_id = pps.id
)
 SELECT name AS name FROM res
WHERE pizza_name = 'cheese pizza' AND EXISTS(SELECT * FROM ppv JOIN pps ON ppv.menu_id = pps.id
    WHERE res.name = ppv.name AND pizza_name = 'pepperoni pizza'
    )
ORDER BY name