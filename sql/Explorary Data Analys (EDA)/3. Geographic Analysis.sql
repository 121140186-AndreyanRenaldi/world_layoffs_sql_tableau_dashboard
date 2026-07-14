USE world_layoffs;
SELECT * FROM clean_data;

-- 1. Negara dengan PHK tertinggi
SELECT
	country,
    SUM(total_laid_off) AS total_laid_off
FROM clean_data
GROUP BY country
ORDER BY total_laid_off DESC
LIMIT 5;

-- 2. Kota  dengan PHK tertinggi
SELECT
	location,
    SUM(total_laid_off) AS total_laid_off
FROM clean_data
GROUP BY location
ORDER BY total_laid_off DESC
LIMIT 5;
	

-- 