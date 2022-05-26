with payments as (
    
    select
        orderid as order_id,
        (amount / 100) as amount

    from {{ source('jaffle_shop', 'stripe_payments') }}
    where
        status = 'success'
)

select * from payments