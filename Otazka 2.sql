-- 2.Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

/*
 * Za průměrné roční mzdy napříč odvětvími v roce 2006 bylo možné pořídit 1191 kusů chleba a 1331 litrů mléka. 
 * Za průměrné roční mzdy napříč odvětvími v roce 2018 bylo možné pořídit 1300 kusů chleba a 1590 litrů mléka.
 */

SELECT 
	Salaries,
	Year_Salary,
	Price_of_product,
	Product_name,
	FLOOR(Salaries / Price_of_product) AS amount_purchaseable 
FROM t_pavel_konir_project_SQL_primary_final
WHERE Year_Salary IN (2006, 2018)
	AND (Product_name LIKE '%mléko%' OR Product_name LIKE '%chléb%')
	AND industry_branch_code IS NULL
ORDER BY amount_purchaseable;

-- Porovnání pro jednotlivá odvětví.

SELECT 
	Salaries,
	Year_Salary,
	Industry_type,
	Price_of_product,
	Product_name,
	FLOOR(Salaries / Price_of_product) AS amount_purchaseable 
FROM t_pavel_konir_project_SQL_primary_final
WHERE Year_Salary IN (2006, 2018)
	AND (Product_name LIKE '%mléko%' OR Product_name LIKE '%chléb%')
ORDER BY Industry_type;