-- USE DATABASE
USE world_layoffs;

-- BUILD TABLE STAGING FOR RAW DATA --
CREATE TABLE layoffs_staging AS
SELECT * FROM layoffs;

SELECT * FROM layoffs_staging;

-- -------------------- --
-- CHECK DUPLICATE DATA
SELECT *,
ROW_NUMBER() 
OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

-- BUILD CLEAN TABLE DATA
CREATE TABLE layoffs_staging2 AS
WITH duplicate_data  AS 
(
	SELECT *,
	ROW_NUMBER() 
	OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
	FROM layoffs_staging
)
	SELECT *
    FROM duplicate_data
    WHERE row_num = 1;

SELECT * FROM layoffs_staging2;