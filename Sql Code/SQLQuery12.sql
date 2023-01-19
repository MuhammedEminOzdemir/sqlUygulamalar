select * from Employees

select FirstName + ' ' + LastName as [Ad Soyad] from Employees  --ad soyad birle�tirme

CREATE PROCEDURE up_isimSoyisimBirlestir
AS
BEGIN
     --Bu aral��a kodlar yaz�l�r
     select FirstName + ' ' + LastName as [Ad Soyad] from Employees
END
up_isimSoyisimBirlestir  --bunu se�erek �a��r�r�rz

EXECUTE up_isimSoyisimBirlestir --2.y�ntem

EXEC up_isimSoyisimBirlestir  --3.y�ntem
-------------------------------------------------------------

--Parametreli sp  SINAVDA GEL�R �OK �NEML�
CREATE PROC up_UlkeveCinsiyeteG�reGetir
@TitleOfCourtesy nvarchar(25),  --2 parametre al�r  navarchar yani @ olanlar de�i�ken
@Country nvarchar(15)
AS
BEGIN
    SELECT *FROM Employees
	WHERE TitleOfCourtesy=@TitleOfCourtesy and Country=@Country
END

exec up_UlkeveCinsiyeteG�reGetir 'Ms.', 'USA'

sp_helptext up_UlkeveCinsiyeteG�reGetir  -- kodu getirir


-----------------------------------------------------------

--Bunu yaparsan hata al�rs�n ba�ka sp yaratamazs�n kullanma y�ntemi ise CREATE yerine ALTER yaz�l�r daha �nce yaz�lan
--sp nin de�ii�tirilmesini sa�lar

ALTER PROCEDURE up_isimSoyisimBirlestir
AS
BEGIN
     --Bu aral��a kodlar yaz�l�r
     select FirstName + ' ' + LastName as [Ad Soyad] from Employees
	 Order by FirstName
END
EXEC up_isimSoyisimBirlestir

--------------------------------------------------------------------------

DROP PROC up_isimSoyisimBirlestir  --S�LME ��LEM� YAPAR sildi 


/*----------------------------------------------------------------------------*/

--�ifreleme

ALTER PROC up_UlkeveCinsiyeteG�reGetir
@TitleOfCourtesy nvarchar(25),  
@Country nvarchar(15)
WITH ENCRYPTION  --��FRELEME
AS
BEGIN
    SELECT *FROM Employees
	WHERE TitleOfCourtesy=@TitleOfCourtesy and Country=@Country
END
sp_helptext up_UlkeveCinsiyeteG�reGetir

/*----------------------------------------------------------------------------*/

--OUTPUT PARAMETREL� SP
--Tablodaki TitleOfCourtesy de�erine g�re ka� ki�i oldu�unu parametre olarak girerek d�nd�r�p sonu� verecek

CREATE PROC up_TitleDurumunaGoreKisiSayisiniGetir
@TitleOfCourtesy nvarchar(25),
@sonuc int output --��k�� parametresi oldu�unu belirtmemiz laz�m o y�zden output yaz�l�r
AS
BEGIN
  SELECT sonuc=COUNT(*) FROM Employees
  WHERE TitleOfCourtesy=@TitleOfCourtesy
END

DECLARE @deger int
EXEC up_TitleDurumunaGoreKisiSayisiniGetir  'Ms.', @deger out
print @deger

----------------------------------------------------------------------------------------

sp_help up_TitleDurumunaGoreKisiSayisiniGetir --**!!!** �ok �nemli veri tabandaki sp nin bize ne zaman yarat�ld���n� verir

----------------------------------------------------------------------------------------------

sp_depends up_TitleDurumunaGoreKisiSayisiniGetir --Tablodaki hangi s�t�n ad�n� ilgilendirdi�ini update yap�ld� m� bunlara bakar

----------------------------------------------------------------------------------------------