
CREATE VIEW v_symmetric_union AS
WITH jan2 AS (
    SELECT person_id, visit_date FROM person_visits
    WHERE visit_date = '2022-01-02'
),
jan6 AS (
    SELECT person_id, visit_date FROM person_visits
    WHERE visit_date = '2022-01-06'
),
part1 AS (
    SELECT jan2.person_id FROM jan2
    EXCEPT ALL (SELECT jan6.person_id FROM jan6)
),
part2 AS (
    SELECT jan6.person_id FROM jan6
    EXCEPT ALL (SELECT jan2.person_id FROM jan2)
)


(SELECT * FROM part1
UNION ALL (SELECT * FROM part2)
ORDER BY 1)