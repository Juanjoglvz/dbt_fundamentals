
with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}
),

payment_by_order as (
    select
        order_id,
        sum(amount) as amount

    from payments
    group by order_id

),

fct_orders as (

    select 
        ord.order_id,
        ord.customer_id,
        pay.amount
    from
        orders ord left join payment_by_order pay using (order_id)

)

select * from fct_orders

