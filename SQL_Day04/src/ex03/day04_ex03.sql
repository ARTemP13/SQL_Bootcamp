

SELECT vgd.generated_date AS missing_date FROM v_generated_dates AS vgd
WHERE vgd.generated_date NOT IN (SELECT visit_date FROM person_visits)
ORDER BY 1;