/-1.Query all columns for all American cities in the CITY table with 
	populations larger than 100000. The CountryCode for America is USA.
SOLUTION
select * 
from CITY
where population > 100000 and countrycode= 'USA';

/-2.Query the NAME field for all American cities in the CITY table with
	populations larger than 120000. The CountryCode for America is USA.
SOLUTION
select NAME
from city
where population > 120000 and countrycode = 'USA';

/-3.Query all columns (attributes) for every row in the CITY table.
SOLUTION
SELECT *
FROM CITY;

/-4.Query all columns for a city in CITY with the ID 1661.
SOLUTION
select *
from CITY
where ID = 1661;

/-5.Query all attributes of every Japanese city in the CITY table. 
	The COUNTRYCODE for Japan is JPN.
SOLUTION
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/-6.Query the names of all the Japanese cities in the CITY table. 
	The COUNTRYCODE for Japan is JPN
SOLUTION
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/-7.Query a list of CITY and STATE from the STATION table.
SOLUTION
SELECT CITY, STATE
FROM STATION

/-8.Query a list of CITY names from STATION for cities that have an even ID 
	number. Print the results in any order, but exclude duplicates from the answer.
SOLUTION
SELECT DISTINCT(CITY)
FROM STATION
WHERE ID%2=0;

/-9.Find the difference between the total number of CITY entries in the table and 
	the number of distinct CITY entries in the table.
SOLUTION
SELECT COUNT(CITY) - COUNT(DISTINCT(CITY))
FROM STATION;

/-10.Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) 
	from STATION. Your result cannot contain duplicates.
SOLUTION
select city 
from station 
where city like "[aeiou]%";

/-11.Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
	Your result cannot contain duplicates.
SOLUTION
select distinct city 
from station 
where SUBSTRING(city,len(city),1) like "%[aeiou]%" 
order by city;

/-12.Query the two cities in STATION with the shortest and longest CITY names, 
	as well as their respective lengths (i.e.: number of characters in the name).
	If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
SOLUTION
select top 1 city  + ' ' +  cast(len(city) as varchar) 
from station 
where len(city) = (select min(len(city)) from station) 
order by city;

/-13.Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee 
	table in alphabetical order.
SOLUTION
select name
from Employee
order by name;

/-14.Given the CITY and COUNTRY tables, query the sum of the populations 
	of all cities where the CONTINENT is 'Asia'.
	Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SOLUTION
select sum(city.population)
from city
join country
on city.countrycode = country.code
where CONTINENT = 'Asia';

/-15.Given the CITY and COUNTRY tables, query the names of all cities 
	where the CONTINENT is 'Africa'.
	Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SOLUTION
select city.name
from city
join country
on city.countrycode = country.code
where CONTINENT = 'Africa';

/-16.Given the CITY and COUNTRY tables, query the names of all the continents
	(COUNTRY.Continent) and their respective average city populations
	(CITY.Population) rounded down to the nearest integer.
	Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SOLUTION
select COUNTRY.Continent, FLOOR(AVG(CITY.Population)) 
from City 
join Country
on CITY.CountryCode = COUNTRY.Code 
group by COUNTRY.Continent;


/-17.Query the Name of any student in STUDENTS who scored higher than  
	Marks. Order your output by the last three characters of each name.
	If two or more students both have names ending in the same last three
	characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending
	ID.
SOLUTION
SELECT Name 
FROM Students 
WHERE Marks > 75 
ORDER BY Substring(Name, -3) ASC, Id ASC;

/-18.Query the list of CITY names from STATION that do not start with vowels
	and do not end with vowels. Your result cannot contain duplicates.
SOLUTION
SELECt Distinct CITY 
from STATION 
where !(CITY like '%a' or CITY like '%e' or CITY like '%i' or CITY like '%o' or CITY like '%u') AND !(CITY like 'a%' or CITY like 'e%' or CITY like 'i%' or CITY like 'o%' or CITY like 'u%') 
order by City ASC;	
	
/-19.Query the list of CITY names from STATION that do not end with vowels.
	Your result cannot contain duplicates.
SOLUTION
SELECT Distinct CITY 
from STATION 
WHERE !(CITY like '%a' or CITY like '%e' or CITY like '%i' or CITY like '%o' or CITY like '%u') 
order by CITY ASC;	

/-20.Write a query that prints a list of employee names
	(i.e.: the name attribute) for employees in Employee having a 
	salary greater than  per month who have been employees for less 
	than  months. Sort your result by ascending employee_id.
SOLUTION
select name 
from employee 
where months<10 and salary>2000 
order by employee_id;
	
	
	
	