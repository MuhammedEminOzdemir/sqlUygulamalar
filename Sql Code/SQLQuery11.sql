select tc.Ad�,tc.Soyad�,
notlar.Vize,notlar.Final,notlar.Ders

from Tbl_TC tc

inner join Tbl_Not notlar ON
tc.TC=notlar.TC   --TABLODAK� BAZI VER�LER� B�RLE�T�RD�K �K� TABLODAK� ORTAK OLANLAR GEL�R

/*-------------------------------------------------------------------------------------*/

select t1.Final,t1.Ders,T2.Ad�,t2.Soyad�
from Tbl_Not t1
LEFT JOIN Tbl_TC t2 ON
t1.TC=t2.TC   --sadece final notu girilenler geldi

/*-------------------------------------------------------------------------------------*/

select t1.Ders,t2.Ad�,T1.Vize,T1.Final
from Tbl_Not t1
FULL JOIN Tbl_TC t2 On
t1.TC=t2.TC


/*-------------------------------------------------------------------------------------*/
--norrthwnd databasei

SELECT *FROM Products
select *from Categories
select*from Suppliers

SELECT P.ProductName,p.UnitsInStock,c.CategoryName,s.CompanyName
from Products p
JOIN Categories c ON p.CategoryID=c.CategoryID
JOIN Suppliers s ON p.SupplierID=s.SupplierID

/*-------------------------------------------------------------------------------------*/

SELECT P.ProductName,p.UnitsInStock,c.CategoryName,s.CompanyName
from Products p
JOIN Categories c ON p.CategoryID=c.CategoryID
JOIN Suppliers s ON p.SupplierID=s.SupplierID
WHERE UnitsInStock BETWEEN 0 AND 10
ORDER BY UnitsInStock DESC

/*-------------------------------------------------------------------------------------*/

SELECT P.ProductName,p.UnitsInStock,c.CategoryName,s.CompanyName,p.UnitPrice as Fiyat
from Products p
JOIN Categories c ON p.CategoryID=c.CategoryID
JOIN Suppliers s ON p.SupplierID=s.SupplierID
WHERE UnitsInStock BETWEEN 0 AND 10
ORDER BY UnitPrice --fiyata g�re s�ralama 

--2.�nemli s�ralama �ekli �ok �nemli

SELECT P.ProductName,p.UnitsInStock,c.CategoryName,s.CompanyName,p.UnitPrice as Fiyat
from Products p
JOIN Categories c ON p.CategoryID=c.CategoryID
JOIN Suppliers s ON p.SupplierID=s.SupplierID
WHERE UnitsInStock BETWEEN 0 AND 10
ORDER BY Fiyat

/*-------------------------------------------------------------------------------------*/
--string i�lemleri

declare @deneme as char(50)
set @deneme='Hello world' 
select @deneme

select @deneme as sonuc, 
LEN(@deneme) as uzunluk, --hello world 11 kelimeden olu�tu�unu s�yler
DATALENGTH(@deneme) as datauzunlugu

declare @deneme1 as char(7) ='Merhaba'
select @deneme1 as sonu�

select left(@deneme1,2) as sol --ilk 2 karakter al�r soldan
select Right(@deneme1,2) as sa� --ilk 2 karakter al�r soldan
select SUBSTRING(@deneme1,3,4) as karakter_alma --3. karakterden ba�lay�p 4 karakter al

GO
declare @deneme as char(30) 
set @deneme='     Muhammed Emin �zdemir        '
select @deneme
select LTRIM(@deneme)  --soldaki bo�luklar� kullan�r
select RTRIM(@deneme) --sa�dakileri siler
select CHARINDEX('a',@deneme) --ilk buldu�u a harfinin index ini g�nderir
select PATINDEX('%Emin%',@deneme) 
select REPLACE(@deneme, 'a','e') --harf de�i�ikli�i

/*-------------------------------------------------------------------------------------*/

select UnitPrice,ProductName,
	CASE WHEN UnitPrice>=20 THEN 'Pahal�'
	ELSE 'Ucuz' END as Durum
from Products

/*-------------------------------------------------------------------------------------*/
--	IIF YAPISI

select UnitPrice,ProductName,
IIF(UnitPrice>=20,'Pahal�','Ucuz') as Durum
from Products 

/*-------------------------------------------------------------------------------------*/
--CHOOSE 

select CHOOSE(3,FirstName,LastName,CONCAT(FirstName,' ',LastName)) as Ki�iler --buradaki concat birli�tirir isim soyisim
from Employees

/*-------------------------------------------------------------------------------------*/
--COALESCE
select COALESCE(Region,City,Country,'Belirtilmemi�') AS durum
from Employees