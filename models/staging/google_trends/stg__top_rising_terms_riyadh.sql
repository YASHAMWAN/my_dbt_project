SELECT * FROM(
SELECT
country_name,
country_code,
region_name,
week,
refresh_date,
term,
rank,
score,
max(refresh_date) over (partition by week) as max_refresh
FROM
  `bigquery-public-data.google_trends.international_top_rising_terms`
WHERE
  refresh_date >= "2024-01-01"
  AND country_name = "Saudi Arabia"
  AND region_name = "Riyadh Province"
  AND rank<= 10
ORDER BY week desc, rank
)
WHERE refresh_date = max_refresh