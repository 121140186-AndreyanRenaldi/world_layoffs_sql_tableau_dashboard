USE world_layoffs;
SELECT * FROM clean_data;

-- Tahun dengan PHK tertinggi
SELECT 
	YEAR(date) as `year`,
    SUM(total_laid_off) AS total_laid_off
FROM clean_data
GROUP BY `year`
ORDER BY `year`;
	
-- Bulan dengan PHK tertinggi
SELECT 
	YEAR(date) as `year`,
	MONTH(date) as `month`,
    SUM(total_laid_off) AS total_laid_off
FROM clean_data
GROUP BY `year`, `month`
ORDER BY `year`, `month`;

-- other sintax
SELECT
    DATE_FORMAT(date, '%M, %Y') AS month_year,
    SUM(total_laid_off) AS total_laid_off
FROM clean_data
GROUP BY DATE_FORMAT(date, '%M, %Y')
ORDER BY MIN(date);

-- Akumulasi PHK bertambah dari waktu ke waktu
WITH month_layoffs AS
(
	SELECT 
		DATE_FORMAT(`date`, "%Y-%m") AS month_year,
		SUM(total_laid_off) AS total_laid_off
	FROM clean_data
	GROUP BY month_year
) 
SELECT 
	month_year,
    total_laid_off,
    SUM(total_laid_off) OVER(ORDER BY month_year) AS rolling_total
FROM month_layoffs;

-- MOVING AVERAGE 3 BULAN
WITH moving_layoffs AS
(
    SELECT
		DATE_FORMAT(`date`, '%Y-%m') AS month_year,
		SUM(total_laid_off) AS total_laid_off
	FROM clean_data
	GROUP BY month_year
)
SELECT 
	month_year,
    total_laid_off,
    ROUND(
		AVG(total_laid_off) OVER(
		ORDER BY month_year
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 
	2) moving_avg_3
FROM moving_layoffs;
    

	


