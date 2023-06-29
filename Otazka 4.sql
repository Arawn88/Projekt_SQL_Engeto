-- 4.Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

/*
 * Průměrný růst cen všech produktů nebyl nikdy o 10% vyšší než průměrný růst mezd. 
 * Nejvyšší rozdíl byl v roce 2013 o 6,14%.
 */

SELECT *,
	LAG(Salaries) OVER (ORDER BY Year_Salary) AS Previous_salary
FROM (
	SELECT DISTINCT 
		Year_Salary,
		Salaries
	FROM t_pavel_konir_project_SQL_primary_final 
	WHERE industry_branch_code IS NULL
	) x;
	