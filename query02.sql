/*
    What is the percent change in trips in Q3 2022 as compared to Q3 2021?

    Using only the tables from Q3 2021 and Q3 2022 (i.e. not directly using the
    number calculated in the previous question), find the percent change in the
    number of trips in Q3 2022 as compared to 2021. Round your answer to two
    decimal places and name the resulting field `perc_change`.

    Remember you can do calculations in the select clause.
*/

-- Enter your SQL query here
WITH t21 AS (
    SELECT COUNT(*) AS trips
    FROM indego.trips_2021_q3
),

t22 AS (
    SELECT COUNT(*) AS trips
    FROM indego.trips_2022_q3
)

-- Use * 1.0 to convert to float to keep decimal places
-- Round to 2 dp for readability
-- Convert to text and concatenate a '%'
SELECT ROUND((((t22.trips - t21.trips) / (t21.trips * 1.0)) * 100), 2)::text || '%' AS perc_change
FROM t21
CROSS JOIN t22;

/*
    If you want to get fancier here, you can cast the result to a string and
    concatenate a '%' to the end. For example:

        (10 + 3.2)::text || '%' AS perc_change

    This uses the type casting (number to string) and string concatenation
    operator (`||`, double pipes) that's essentially a `+` for strings.
*/
