select *from Tbl_Calisan
--kay�t eklerken ve silerken haber veren triggerlar
--trigger temel yap�s� ama uyar� vermez 
CREATE TRIGGER trg_TblCalisan_Insert
ON Tbl_Calisan
FOR INSERT --FOR dan sonra ama�� yazar�z 
AS
  --bu aral��a trigger ne yapaca��n� belirtmemiz laz�m
BEGIN
  select *from inserted  --ekleme yap�ld��� zaman kay�tlar� getir
END
--daha sonra kay�t ekleme yapal�m 
insert into Tbl_Calisan values ('Rabiye',1000,'Kad�n',3)

---------------------------------------------------------------------------------------------------------------------

--as�l trigger bu 

ALTER TRIGGER trg_TblCalisan_Insert
ON Tbl_Calisan
FOR INSERT 
AS
  
BEGIN
    declare @Id int
	select @Id=ID from inserted   --ilk eklenen kay�t� al�p ID ye att�m 
	insert into Tbl_Durum (Durum)
	values ('Yeni Kay�t Id:'+ CAST(@Id as nvarchar(5)) + 'eklendi. Tarih: ' + CAST(GETDATE() as nvarchar(30)))  
	--CAST STRiNG �FADEYE �EV�R�R
END

insert into Tbl_Calisan values(7,' Buket' ,3333,'Kad�n',2)
insert into Tbl_Calisan values(8,' Burcu' ,4545,'Kad�n',2)
--select *from Tbl_Durum

---------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER trg_TblCalisan_Deleted
ON Tbl_Calisan
FOR DELETE
AS
BEGIN
    Declare @Id int
	select @Id=ID from deleted
	insert into Tbl_Durum (Durum)
	values ('Silinen Kay�t Id:'+ CAST(@Id as nvarchar(5)) + 'silindi. Tarih: ' + CAST(GETDATE() as nvarchar(30)))  
END
Delete from Tbl_Calisan where ID=5
SELECT *FROM Tbl_Durum   --HATA VAR AMA KONTROL ET

---------------------------------------------------------------------------------------------------------------------

USE NORTHWND
select * from Products
select* from Employees

CREATE view vw_Goster
AS
Select p.ProductName,p.UnitPrice,e.City
from Products p inner join Employees e
On p.ProductID=e.EmployeeID
select * from vw_Goster


CREATE view vw_GosterLondra
AS
Select p.ProductName,p.UnitPrice,e.City
from Products p inner join Employees e
On p.ProductID=e.EmployeeID
Where City='London'
select *from vw_GosterLondra

--Bundan s�navda gelebilir
Create view vw_KategoriyeGoreSayiGetir
AS
select p.CategoryID,COUNT(*) AS Sayi from Products p
inner join Suppliers s 
ON p.SupplierID=s.SupplierID
group by p.CategoryID 

select *from vw_KategoriyeGoreSayiGetir

-------------------------------------------------------------------------------------


create view vw_BolgeGoster
as
Select r.RegionId,r.RegionDescription from Region r

select * from vw_BolgeGoster

--�ok �nemlii
Update vw_BolgeGoster set RegionDescription='VTYS' where RegionID=4 

delete from vw_BolgeGoster WHERE RegionID=4



