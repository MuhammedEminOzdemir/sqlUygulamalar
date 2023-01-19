select *from Products
select [ProductName],
    CASE [UnitsInStock] WHEN 0 THEN 'Stokta Yok'
	ELSE CONVERT(varchar,UnitsInStock) END AS [Stok Durumu] 
from Products ORDER BY UnitsInStock desc

/*------------------------------------------------------------------------------*/

select *from Employees
select [FirstName],[LastName],[TitleOfCourtesy],
    CASE TitleOfCourtesy WHEN 'Ms.' THEN 'Kad�n'
	WHEN 'Mrs.' THEN 'Kad�n'
	WHEN 'Mr.'  THEN 'Erkek'
	WHEN 'Dr.'  THEN 'Doktor'
	ELSE  '-'   END AS Durum   /*Di�er durumlar i�in bunu kullan else*/
from Employees

/*--------------------------------------------------------------------------------*/

--GETDATE() KOMUTU  SAAT O ANLIK SAAT ZAMAN DURUMUNU GET�R�R
SELECT GETDATE()

--------------------------------------------------------------------------------

--declare de�i�ken tan�mlama
Declare  @tarih DATETIME --de�i�ken ismi 
SET @tarih='2022-11-25 03:30:25'  --de�i�keni tan�mlama Atama yap�l�r
Select @tarih  --yazd�rmak i�in select ile yazd�r�l�r

DECLARE @t DATETIME
SET @t='2022-11-25 03:30:25'
select DATEADD(DAY,1,@t)  --dateadd ile bir g�n ekle anlam�nda @t ye ekle

GO
DECLARE @t DATETIME --�nce tan�mlanan de�i�ken i�in hata verir bunu kald�rmak i�in �ncesinde  go kullan�l�r �ncesindeki belle�i siler
SET @t='2022-11-25 03:30:25'
select DATEADD(MONTH,1,@t)  --dateadd ile bir AY ekle anlam�nda @t ye ekle

GO
DECLARE @t DATETIME
SET @t='2022-11-25 03:30:25'
select DATEADD(YEAR,1,@t)  --dateadd ile bir y�l ekle anlam�nda @t ye ekle

--DATEDIFF METHODU
DECLARE @t1 DATETIME
DECLARE @t2 DATETIME
SET @t1=GETDATE()
SET @t2='2022-09-28 08:00:00'
SELECT DATEDIFF(DAY,@t2,@t1) as g�n --datediff methodu t1 ile t2 aras�ndaki zaman fark�n� al�r g�n olarak
SELECT DATEDIFF(MONTH,@t2,@t1) as ay
select DATEPART(DAY,@t1)

--DECLARE FARKLI KULLANIMI
DECLARE @degisken as int=2
select @degisken


DECLARE @degisken1 as int=2
set @degisken1 - @degisken1+10
select @degisken1


Declare @sayi1 int, @sayi2 int, @ortalama float
SET @sayi1-100
SET @sayi2-150
set @ortalama-(@sayi1+@sayi2)/2
SELECT @ortalama AS ortalama

Declare @degisken3 as smallint -100
set @degisken3-@degisken3-5
select @degisken3

--pi * r* 2 alan hesaplama
--SELECT Pi()
GO
DECLARE @r float, @sonuc float
SET @r=5
SET @sonuc=Pi()*SQUARE(@r)
Select @sonuc as Alan

-- 1 DEN 10 A KADAR OLANLARININ AKRES�N� ALMA
Go
Declare @i int, @kuvvet int
set @i=1
set @kuvvet=0
WHILE @i<10
     Begin 
	     Select POWER(@�,@kuvvet)
		 SET @i=@i+1
		 SET @kuvvet=@kuvvet+1
	 END 

--1 DEN 10 A KADAR OLAN SAYILARIN KAREK�K�N� ALMA
GO
DECLARE @i int
SET @i=1
WHILE @i<10
     Begin
	     select SQRT(@i)
		 Set @i=@i+1
	 END


------------------------------------------------------------------------------------------------------------

Declare @degisken float=15.55
Select FLOOR(@degisken)  --alta yuvarlama

GO
Declare @degisken float=15.55
Select CEILING(@degisken)  --YUKARI yuvarlama 

GO
Declare @degisken float=15.55
Select ROUND(@degisken,0.5)  --EN �ok kulland���m�z yuvarlamad�r

Go
declare @degisken float=-15.47
select abs(@degisken)  --mutlak de�er al�r

--------------------------------------------------------------------------------

Select Count(*) as Say� from Customers where Country='Germany'

--ka� farkl� �lke
Select count(Distinct Country) as [Ka� Farkl� �lke?]  from Customers 

--en pahal� 5 �r�n top komutu 
Select top 5 ProductName,UnitPrice
from Products order by UnitPrice desc

Declare @sonuc as int=10  --karelerini alma
select POWER(@sonuc,2)
select SQUARE(@sonuc)

-------------------------------------------------------------------

Select CategoryName, COUNT(*)
from [Product Sales for 1997]
group by CategoryName

Select CategoryName, COUNT(*)
from [Product Sales for 1997]
group by CategoryName
having COUNT(*) >10   

