-- ❓ Problem
-- Find cities that start with a vowel.

-- ✅ MySQL Solution
SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[aeiou]';
