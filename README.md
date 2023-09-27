# How-to-Write-PLSQL

Oracle veri tabanı sistemine özgü olan PL/SQL dili ile ilgili olarak hazırladığım bu içerik en sık kullanılan PL/SQL yapılarını, basic konuları içermektedir.
Burada açıklanan yapıların detaylı kod örnekleri repo içerisindeki source dosyasında yer almaktadır.

- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#sql-komutlari"> SQL COMMANDS: DML, DDL, TCL, DCL </a>
- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#data-types"> DATA TYPES </a>
- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#declare-ve-begin"> DECLARE & BEGIN </a>
- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#operators"> OPERATORS </a>				
- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#into-ve-sql-functions"> INTO & SQL FUNCTIONS </a>  	
- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#sequence-ve-qualifier"> SEQUENCE & QUALIFIER </a>		
- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#sql-dml-commands"> SQL DML COMMANDS </a>			
- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#ifelse"> CONDITIONS </a>
- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#loops"> LOOPS </a>
- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#cursor"> CURSOR </a>
- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#procedure"> PROCEDURE </a>
- <a href="https://github.com/yedincel/How-to-Write-PLSQL/#functions"> FUNCTIONS </a>

## SQL KOMUTLARI
<blockquote>
<img style="width:700px; heigth:500px" src="https://media.geeksforgeeks.org/wp-content/uploads/sql-commands.jpg"></img>
</blockquote>

### DDL - Data Dictionary Langue
<blockquote>
<p>
Veri tanımlama dili (DDL), veri tabanındaki nesnelerinin yapısını oluşturmak 
ve değiştirmek için kullanılan bir bilgisayar dilidir. Bu veri tabanı nesneleri 
görünümleri, şemaları, tabloları, dizinleri vb. içerir. 

- CREATE - veri tabanı yaratmak, yeni tablo oluşturmak için kullanılır
- ALTER  - tabloya sütun eklemek, güncellemek için kullanılır
- DROP	 - bir veri tabanı veya tabloyu silmeye yarar
- RENAME - tabloyu veya sütunu yeniden adlandırmaya yarar
- TRANCATE - tablodaki kayıtları temizler
- COMMENT - yorum satırı eklemeyi sağlar
</p>
</blockquote>

### DML - Data Manipulation Language
<blockquote>
<p>
Veritabanında bilgi üzerinde çalışmayı sağlar. 
Bilgiyi çağırma, bilgiye yeni bir şeyler ekleme, bilgiden bir şeyler silme, 
bilgiyi güncelleştirme işlemlerini yapar. 

- SELECT - veri sorgulama
- UPDATE - verileri güncelleme
- INSERT - veri ekleme
- DELETE - verileri silme
</p>
</blockquote>

### TCL - Transaction Control Language
<blockquote>
<p>
İşlem Denetim Dili komutları, DML deyimleri tarafından yapılan değişiklikleri yönetmek için kullanılır.

- COMMIT - Herhangi bir işlemi kalıcı olarak kaydetmek için commit komutu kullanılır
- ROLLBACK - Bu komut, veri tabanını son kaydedilen duruma geri yükler yani son yapılan işlemi geri alır.
- SAVEPOINT - Bir işlemi geçici olarak kaydetmek için savepoint komutu kullanılır.
</p>
</blockquote>

### DCL - Data Control Language
<blockquote>
<p>
Veri tabanında yetkilendirme işlemleri için kullanılır.

- GRANT
- REVOKE
</p>
</blockquote>
<hr></hr>

## DATA TYPES
<blockquote>
<p>
Bu bölümde PL/SQL dilinde en sık kullanılan, ihtiyacınızı karşılamaya yetecek olan veri tiplerini ekledim.
Özellikle String veri tiplerinden char, varchar2 ve clob, Sayısal veri tiplerinden ise number kullanımından bahsettim.
Burada yer alanların dışında çok sayıda veri tipi bulunmaktadır.

Sayısal Veri Tipleri

