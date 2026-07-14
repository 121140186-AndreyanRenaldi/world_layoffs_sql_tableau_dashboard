USE world_layoffs;
SELECT * FROM clean_data;

-- 1. Top 5 Industri yang paling banyak melakukan PHK
SELECT 
	industry,
    SUM(total_laid_off) as total_laid_off
FROM clean_data
GROUP BY industry
ORDER BY total_laid_off DESC
LIMIT 5;

-- 2. Total PHK per Industri
SELECT 
	industry,
	SUM(total_laid_off) as total_laid_off
FROM clean_data
GROUP BY industry
ORDER BY industry;

-- 3. Industri dengan Bangkrut terbanyak
SELECT
	industry,
    count(percentage_laid_off) as total_bankruptcy -- noted
FROM clean_data
WHERE percentage_laid_off = 1
GROUP BY industry
ORDER BY total_bankruptcy DESC;
