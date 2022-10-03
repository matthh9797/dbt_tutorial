with histrical_source_events_filtered as (
    select      * from {{ ref('stg_noaa_tsunami__historical_source_event') }}
    where       event_validity = 4
    and         year >= 1800
)
select * from histrical_source_events_filtered