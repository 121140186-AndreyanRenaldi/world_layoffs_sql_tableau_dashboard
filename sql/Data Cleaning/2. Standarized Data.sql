-- USE DATABASE
USE world_layoffs;

-- ---------------- --
-- STANDARIZED DATA --
-- Company Column
SELECT company, TRIM(company) AS company2
FROM layoffs_staging2;

SET SQL_SAFE_UPDATES = 0;

UPDATE layoffs_staging2
SET company = TRIM(company);

-- Industry Column
SELECT DISTINCT(TRIM(industry)) AS industry2
FROM layoffs_staging2
ORDER BY 1;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = "Crypto"
WHERE industry LIKE 'Crypto%';

-- Country Column
SELECT * FROM layoffs_staging2;

SELECT DISTINCT(country)
FROM layoffs_staging2 
ORDER BY 1;

UPDATE layoffs_staging2
SET country = "United States"
WHERE country LIKE "United Sta%";

-- Date Column
DESC layoffs_staging2;

SELECT `date`,
STR_TO_DATE(`date`, "%m/%d/%Y") AS true_date
FROM layoffs_staging2
;

SELECT `date` FROM layoffs_staging2;
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, "%m/%d/%Y");
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT * FROM layoffs_staging2;

-- state
SELECT DISTINCT(`stage`)
FROM layoffs_staging2 
ORDER BY 1;