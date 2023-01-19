select *from Tbl_OgrenciVize  /*B�t�n verileri getirir*/

select ogrenciNo,ogrenciAd from Tbl_OgrenciVize  /*sadece ogrenciNo,ogrenciAd verilerini getirir */

select distinct ogrenciBolum from Tbl_OgrenciVize /*tekrar eden verileri kald�r�r*/

select *from Tbl_OgrenciVize ORDER BY ogrenciNo ASC /*��renci numaras�n� artan s�rada s�ralar*/
select *from Tbl_OgrenciVize ORDER BY ogrenciNo DESC /*��renci numaras�n� azalan s�rada s�ralar*/

/*�rne�in a�a��daki ifade ile Ogrenci tablosundaki
b�l�m bilgileri ayn� kay�tlar tekrarlanmaks�z�n
artan bir �ekilde s�ralanak listelenmektedir*/
SELECT  DISTINCT ogrenciBolum FROM Tbl_OgrenciVize ORDER BY ogrenciBolum ASC

/*Tablomuzu 
1-Ad alan�na g�re artan,
2-Soyad alan�na g�re azalan ve
3-Agno alan�na g�re artan s�rada */
SELECT ogrenciAd FROM Tbl_OgrenciVize ORDER BY ogrenciAd asc
SELECT ogrenciSoyad FROM Tbl_OgrenciVize ORDER BY ogrenciSoyad desc
SELECT ogrenciAgno FROM Tbl_OgrenciVize ORDER BY ogrenciAgno asc
/*veya k�sa yolu*/
SELECT ogrenciAd,ogrenciSoyad,ogrenciAgno FROM Tbl_OgrenciVize ORDER BY ogrenciAgno ASC,ogrenciSoyad DESC,ogrenciAgno ASC

/*---AS KOMUTU------*/

SELECT ogrenciSoyad AS ogrenciSoyisim from Tbl_OgrenciVize /*Se�ilen s�tunlar�n istenilen isimde g�r�nt�lenmesini sa�lar*/

Select ogrenciNo,ogrenciNo+10 from Tbl_OgrenciVize /*S�tunlar �zerinde Matematiksel �lemler Yapmak*/


/*where ko�ul sorgulama i�lemleri*/
select *from Tbl_OgrenciVize where ogrenciBolum='Bilgisayar' /*Tablodan b�l�m� bilgisayar olanlar� getir*/
select ogrenciAd,ogrenciSoyad,ogrenciAgno from Tbl_OgrenciVize where ogrenciAgno>3
select *from Tbl_OgrenciVize where ogrenciAgno>3 AND ogrenciNo<500
select *from Tbl_OgrenciVize where ogrenciAgno>3 OR ogrenciNo<500
select *from Tbl_OgrenciVize where ogrenciBolum='Hem�irelik' OR ogrenciAgno>3.3 OR ogrenciAd='Muhammet Emin' 

SELECT * FROM Tbl_OgrenciVize WHERE ogrenciSehir IN('Erzurum', 'Antalya') /*�n komutu ayn� or gibi*/
SELECT *FROM Tbl_OgrenciVize WHERE ogrenciBolum IN('Bilgisayar','Elektrik')

SELECT * FROM Tbl_OgrenciVize WHERE ogrenciAgno BETWEEN 3 AND 3.5
select *from Tbl_OgrenciVize where ogrenciNo BETWEEN 1000 AND 1100


/*GROUP BY*/
SELECT ogrenciBolum from Tbl_OgrenciVize Group by ogrenciBolum  /*grupland�r�rak sorgular disnict komutu ile kar��t�r�lmamal�*/

/*count veri setimizde ka� tane kay�t oldu�unu g�sterir*/
select count(*) from Tbl_OgrenciVize
select count(*) as [Kay�t Say�s�] from Tbl_OgrenciVize

/*b�l�m� bilgisayar olan kay�t say�s�*/
select count(*) as B�l�m from Tbl_OgrenciVize where ogrenciBolum='Bilgisayar'

