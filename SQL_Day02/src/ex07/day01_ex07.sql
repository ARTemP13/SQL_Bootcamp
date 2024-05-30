SELECT order_date, person.name || ' (age:' || age::varchar || ')' AS person_information FROM person_order AS po JOIN person ON po.person_id = person.id
ORDER BY order_date, person_information