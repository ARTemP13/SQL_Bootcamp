SELECT per.id, per.name, per.age, per.gender, per.address, piz.id, piz.name, piz.rating
FROM person AS per CROSS JOIN pizzeria AS piz
ORDER BY per.id, piz.id;