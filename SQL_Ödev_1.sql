select *from film;

--1 film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.
Select title,description from film;

----------------------------------------------------------------------------------------------------------

--2 film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu 
--(length) 60 dan büyük VE 75 ten küçük olma koşullarıyla sıralayınız.
SELECT length from film WHERE length>60 and length<75;

----------------------------------------------------------------------------------------------------------

--3 film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 
--VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla sıralayınız.
Select rental_rate,replacement_cost from Film WHERE rental_rate=0.99 and 
(replacement_cost=12.99 or replacement_cost=28.99 )

----------------------------------------------------------------------------------------------------------

--4 customer tablosunda bulunan first_name sütunundaki değeri 
--'Mary' olan müşterinin last_name sütunundaki değeri nedir?
SELECT *FROM customer;
select first_name,last_name from customer where first_name='Mary'

----------------------------------------------------------------------------------------------------------

--5 film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda
--rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri sıralayınız.
select length,rental_rate from film WHERE length < 50 AND (rental_rate <> 2.99 AND rental_rate <> 4.99);


