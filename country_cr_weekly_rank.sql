WITH 
prep AS (
SELECT  
  week 
  , country
  , sum(visits) AS sum_visits
  , sum(conversions) AS sum_conversions
FROM `sandbox-edeveer.stripe_project.visits_conversions` 
GROUP BY 1, 2
ORDER BY 1, 2
)
SELECT
  week
  , country
  , (sum_conversions/sum_visits) AS conversion_rate
  , RANK() OVER (PARTITION BY week ORDER BY (sum_conversions/sum_visits) DESC) AS conversion_rate_rank
FROM prep
ORDER BY 1, 3 DESC
