-- 3.Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

/*
 * Průměrně nejpomaleji za celé období měření tedy 2006-2018 zdražil cukr krystalový (dokonce meziročně průměrně zlevňoval o 1,92%).
 * Nejméně zdražila rajská jablka mezi lety 2006-2007 (zlevnění o 30,28%).
 */

SELECT 
	y.*,
	ROUND((y.Price_of_product - y.previous_price) * 100 / y.previous_price, 2) AS price_result
FROM (
	SELECT 
		x.*,
		ROUND(LAG(Price_of_product) OVER (PARTITION BY category_code ORDER BY year_price), 3) AS previous_price
	FROM (
		SELECT DISTINCT 
			year_price,
			Price_of_product,
			category_code,
			Product_name
		FROM t_pavel_konir_project_SQL_primary_final
		) x
	) y
WHERE y.previous_price IS NOT NULL
ORDER BY price_result;