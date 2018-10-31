select * from customer;

    
select state, max(creditLimit) as 'MaxLimit' FROM customer
	group by state
    order by MaxLimit desc;
    
-- Use Concat Function to Render creditLimit as currency --
SELECT name, concat('$', format(creditLimit, 2))
	FROM customer; 

