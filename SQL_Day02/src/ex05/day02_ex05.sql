
WITH person_query AS (
    SELECT name FROM person
    WHERE gender = 'female' AND age > 25
)
SELECT * FROM person_query
ORDER BY name;