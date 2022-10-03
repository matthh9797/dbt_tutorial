with aggregated as (
    select        tsevent_id 
                , avg(distance_from_source)     as runup_avg_distance_from_source
                , avg(water_ht)                 as runup_avg_water_ht
                , avg(horizontal_inundation)    as runup_avg_horizontal_inundation
                , count(*)                      as runup_number_events
    from        {{ ref('int_historical_runups_fill_nulls') }}
    group by    tsevent_id
)
select * from aggregated