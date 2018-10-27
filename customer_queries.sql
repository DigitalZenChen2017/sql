select * from Customer
	where state = 'CA'
    order by name DESC;
    
    select Name, City, State, Sales, Active as 'Is Active?' 
		from Customer
		where state = 'CA'
		order by name DESC;

select * from Customer
	where state = 'CA' 
		and city = 'Fresno'
    order by name DESC;