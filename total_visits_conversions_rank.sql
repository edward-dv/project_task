WITH prep AS (
SELECT  
  country
  , sum(visits) AS sum_visits
  , sum(conversions) AS sum_conversions
FROM `sandbox-edeveer.stripe_project.visits_conversions` 
GROUP BY 1
ORDER BY 1
)
SELECT 
  prep.*
  , RANK() OVER (ORDER BY (sum_visits) DESC) AS visits_rank
  , RANK() OVER (ORDER BY (sum_conversions) DESC) AS conversions_rank
FROM prep
ORDER BY 4
