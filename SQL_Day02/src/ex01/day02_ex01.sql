
SELECT date.date_column::DATE AS missing_date
FROM generate_series(
    '2022-01-01'::DATE,
    '2022-01-10'::DATE,
    '1 day'::INTERVAL
) AS date(date_column) LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS pv
ON pv.visit_date = date.date_column
WHERE visit_date IS NULL
ORDER BY date.date_column;
