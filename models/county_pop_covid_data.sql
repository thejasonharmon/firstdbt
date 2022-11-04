{{ config(materialized='table') }}

SELECT 
AREA AS COUNTY,
MAX(POPULATION) as POPULATION,
MAX(CUMULATIVE_CASES) as TOTAL_CASES,
MAX(CUMULATIVE_DEATHS) as TOTAL_DEATHS
FROM COVID19.OPEN_DATA.VW_CASES
GROUP BY COUNTY