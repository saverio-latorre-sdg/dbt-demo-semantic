with days as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2000-01-01' as date)",
        end_date="dateadd(year, 2, current_date)"
    ) }}
)
 
select cast(date_day as date) as date_day
from days