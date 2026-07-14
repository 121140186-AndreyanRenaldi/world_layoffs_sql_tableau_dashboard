USE world_layoffs;
SELECT * FROM clean_data;

-- General Description
SELECT 	COUNT(DISTINCT(company)) total_company, 
		COUNT(DISTINCT(country)) total_country, 
        COUNT(DISTINCT(industry)) total_industry, 
        SUM(total_laid_off) total_laid_off
FROM clean_data;

-- Company Analysis
-- 1. Top 5 Perusahaan yang paling banyak melakukan PHK
SELECT 
	company,
    SUM(total_laid_off) AS total_laid_off
FROM clean_data
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 5;

-- 2. Jumlah Perusahaan yang bangkrut
SELECT 
	COUNT(DISTINCT(company)) AS total_company_bankruptcy
FROM clean_data
WHERE percentage_laid_off = 1;
	
-- 3. Perusahaan yang paling sering melakukan PHK
SELECT 
	company,
    COUNT(total_laid_off) AS total_laid_off
FROM clean_data
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 5;
	