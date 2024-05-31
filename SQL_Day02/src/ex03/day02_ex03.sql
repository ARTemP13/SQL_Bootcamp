WITH cte_query AS (
SELECT date_column::DATE AS missing_date
FROM generate_series(
    '2022-01-01'::DATE,
    '2022-01-10'::DATE,
    '1 day'::INTERVAL
    ) AS date(date_column)
)
, cte_query1 AS (
    SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2
)

SELECT missing_date FROM cte_query LEFT JOIN cte_query1 AS pv
    ON pv.visit_date = cte_query.missing_date
    WHERE visit_date IS NULL
ORDER BY cte_query.missing_date
