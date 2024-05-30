


CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
    RETURNS TABLE (value integer) AS $$
        WITH RECURSIVE cte_fib(a, b) AS (
            SELECT 0 AS a, 1 AS b
            UNION ALL
            SELECT b, a+b FROM cte_fib
                WHERE b<pstop
        )
        SELECT a FROM cte_fib;
    $$ LANGUAGE SQL;

SELECT * FROM fnc_fibonacci(20);
