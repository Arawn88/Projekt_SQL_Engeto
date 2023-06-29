-- 5.Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

/*
 * Výška HDP má vliv na změny ve mzdách a cenách potravin.
 * HDP vzrostlo o více než 4% v letech 2007, 2015, 2017. HDP kleslo o více než 4% v roce 2009. 
 * V roce 2007 se projevil výrazný růst HDP i v růstu mezd a cen, které potom výrazně narostly i v roce 2008.
 * Vyššímu nárůstu HDP v letech 2015, 2017 a 2018 odpovídá i růst mezd v celém období 2015-2018. Ceny však výrazně vzrostly z tohoto období pouze v roce 2017.
 * V roce 2009 spolu s HDP významně poklesly i ceny.
 */

SELECT 
	`year`,
	GDP,
	LAG(GDP) OVER (ORDER BY `year`) AS previous_GDP,
	ROUND((GDP - (LAG(GDP) OVER (ORDER BY `year`))) * 100 / (LAG(GDP) OVER (ORDER BY `year`)), 2) AS GDP_growth
FROM t_pavel_konir_project_sql_secondary_final
WHERE country = 'Czech Republic';