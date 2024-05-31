WITH col1 AS (
    SELECT t1
    FROM generate_series(((SELECT MAX(id)FROM person_order)+1), (SELECT MAX(id)FROM person_order)+(SELECT DISTINCT COUNT(name) FROM person), 1) t1

),
col2 AS (
    SELECT t1 FROM generate_series(1, (SELECT DISTINCT COUNT(name) FROM person), 1) t1
),
union12 AS (
    SELECT col1.t1 as id, col2.t1 as person_id FROM col1
    FULL JOIN col2 ON (col1.t1-(SELECT MAX(id) FROM person_order)) = col2.t1
)


INSERT INTO person_order (id, person_id, menu_id, order_date)
(SELECT union12.id as id, union12.person_id as person_id, subq1.id as menu_id, subq2.generate_series as order_date FROM union12
CROSS JOIN (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS subq1
CROSS JOIN (SELECT * FROM generate_series('2022-02-25', '2022-02-25', interval '1 day')) AS subq2)
