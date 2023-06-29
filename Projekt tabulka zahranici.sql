-- Vytvoření tabulky t_pavel_konir_project_SQL_secondary_final AS

CREATE OR REPLACE TABLE t_pavel_konir_project_SQL_secondary_final AS
	SELECT 
		economies.country,
		economies.`year`,
		economies.GDP,
		economies.population,
		economies.gini
	FROM economies 
	JOIN countries 
		ON economies.country = countries.country 
	WHERE countries.continent = 'Europe'
		AND economies.`year` BETWEEN 2006 AND 2018
	ORDER BY economies.country, economies.`year`;