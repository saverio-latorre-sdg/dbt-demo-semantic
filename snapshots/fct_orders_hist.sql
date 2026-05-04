{% snapshot fct_orders_snapshot  %}

{{
    config(
      unique_key='order_item_key',
      strategy='timestamp',
      updated_at = 'variation_date'
    )
}}

SELECT *
FROM {{ ref('fct_orders') }}

{% endsnapshot %}