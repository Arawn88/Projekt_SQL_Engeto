-- 1.Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

/*
 * V letech 2009,2010,2011,2013,2014,2016 byl zazamenán meziroční pokles mezd.
 * Největší propad ve mzdách vidíme v roce 2013, kde bylo meziročním poklesem mezd postihnuto celkem 11 z 19 měřených odvětví. 
 */

WITH salaries AS (
	SELECT DISTINCT 
		Year_Salary,
		industry_branch_code,
		Industry_type,
		Salaries
	FROM t_pavel_konir_project_SQL_primary_final
	WHERE industry_branch_code IS NOT NULL
	)
SELECT *,
	LAG(Salaries) OVER (PARTITION BY industry_branch_code ORDER BY Year_Salary) AS salary_prev,
	ROUND((Salaries - LAG(Salaries) OVER (PARTITION BY industry_branch_code ORDER BY Year_Salary)) * 100 / LAG(Salaries) OVER (PARTITION BY industry_branch_code ORDER BY Year_Salary), 2) AS salary_growth
FROM salaries
ORDER BY salary_growth;