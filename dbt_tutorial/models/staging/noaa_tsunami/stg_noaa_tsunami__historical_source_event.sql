with source as (
    {{ source('noaa_tsunami', 'historical_source_event') }}
)
select * from source