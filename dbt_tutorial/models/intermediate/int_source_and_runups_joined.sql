with histrical_source_events as (
    select * from {{ ref('int_historical_source_events_filtered') }}
)
, historical_runups as (
    select * from {{ ref('int_historical_runups_aggregated') }}
)
, join_runups_and_source_events as (
    select      s.*, r.* except(tsevent_id)
    from        histrical_source_events s   
    left join   historical_runups r  
    on          s.id = r.tsevent_id
)
select * from join_runups_and_source_events