/*Tablomuza yeni veri-kay�t ekleme*/
insert into Tbl_OgrenciVize(ogrenciAd,ogrenciSoyad) values('Murat','Atarl�')
insert into Tbl_OgrenciVize(ogrenciNo,ogrenciAd,ogrenciSoyad,ogrenciBolum,ogrenciAgno,ogrenciSehir) 
                            values(355,'Elif','Atarl�','Elektrik',1.8,'Bolu')
insert into Tbl_OgrenciVize(ogrenciNo,ogrenciAd,ogrenciSoyad) values(745,'Muharrem','�zdemir') 


SELECT ogrenciAd + ' ' + ogrenciSoyad AS [Ad Soyad] from Tbl_OgrenciVize

select *from Tbl_OgrenciVize where ogrenciAd LIKE 'C%'  /*Ba� harfi c ile ba�layanlar*/

/*Update Komutu where komutundan sonras� var olan yenisi set teriminden sonra*/ 
Update Tbl_OgrenciVize SET ogrenciAd='Alperen',ogrenciSoyad='�zdemir' where ogrenciAd='Ahmet Enes' and ogrenciSoyad='G�l'
Update Tbl_OgrenciVize set ogrenciAd='B��ra', ogrenciSoyad='�zdemir' where ogrenciAd='Mustafa' and ogrenciSoyad='�o�kun'


/*delete komutu o sat�r� sildi */
delete from Tbl_OgrenciVize where ogrenciId=6
select*from Tbl_OgrenciVize

select *from Tbl_OgrenciVize WHERE ogrenciAd LIKE '____' AND ogrenciAd LIKE '[^C-Z]'

select count(ogrenciBolum) AS Kay�t from Tbl_OgrenciVize  /*��RENC� B�L�M�NDE KA� TANE KAYIT VARDIR*/
select count(distinct(ogrenciBolum)) as tekrars�z_veri from Tbl_OgrenciVize /*��renci b�l�m�nde ka� tane tekrars�z veri vard�r*/
			
select ogrenciBolum from Tbl_OgrenciVize group by ogrenciBolum 
select ogrenciBolum, count(*) as adet from Tbl_OgrenciVize group by ogrenciBolum /*��renci b�l�mlerinden kac adet oldu�unu getirten sorgulama*/
select ogrenciSehir, count(*) as [�ehir say�s�] from Tbl_OgrenciVize group by ogrenciSehir

select ogrenciBolum, avg(ogrenciAgno) as agno from Tbl_OgrenciVize group by ogrenciBolum /* ��renci b�l�mlerini grupland�rd� bilgisayar hem�irelik elektrik
                                                                                            avg ile ayr� ayr� agno ortalamas�n� ald� as ile agno s�t�n ismi de�i�ti */
insert into Tbl_OgrenciVize(ogrenciAd,ogrenciSoyad) values ('sude','er')

/*UNION komutu tek bir ekranda g�sterir birli�tirir*/
select 'Ceren' as Ad�,'Bu�day' as Soyad� 
UNION
select 'Muhammed Emin' as Ad�, '�zdemir' as Soyad�

SELECT 5+6 /*11 ��kt�s� verir*/
SELECT '8'+6  /*Birisi string birisi int veri fakat int veri gibi alg�lar toplam� verir*/
SELECT 5+'Kalem' ---hata verir d�zeltmek i�in iki inemli method vard�r

---convert ---cast methodlar�
select convert(varchar,5)+' '+'Kalem' as sonu�
select cast(5 as varchar) +' '+'Kalem' as sonu�

/*Random say� �retimi*/
select rand()  --0 ile 1 aras� random say� �retir
select rand()*100  -- 0 ile 100 aras�
select round(rand()*100,0,5) /*tam say� �evirip random say� verir */

use NORTHWND
select *from Employees
select FirstName,LastName from Employees /*sadece firstname ve lastname olan kay�tlar gelir*/
 