- Number 	    : Hem tam sayı hem de ondalık sayıları saklayan boyutu kullanıcı tarafından ayarlanabilen veri tipi
		          Örnek: number(5) en fazla 5 basamaklı tam sayıları tutar, number(2,1) en fazla 2 basamaklı virgülden sonra ise 1 basamaklı sayıları tutar
- Byte	      : Tam sayıları tutar
- Int		      : Tam sayıları tutar
- Double 	    : Ondalıklı sayıları tutar
- Float     	: Ondalıklı sayıları tutar


String Veri Tipleri

- Char	      : Sabit uzunluktadır, karakterleri tutar
- Varchar2	  : Değişken uzunlukta olan karakter tutan veri tipidir
		          Örnek: isim varchar(20);	--en fazla 20 karakter uzunluğunda kullanıcı ismi tutabilir
- Nchar	      : Sabit uzunluktadır. UNICODE karakter setine sahiptir, yani sadece İngilizce değil ulusal dillere ait karakterleri de saklar
- Nvarchar	  : Değişken uzunluktadır. UNICODE karakter setine sahiptir
- Blob	      : 8 ile 128 TB arası byte türünde verileri saklar
- Clob	      : 8 ile 128 TB arası büyük karakter verilerini saklar
- Nclob	      : 8 ile 128 TB arası büyük karakter verilerini saklar aynı zamanda UNICODE özelliğine sahiptir


Boolean Veri Tipi

- Boolean	    : True, False ya da Null değerini tutar


Tarih ve Saat Veri Tipleri

- Datetime	  : Tarih, saat, dakika ve saniye verisine kadar saklar
		          eğer bu verileri ayrı ayrı saklamasını istiyorsanız aşağıdakileri kullanabilirsiniz
- Year, day, month, hour

</p>
</blockquote>
<hr></hr>

## DECLARE ve BEGIN

<blockquote>
<pre>
-- Veri türü oluşturmak için değişkenimizin adını ve tipini DECLARE ile BEGIN arasındaki bölüme yazmamız gerekiyor
-- İstersek veriyi oluşturup direkt olarak bir değer atayabiliriz 3,5,7 gibi sayılar veya A,B,C gibi karakterler...
-- Diğer yöntemler ise veriyi kullanıcıdan almak veya veri tabanındaki tablolardan çekmektir
DECLARE
v_kod number(6);        -- burada v_kod adında maks 6 haneli sayısal bir değişken oluşturduk
v_sayi1 int;
v_sayi2 float;
v_cinsiyet char;    
v_name  varchar2(40);     -- burada v_name adında maks 40 haneli string bir değişken oluşturduk

BEGIN
-- Yapmak istediğimiz işlemler bu bölümde yer alır
END;
</pre>

<pre>
-- Değer atama
DECLARE
v_kod number(6) := 234678;          -- oluşturduğumuz v_kod değişkenine 6 haneli 234678 değerini atadık
v_marka varchar2(20) := 'Adidas';     -- oluşturduğumuz v_marka değişkenine Adidas değerini atadık
BEGIN
END;
</pre>

<pre>
-- Kullanıcıdan değer alma 
DECLARE
  v_kod number(6) := &sayi;
  v_marka varchar2(20) := '&marka';   -- String türünde olduğu için tırnak içinde alıyoruz!
BEGIN
  dbms_output.put_line('Lutfen kodu giriniz: ' || v_kod);
  dbms_output.put_line('Lutfen markayı giriniz: ' || v_marka);
END;

-----------------------------------------------

DECLARE
  v_isim VARCHAR2(20);
BEGIN
  v_isim := '&isim';
  dbms_output.put_line('Merhaba ' || v_isim);
END;
</pre>
</blockquote>
<hr></hr>

## OPERATORS
<p>
</p>
<blockquote>
<pre>
</pre>
</blockquote>
<hr></hr>

## INTO ve SQL FUNCTIONS
<p>
</p>
<blockquote>
<pre>
</pre>
</blockquote>
<hr></hr>

## SEQUENCE ve QUALIFIER
<p>
</p>
<blockquote>
<pre>
</pre>
</blockquote>
<hr></hr>

