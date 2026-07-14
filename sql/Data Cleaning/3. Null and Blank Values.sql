-- USE DATABASE
USE world_layoffs;

-- -------------------------- --
-- NULL VALUES / BLANK VALUES --
SELECT * FROM layoffs_staging2;

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

SELECT t1.industry, t2.industry
FROM layoffs_staging2 AS t1
JOIN layoffs_staging2 AS t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 AS t1
JOIN layoffs_staging2 AS t2
	ON t1.company = t2.company
    AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

-- CHECK NULL 
SELECT company, location, industry
FROM layoffs_staging2
WHERE industry IS NOT NULL;

SELECT company, location, industry
FROM layoffs_staging2
WHERE industry IS NULL;
-- There's one data is NULL, we can't change the data cause only one data 
-- with similar type and we don't have preference data we can follow 

SELECT company, location, industry
FROM layoffs_staging2
WHERE company LIKE "Bally%" and location = "Providence";

SELECT company, location, industry
FROM layoffs_staging2
WHERE company LIKE "Bally%" and location = "Providence";

-- We can see much data have a null values in total_laid_off and percentage_laid_off.
-- If we look the schema is about layoffs in the world, but if the data is NULL.
-- I think we can delete it, i am not sure 100%, so for the safe reason we can make another table,
-- name of the new table is insyaallah_clean_layoffs.

CREATE TABLE insyaallah_clean_table
LIKE layoffs_staging2;

INSERT INTO insyaallah_clean_table
SELECT * FROM layoffs_staging2;

SELECT * FROM insyaallah_clean_table;

SELECT *
FROM insyaallah_clean_table
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE FROM insyaallah_clean_table
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * FROM insyaallah_clean_table;



