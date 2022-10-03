with source as (
    select            id  
                    , tsevent_id
                    , country  
                    , distance_from_source
                    , water_ht  
                    , horizontal_inundation
    from            {{ source('noaa_tsunami', 'historical_runups') }}
)
select * from source