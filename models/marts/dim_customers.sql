with customers as (

    select * from {{ ref('int_customers') }}

),

customers_with_random_dates as (
    select
        *,
        dateadd(day, -uniform(365, 1460, random()), current_date()) as valid_from,
        uniform(30, 500, random()) as durata_giorni,
        uniform(1, 100, random()) as probabilita_attivo
        
    from customers
),

final as (
    select
        customer_key,
        customer_name,
        customer_phone,
        customer_account_balance,
        market_segment,
        customer_nation,
        customer_region,
        valid_from,
        iff(
            probabilita_attivo <= 20, 
            null, 
            dateadd(day, durata_giorni, valid_from)
        ) as valid_to

    from customers_with_random_dates
)

select * from final
