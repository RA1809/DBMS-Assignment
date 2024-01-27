-- Q1
USE airportdb;
SELECT f.flight_id, f.flightno, f.departure, f.arrival, f.airline_id, f.airplane_id
FROM  flight f
JOIN  airport_geo a_source ON f.from = a_source.airport_id
JOIN  airport_geo a_dest ON f.to = a_dest.airport_id
WHERE a_source.name = 'BORG EL ARAB INTL'  AND a_dest.name = 'LABUAN';

--Q2
USE airportdb;
SELECT AVG(price) AS average_price_per_seat
FROM booking
WHERE flight_id = 3863;

--Q3
--if airplane type
SELECT DISTINCT at.identifier,at.description
FROM booking b
JOIN flight f ON b.flight_id = f.flight_id
JOIN airplane a ON f.airplane_id = a.airplane_id
JOIN airplane_type at ON a.type_id = at.type_id
WHERE b.passenger_id = 16678;

--if airline type
USE airportdb;
SELECT DISTINCT a.airlinename
FROM booking b
JOIN flight f ON b.flight_id = f.flight_id
JOIN airline a ON f.airline_id = a.airline_id
WHERE b.passenger_id = 16678;

--Q4
USE airportdb;
SELECT DISTINCT log_date
FROM weatherdata
WHERE airpressure > 1015 AND humidity >= 98;
SELECT COUNT(DISTINCT log_date) AS unsuitable_flight_count
FROM weatherdata
WHERE airpressure > 1015 AND humidity >= 98;

--Q5
USE airportdb;
SELECT a.airline_id, a.airlinename, SUM(b.price) AS total_revenue
FROM booking b
JOIN flight f ON b.flight_id = f.flight_id
JOIN airline a ON f.airline_id = a.airline_id
GROUP BY a.airline_id, a.airlinename
ORDER BY total_revenue DESC
LIMIT 20;


