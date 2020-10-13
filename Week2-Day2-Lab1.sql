
use sakila;

#How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from sakila.actor;

#In how many different languages where the films originally produced?
select count(distinct(language_id)) from sakila.language;

#How many movies were not originally filmed in English?
select count(language_id) from sakila.film
where language_id <> 1;

#Get 10 the longest movies from 2006.
select length,title from sakila.film
where release_year="2006"
order by length desc
LIMIT 10;

#How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(convert(return_date,datetime)),min(convert(rental_date,datetime))) from sakila.rental;

#Show rental info with additional columns month and weekday. Get 20.
select rental_id, date_format(convert(rental_date,datetime),"%M") as month_rental, date_format(convert(rental_date,datetime),"%w") as weekday_rental, date_format(convert(return_date,datetime),"%M") as month_return ,date_format(convert(return_date,datetime),"%w") as weekday_return,
(case
when date_format(convert(rental_date,datetime),"%w")=0 or date_format(convert(rental_date,datetime),"%w")=6 then "weekend"
else "weekday"
end) as day_rental,
(case
when date_format(convert(return_date,datetime),"%w")=0 or date_format(convert(return_date,datetime),"%w")=6 then "weekend"
else "weekday"
end) as day_return
from sakila.rental;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.


#How many rentals were in the last month of activity?
select  rental_id, date_format(convert(rental_date,datetime),"%Y") as rentals from sakila.rental
order by rentals desc;
select max(rental_date) from sakila.rental;
select count(rental_id) from sakila.rental
where date_format(convert(rental_date,datetime),"%m,%y")="02,06";

