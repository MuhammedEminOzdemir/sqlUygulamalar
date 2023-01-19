use BtkMusteri /*btk musteri database ini kullan*/

select *from Tbl_BtkMusteri /*B�t�n verileri getirir*/

select *from Tbl_BtkMusteri where Gender='K�z' /*if gibi bir durum yani m��teri tablosundan cinsiyeti k�z olanlar� sesle*/

select CustomerName,City from Tbl_BtkMusteri /*tablodan sadece isim ve �ehir bilgisini sesledik*/

insert into Tbl_BtkMusteri(CustomerName,City,BirthDate,District,Gender) values('Ceren Bu�day','Erzurum','2000-09-02','Yakutiye','K�z')

Update Tbl_BtkMusteri set Nation='TR',Age=DATEDIFF(YEAR,B�RTHDATE,GETDATE())
/*Buradaki datediff iki tarih aras�ndaki fark� al�r getdate ise �imdiki taih fonksiyonudur*/

select *from Tbl_BtkMusteri where BirthDate>'1983'