-- sqlfluff:dialect:tsql
select
    companyname,
    contactname,
    customerid,
    [sum],
    (select count(*) from [Orders]) as total_orders,
    (select count(*) from [Order Details]) as total_order_details
from (
    select
        c.companyname,
        c.contactname,
        c.customerid,
        sum(od.quantity * od.unitprice) as [sum],
        row_number() over (order by sum(od.quantity * od.unitprice) desc) as [row_number]
    from [Order Details] as od
    inner join orders as o on od.orderid = o.orderid
    inner join customers as c on o.customerid = c.customerid
    group by c.companyname, c.contactname, c.contacttitle, c.customerid
) as s
where row_number between 1 and 3
order by [sum] desc;
