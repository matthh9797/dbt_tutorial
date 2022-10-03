with source as (
    select        id
                , timestamp
                , country
                , {{ fillnull_0('total_deaths') }}  as total_deaths
                , maximum_water_height
                , latitude
                , longitude
                , event_validity
                , year
                , month
                , day
    from        {{ source('noaa_tsunami', 'historical_source_event') }}
)
select * from source