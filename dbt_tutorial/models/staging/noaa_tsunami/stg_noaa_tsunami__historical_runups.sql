with source as (
    {{ source('noaa_tsunami', 'historical_runups') }}
)
select * from source