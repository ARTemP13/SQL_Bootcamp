 WITH ppv AS (
     SELECT menu_id, name FROM person_order
     JOIN person ON person.id = person_order.person_id
     WHERE (address = 'Moscow' OR address = 'Samara') AND gender = 'male'
 )

SELECT name FROM ppv JOIN menu ON menu.id = ppv.menu_id
WHERE menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza'
ORDER BY name DESC