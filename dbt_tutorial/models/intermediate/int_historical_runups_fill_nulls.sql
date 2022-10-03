with aggregated as (
    select        tsevent_id 
                , {{ fillnull_0('distance_from_source') }}      as distance_from_source  
                , {{ fillnull_0('water_ht') }}                  as water_ht  
                , {{ fillnull_0('horizontal_inundation') }}     as horizontal_inundation     
    from        {{ ref('stg_noaa_tsunami__historical_runups') }}
)
select * from aggregated