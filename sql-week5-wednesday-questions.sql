-- 1. List all customers who live in Texas ( use JOINs)
select first_name, last_name, district
from customer
inner join address
on customer.address_id = address.address_id
where district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer 
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city table)
select first_name, last_name, city
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
where city = 'Nepal';

-- 5. Which staff member had the most transactions?
select first_name, last_name, COUNT(payment.staff_id)
from staff
full join payment
on staff.staff_id = payment.staff_id
group by first_name, last_name
order by COUNT(payment.staff_id) desc;

-- 6. How many movies of each rating are there?
select rating, count(film_id)
from film
group by rating 
order by count(film_id) desc;

--7. Show all customers who have made a single payment above 6.99 (use Subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment  
	where amount > 6.99
	group by customer_id
	having count(customer_id) = 1
);

-- How many free rentals did our stores give away
select amount, count(payment.rental_id)
from payment
inner join rental
on payment.rental_id = rental.rental_id
where amount = 0.00
group by amount;








