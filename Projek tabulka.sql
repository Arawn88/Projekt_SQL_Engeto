-- t_Pavel_Konir_project_SQL_primary_final 
-- (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky)


CREATE OR REPLACE VIEW v_czechia_payroll AS
	SELECT
		AVG(czpayroll.value) AS Salaries,
		czpayroll.industry_branch_code,
		cpibranch.name AS Industry_type,
		czpayroll.payroll_year AS Year_Salary
	FROM czechia_payroll AS czpayroll
	LEFT JOIN czechia_payroll_industry_branch AS cpibranch
		ON czpayroll.industry_branch_code = cpibranch.code
	WHERE czpayroll.value_type_code = 5958
	GROUP BY czpayroll.industry_branch_code, czpayroll.payroll_year
	ORDER BY czpayroll.payroll_year, czpayroll.industry_branch_code;

CREATE OR REPLACE VIEW v_czechia_prices AS
	SELECT 
		AVG(czprice.value) AS Price_of_product,
		czprice.category_code,
		czpricecat.name AS Product_name,
		YEAR(czprice.date_from) AS year_price
	FROM czechia_price AS czprice
	JOIN czechia_price_category AS czpricecat
		ON czprice.category_code = czpricecat.code 
	WHERE czprice.region_code IS NULL 
	GROUP BY czprice.category_code, 
		YEAR(czprice.date_from);

SELECT 
	AVG(czprice.value) AS value,
	czprice.category_code,
	YEAR(czprice.date_from) AS price_year
FROM czechia_price AS czprice
WHERE czprice.region_code IS NULL 
GROUP BY czprice.category_code, 
	YEAR(czprice.date_from);

CREATE OR REPLACE TABLE t_pavel_konir_project_SQL_primary_final AS
	SELECT *
	FROM v_czechia_payroll 
	JOIN v_czechia_prices
		ON v_czechia_payroll.year_salary = v_czechia_prices.year_price;

-- kontrola
	
SELECT *
FROM v_czechia_payroll;

SELECT *
FROM v_czechia_prices;

SELECT *
FROM t_pavel_konir_project_SQL_primary_final;