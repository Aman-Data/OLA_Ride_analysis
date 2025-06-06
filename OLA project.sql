create database ola;
use ola;
select * from ola dataset;

#1. Retrieve all successful bookings:
create view Successful_Bookings as select * from ola dataset where Booking_Status='Success';

#2. Find the average ride distance for each vehicle type:
create view Avg_Ride_Distance_for_each_vehicle as select Vehicle_Type, avg(Ride_Distance) 
as avg_distance from ola dataset group by Vehicle_Type;

#3. Get the total number of cancelled rides by customers:
create view Cancelled_Rides_by_Customers as select count(Booking_Status) 
as Cancelled_Rides from ola dataset where Booking_Status='Canceled by Customer';

#4. List the top 5 customers who booked the highest number of rides:
create view Top_5_customers as select Customer_ID, count(Booking_ID) as total_rides from ola dataset
group by Customer_ID order by total_rides desc limit 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Cancelled_by_Drivers as select count(*) as Cancelled_by_Drivers from ola dataset
where Canceled_Rides_by_Driver='Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_and_min_ratings as select max(Driver_Ratings) as max_rating,min(Driver_Ratings) 
as min_rating from ola dataset where Vehicle_Type ='Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
create view UPI_payment as select count(Payment_Method) as UPI_Method from ola dataset where Payment_Method='UPI';

#8. Find the average customer rating per vehicle type:
create view customer_rating_per_vehicle_type as select Vehicle_Type, avg(Customer_Rating) 
as avg_customer_rating from ola dataset group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
create view total_booking_value_successfully as select sum(Booking_Value) 
as total_successful_value from ola dataset where Booking_Status='Success';

#10. List all incomplete rides along with the reason:
create view incomeplete_rides_with_reason as select Booking_ID, Incomplete_Rides_Reason 
from ola dataset where Incomplete_Rides='Yes';
