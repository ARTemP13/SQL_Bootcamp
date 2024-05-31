

CREATE VIEW v_price_with_discount AS
    (SELECT p.name as name, m.pizza_name as pizza_name, m.price as price, ROUND(m.price*0.9, 0) as discount_price
    FROM person_order as po
    JOIN menu m on po.menu_id = m.id
    JOIN person p on p.id = po.person_id
    ORDER BY name, pizza_name)

