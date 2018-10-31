-- Aliasing tables in a SELECT statement and using the JOIN statement 
select o.customerID, c.name as 'cust. name', o.date,  o.total 
	from sqlbootcamp_mod4.orders o
	join sqlbootcamp_mod4.customer c
	on o.customerID = c.id;
    
-- Older Style JOIN using WHERE statement
select o.customerID, c.name as 'cust. name', o.date, o.total
	from sqlbootcamp_mod4.customer c, sqlbootcamp_mod4.orders o
    where o.total > 800;
                
-- Sub-select/query (nested SELECT inside a SELECT statement), using Order.name --
select o.customerID, c.name as 'cust. name', o.date, o.total
	from sqlbootcamp_mod4.customer c, sqlbootcamp_mod4.orders o
	where o.total > (
		select avg(Total) as 'AverageTotal'
		from orders
            )
		order by name;
        
-- Using the IN statement to include multiple records --
select * 
	from customer
	where id in (1, 2, 3);
            
-- Parameterized Queries
set @startDate = '2017-07-01'; 
set @endDate = '2017-07-20';

select o.id, o.date, c.name, o.total
	from sqlbootcamp_mod4.orders o
		join sqlbootcamp_mod4.customer c
			on o.customerID = c.id
	where o.date >= @startDate
	and o.date <= @endDate;
			
            
            
            