select FirstName +' '+ LastName as [Ad Soyad] from Employees /*ad soyad verilerini birle�tirerek yeni s�t�n ismi verdik*/

select *from Products
select Upper(ProductName) as ProductName from Products 
select Lower(ProductName) as [�r�n Adi] from Products

select Upper(ogrenciAd) as Ad from Tbl_OgrenciVize
select lower(ogrenciAd) as soyad from Tbl_OgrenciVize

SELECT ProductName as Ad�,UnitPrice as �cret ,UnitsInStock as [�r�n Miktar�]  from Products order by UnitPrice ASC
/*ProductName, UnitPrice ve UnitsInStock s�t�nlar�n� ald�k as ile yeni s�t�n ismi tan�mlad�k ve order by ile artan s�rada UnitPrice � s�ralad�k */


select FirstName + ' ' + LastName as [AD SOYAD], BirthDate as [Do�um G�n�] FROM Employees Order By BirthDate ASC

select [ProductName],[UnitsInStock] from Products where UnitsInStock<10 order by UnitsInStock DESC
/*Burada Products tablosundan ProductName,UnitsInStock s�t�n kay�tlar�n� alarak UnitsInStock10 dan k���k olanlar� al ve azalan s�rada s�rala */

SELECT [CompanyName],[ContactName],[City],[Country] FROM Customers WHERE City='Madrid' or Country='Germany'
/*Burada Customers tablosundan [CompanyName],[ContactName],[City],[Country] verilerini alarak madrid ve almanyal� olanlar� getir */

--LIKE �OK �NEML�
SELECT ProductName from Products WHERE ProductName LIKE 'C%' --C �LE BA�LAYANLAR
SELECT ProductName from Products WHERE ProductName LIKE '%C%' --��erisinde c olanlar
SELECT ProductName from Products WHERE ProductName LIKE '%Chef%' --��erisinde chef olanlar
SELECT [FirstName],[LastName] FROM Employees WHERE FirstName LIKE 'M%' AND Country='USA'
SELECT [ProductName] FROM Products WHERE ProductName LIKE '%T' --Tile bitenler

SELECT [FirstName],[LastName],[BirthDate] FROM Employees where BirthDate >='1948-01-01' AND BirthDate <'1952-04-05'  

--BETWEEN - AND
SELECT [ProductName],[UnitsInStock] FROM Products WHERE UnitsInStock BETWEEN 0 AND 10 --STOK M�KTARI 0 �LE 10 ARASINDAK�LER
SELECT [ProductName],[UnitsInStock] FROM Products WHERE UnitsInStock BETWEEN 20 AND 50 ORDER BY UnitsInStock desc
--STOK M�KTARI 0 �LE 10 ARASINDAK�LER AMA azalan SIRADA

--IN methodu
SELECT [ProductName],[CategoryID] FROM Products where CategoryID IN(1,3,5) ORDER BY CategoryID ASC 
SELECT [ProductName],[CategoryID] FROM Products where CategoryID NOT IN(1,3,5) ORDER BY CategoryID ASC
--IN methodu ile 1 3 5 olanlar� getir �oklu kabul eder not �n yazarsak olmayanlar� getir,


--Null methodu
 SELECT [Title],[Region] from Employees where Region is null -- NULL olan de�erleri getir
 SELECT [Title],[Region] from Employees where Region is not  null -- NULL olmayan de�erleri getir
 SELECT [ogrenciBolum],[ogrenciAgno] from Tbl_OgrenciVize where ogrenciAgno is not null

 --CASE WHEN THEN methotlar�  !!!!!!!
 --Stoktlara bak�p 0 ise stokta yk varsa stok adetini yazd�r�caz 
 SELECT ProductName as [�r�n ad�], 
     CASE UnitsInStock WHEN 0 THEN 'Stokta yok'
	 ELSE Convert(varchar,UnitsInStock) END AS [Stok Miktar�]
from Products