## SQL DML COMMANDS
<p>
</p>
<blockquote>
<pre>
</pre>
</blockquote>
<hr></hr>

## IF/ELSE
<p>
Belirli bir koşulun sağlanması durumunda çalışan kod bloğunun oluşturulması için IF/ELSE kullanılır.
</p>
<img style="width:350px; heigth:350px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt6tYltRH8rbFXuGSl9JZtGMF2Hkb_6JDucA&usqp=CAU"></img>
<blockquote>
<pre>
DECLARE
  v_sayi NUMBER := &sayi; -- kullanıcıdan sayı değeri alınır
BEGIN
  if v_sayi > 20 then
    dbms_output.put_line('Girmiş olduğunuz sayı 20 den büyüktür.');
  elsif v_sayi > 10 then
    dbms_output.put_line('Girmiş olduğunuz sayı 10 dan büyüktür');
  else
    dbms_output.put_line('Girmiş olduğunuz sayı 10 dan kücüktür');
  end if;
END;
</pre>
<pre>
DECLARE
   v_harf char := '&cevap';
BEGIN
   dbms_output.put_line('Yaşınız 18 e eşitse veya 18 den büyükse Y(Yes) küçükse N(No) seçiniz.');

   if v_harf = 'Y' then
      dbms_output.put_line('Ehliyet alabilirsiniz!');
   elsif v_harf = 'N' then 
      dbms_output.put_line('Ehliyet alamazsınız!');
   else
      dbms_output.put_line('Geçerli bir değer giriniz!');
   end if;
END;
</pre>
</blockquote>
<hr></hr>

## LOOPS
<blockquote>
<p>
Döngüler belirli koşullar altında, belirli bir işlemin tekrarlanmasını sağlarlar
PL/SQL de loop, for ve while olmak üzere 3 tür döngü vardır. Ek olarak cursor içerisinde for-loop kullanılarak tablodan veri getirilir.
</p>
<pre>
DECLARE 
   v_sayi number := 1; 
BEGIN 
   loop 
      v_sayi := v_sayi + 1; 
      if v_sayi > 5 then
         exit; -- koşul sağlanırsa döngüden çıkar
      end if; 
   end loop;
   dbms_output.put_line(v_sayi); 
END; 
</pre>
<pre>
-- For döngüsü başlangıç, artış ve bitiş değerleri verilerek belirli bir ifadeyi tekrarlatmaya yarar.
DECLARE
  v_sayi number;
BEGIN
  for v_sayi in 1..50 loop
    dbms_output.put_line('Sayı ' || v_sayi);
    v_sayi := v_sayi + 5
  end loop;
END;
</pre>
<pre>
-- While döngüsü, verilen koşul yanlış olana kadar tekrar tekrar çalışır. Örneğin v_sayi 20'den büyük olduğu an koşul sağlanmayacak ve döngü son bulacaktır.
DECLARE  
  v_sayi number := 10;  
BEGIN
  while v_sayi <= 20 loop
    DBMS_OUTPUT.PUT_LINE('Sayı ' || v_sayi);
    v_sayi := v_sayi + 1;
  end loop;
END;
</pre>
<pre>
DECLARE 
-- tablo verileri
v_kitap_adi varchar2(50);
v_yazar varchar2(50);
v_yil number;
v_tur varchar2(20);
v_sayfa number;

BEGIN

 dbms_output.put_line('Kütüphanedeki kitapların listesi');  
 
 /* Kendi oluşturduğum yedincel_kutuphane adındaki tablodan verileri for kullanarak çekiyorum.
 Sizin bu kodu çalıştırmadan önce bir tablo oluşturmanız, bu tabloya veriler eklemeniz ve
 daha sonrasında kodları ona göre düzenleyip tekrardan çalıştırmanız gerekmektedir. */
 
    for f in (select kitap_adi,yazar,yil,tur,sayfa from yedincel_kutuphane) loop
    
        v_kitap_adi := f.kitap_adi;
        v_yazar := f.yazar;
        v_yil := f.yil;
        v_tur := f.tur;
        v_sayfa := f.sayfa;
        
        dbms_output.put_line(v_kitap_adi || ' - ' || v_yazar || ' - ' || v_yil);
        
        if v_tur = 'Roman' then
        dbms_output.put_line('Bu bir romandir');
        
        elsif v_tur = 'Biyografi' then
        dbms_output.put_line('Bu bir biyografidir');
        
        else
        dbms_output.put_line('Gecersiz bir turdur');
        
        end if;
         
    end loop;
 
