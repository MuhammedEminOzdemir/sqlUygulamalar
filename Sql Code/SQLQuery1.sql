USE ogrenci2022
select * from Tbl_Ogrenci  /*tbl ��renci datebase i �a��rd�k*/

select * from Tbl_Ogrenci
where OgrenciBolum='bilgisayar' --b�l�m� bilgisayar olan� sesle where komutu

select OgrenciAdi,OgrenciSoyad from Tbl_Ogrenci --TBL ��renci databaseinden ogrenci ad ve soyad� sesledik 

select OgrenciAdi,OgrenciSoyad,OgrenciBolum from Tbl_Ogrenci where OgrenciBolum='elektrik'

select * from Tbl_Ogrenci where OgrenciBurs=1 --buradaki 1 0 true false dur 1 bursu olanlar 

select OgrenciAdi,OgrenciSoyad from Tbl_Ogrenci where OgrenciBurs=0 and OgrenciSehir='erzurum' 

select *from Tbl_Ogrenci where OgrenciGirisYili>2018 -- giri� y�l� 2018 den b�y�k olan

--memleketi erzurum olup veya b�l�m� bilgisayar olanlar
select * from Tbl_Ogrenci
where OgrenciSehir='erzurum' or OgrenciBolum='bilgisayar'

select * from Tbl_�r�n

select [Stok Miktar�]  from Tbl_�r�n --tablo da bo�luk b�rakmak istiyorsak kesinlikle k��eli parantezde yazmal�y�z tablodada

select [OgrenciNo],[OgrenciAdi],[OgrenciSoyad] from Tbl_Ogrenci --soldaki men�den columns dan s�r�kleyebiliriz

