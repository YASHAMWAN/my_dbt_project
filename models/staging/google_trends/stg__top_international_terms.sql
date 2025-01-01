SELECT * FROM(
SELECT
week,
term,
score,
max(refresh_date) over (partition by week) as max_refresh,
refresh_date,
rank
FROM `bigquery-public-data.google_trends.top_terms` 
WHERE 
refresh_date >= "2024-01-01" 
and rank <= 10
and dma_id = 602
order by week desc, rank
)
WHERE 
refresh_date = max_refresh

