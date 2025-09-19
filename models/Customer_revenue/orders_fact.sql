{{ config(materialized="table") }}

select
    o.orderid,
    o.orderdate,
    o.customerid,
    o.employeeid,
    o.storeid,
    o.statuscd,
    o.statusdesc,
    count(distinct o.orderid) as ordercount,
    sum(oi.totalprice) as revenue,
from {{ ref("orders_stg") }} o
join {{ ref("orderitems_stg") }} oi on o.orderid = oi.orderid

group by 1, 2, 3, 4, 5, 6, 7
