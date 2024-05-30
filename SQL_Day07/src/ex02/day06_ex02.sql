

SELECT p.name AS name, m.pizza_name AS pizza_name, m.price AS price, ((100-discount)/100)*m.price AS discount_price, pizzeria.name AS pizzeria
       FROM person_order JOIN menu m on m.id = person_order.menu_id
                         JOIN person p on person_order.person_id = p.id
                         JOIN person_discounts pd on p.id = pd.person_id AND pd.pizzeria_id = m.pizzeria_id
                         JOIN pizzeria on m.pizzeria_id = pizzeria.id
ORDER BY name, pizza_name;