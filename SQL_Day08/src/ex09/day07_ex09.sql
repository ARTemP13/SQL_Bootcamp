

SELECT person.address, ROUND( (MAX(age) - (MIN(age::numeric)/MAX(age::numeric))), 2) AS formula, ROUND(AVG(age), 2) AS average,
       CASE
           WHEN ROUND( (MAX(age) - (MIN(age::numeric)/MAX(age::numeric))), 2) > AVG(age) THEN TRUE
           ELSE FALSE
       END
       FROM person
GROUP BY person.address
ORDER BY address