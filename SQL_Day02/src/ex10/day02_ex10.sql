WITH na AS (
    SELECT person.id, name, address FROM person
),
na1 AS (
    SELECT person.id, name, address FROM person
)

SELECT na.name AS person_name1, na1.name AS person_name2, na.address AS common_address FROM na CROSS JOIN na1
WHERE na.address = na1.address AND na.id > na1.id
ORDER BY na.name, na1.name, na.address