with histrical_source_events as (
    select * from {{ ref('stg_noaa_tsunami__historical_source_event') }}
)
, historical_runups as (
    select * from {{ ref('stg_noaa_tsunami__historical_runups') }}
)

, join_runups_and_source_events as (
    select      s.*, r.* except(tsevent_id)
    from        histrical_source_events s   
    left join   historical_runups r  
    on          s.id = r.tsevent_id
)