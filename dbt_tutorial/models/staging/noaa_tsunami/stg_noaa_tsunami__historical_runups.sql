with source as (
    select * from {{ source('noaa_tsunami', 'historical_runups') }}
)
select * from source