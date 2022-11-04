{{ config(materialized='view') }}


with cte_hospital as (
    SELECT *
    FROM {{ ref('total_hospital_cases_by_county')}}
)

, cte_population as (
    SELECT *
    FROM {{ ref('county_pop_covid_data')}}
)

SELECT
cte_hospital.COUNTY,
POPULATION,
TOTAL_CASES,
TOTAL_DEATHS,
TOTAL_HOSPITALIZED_COVID_CONFIRMED_PATIENTS,
TOTAL_HOSPITALIZED_SUSPECTED_COVID_PATIENTS
FROM cte_hospital
INNER JOIN cte_population on cte_hospital.COUNTY = cte_population.COUNTY