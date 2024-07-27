SELECT  
  browser
  , sum(visits) AS sum_visits
FROM `sandbox-edeveer.stripe_project.visits_conversions` 
GROUP BY 1
ORDER BY 1
