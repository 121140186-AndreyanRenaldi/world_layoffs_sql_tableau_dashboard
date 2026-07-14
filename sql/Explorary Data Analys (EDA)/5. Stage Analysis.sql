USE world_layoffs;
SELECT * FROM clean_data;

SELECT 
	stage,
    SUM(total_laid_off) total_laid_off
FROM clean_data
GROUP BY stage
ORDER BY total_laid_off DESC;