END; 
</pre>
</blockquote>
<hr></hr>


## CURSOR

<blockquote>
<p>
Cursor tablodan veri getirmemize yarar. For loop içerisinde veya open-fetch-close yaparak
tablodan verileri çekip kullanabilmemize imkan sağlar.
</p>
<pre>
DECLARE
   CURSOR c_onay_listesi IS
      SELECT musteri_no, siparis_id, sip_durum
      FROM mo_siparis 
      WHERE siparis_id > 10300;
BEGIN
   for r in c_onay_listesi LOOP
      dbms_output.put_line('Kullanici numarasi: '|| r.musteri_no || '   ' ||'Siparis numarası: '|| 
      r.siparis_id || '   ' ||'Siparis durumu: '|| r.sip_durum);
   end loop;
END;
</pre>
</blockquote>
<hr></hr>

## PROCEDURE

<blockquote>
<p>
Komutları bir isim altında sakalyarak ihtiyaç halinde
çağırıp, komutların çalıştırılmasını sağlayan yapıdır.
</p>
<pre>
-IN
Parametre IN ile işaretliyse parametre 
sadece prosüdüre geçirilir.
-OUT
Parametre OUT ile işaretliyse parametre
dışarıya veri gönderir.
-IN OUT
Her iki özelliği birden barındırır.
</pre>
<pre>
DECLARE
   v_sayi1 NUMBER := &sayi1; -- kullanıcıdan değer aldık
   v_sayi2 NUMBER := &sayi2; -- kullanıcıdan değer aldık
   v_en_kucuk NUMBER;


   PROCEDURE ENkucuksayi (v_sayi1 IN NUMBER, v_sayi2 IN NUMBER, v_en_kucuk OUT NUMBER) IS
   BEGIN
      if v_sayi1 < v_sayi2 THEN
         v_en_kucuk := v_sayi1;
      else 
         v_en_kucuk := v_sayi2;
      end if;
   END ENkucuksayi;
   
BEGIN
   ENkucuksayi(v_sayi1, v_sayi2, v_en_kucuk);
   dbms_output.put_line('En küçük sayi: ' || v_en_kucuk); 
END;
</pre>
</blockquote>
<hr></hr>

## FUNCTIONS

<blockquote>
<p>
PL/SQL fonksiyon yapısı prosedür yapısında olduğu gibi 
komutları bir isim altında saklayarak ihtiyaç halinde 
tekrar çalıştırılmasını sağlayan yapılardır.

Fonksiyonların prosedürlerden farkı değer döndürmek 
zorunda olmasıdır.
</p>
<pre>
DECLARE
   v_sayi1 NUMBER;
   v_sayi2 NUMBER;
   v_en_buyuk NUMBER;


   FUNCTION ENbuyuksayi(v_sayi1 IN NUMBER, v_sayi2 IN NUMBER) 
   RETURN NUMBER
   IS
      v_en_buyuk NUMBER; 
   BEGIN 
      if v_sayi1 > v_sayi2 then
         v_en_buyuk:= v_sayi1; 
      else
         v_en_buyuk:= v_sayi2; 
      end if; 
      RETURN v_en_buyuk;
   END ENbuyuksayi; 

BEGIN 
   v_sayi1:= 23; 
   v_sayi2:= 45;  
   v_en_buyuk := ENbuyuksayi(v_sayi1, v_sayi2); 
   dbms_output.put_line('En büyük sayi: ' || v_en_buyuk); 
END;
</pre>
</blockquote>
<hr></hr>
