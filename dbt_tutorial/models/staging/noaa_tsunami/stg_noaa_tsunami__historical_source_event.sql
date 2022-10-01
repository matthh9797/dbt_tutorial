with source as (
    select * from {{ source('noaa_tsunami', 'historical_source_event') }}
)
select * from source