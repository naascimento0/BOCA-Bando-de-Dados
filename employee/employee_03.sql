SELECT CEIL(AVG(salary) - AVG(CAST(REPLACE(salary, '0', '') AS DECIMAL))) AS QTDE_ERRO FROM Employee;
