


SELECT   department_id,
         MIN(salary) KEEP (DENSE_RANK FIRST ORDER BY commission_pct) "Worst",
         MAX(salary) KEEP (DENSE_RANK LAST ORDER BY commission_pct) "Best"
FROM     employees
GROUP BY department_id;
   
SELECT   last_name, department_id, salary,
         MIN(salary) KEEP (DENSE_RANK FIRST ORDER BY commission_pct)
            OVER (PARTITION BY department_id) "Worst",
         MAX(salary) KEEP (DENSE_RANK LAST ORDER BY commission_pct)
            OVER (PARTITION BY department_id) "Best"
FROM     employees
ORDER BY department_id, salary;   
    
    