create database zomatoanalysis;

select * from zomato;
select Year from zomato;
select `Month no.` from zomato;
select `Month Name` from zomato;
select Quarter from zomato;
select `Week of Year` from zomato;
select `Day Name` from zomato;
select `Financial Quarter` from zomato;

-- Find the Numbers of Resturants based on City and Country.
select Countryname,City,count(Distinct RestaurantName) as Total_Resturants from zomato
group by Countryname,City
order by Countryname,City;

-- Count of Resturants based on Average Ratings
select RestaurantName,Rating,count(*) as Number_of_resturants
from zomato
group by Rating,RestaurantName
order by Rating desc;

-- Convert the Average cost for 2 column into USD dollars (currently the Average cost for 2 in local currencie
select
  Average_Cost_for_two as cost_Rupees,
  round(average_cost_for_two / 86.12,2 ) as cost_usd
from zomato;

select city,sum(votes) as Total_Votes
from zomato
group by city
order by Total_Votes;

select Countryname,sum(votes) as Total_Votes
from zomato
group by Countryname 
order by Total_votes desc;

select Cuisines,count(distinct RestaurantName) as Total_restarunts
from zomato
group by Cuisines
order by Total_restarunts desc;

-- Percentage of Resturants based on "Has_Table_booking"
select
  has_table_booking,
  count(*) AS restaurant_count,
  round(
    100.0 *count(*) /sum(count(*)) OVER (),
    2
  ) AS percentage
  from zomato
group by has_table_booking
order by has_table_booking;

-- Percentage of Resturants based on "Has_Online_delivery"
select
  Has_Online_delivery,
  count(*) AS restaurant_count,
   round(
    100.0 * count(*) / SUM(count(*)) OVER (),
    2
  ) as percentage
  from zomato
group by Has_Online_delivery
order by Has_Online_delivery;
      








