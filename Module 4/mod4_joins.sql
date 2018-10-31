select o.customerID, c.name as 'cust. name', o.date, 
			o.total from orders o
            join customer c
				on o.customerID = c.id
                
                -- Sub-select, using Order.total --
			where o.total > (
				select avg(Total) as 'AverageTotal'
				from orders
            )
            order by total;
                
                
                
            select * 
				from customer
			where id in (1, 2, 3);
            
            
            -- Parameterized Queries
            set @startDate = '2017-03-01';
            set @endDate = '2017-03-15';
            
			select o.id, o.date, c.name, c.total
				from orders o
                join customer c,
					on o.customerID = c.id
				where o.date >= @startDate
					and o.date <= @endDate;
			
            