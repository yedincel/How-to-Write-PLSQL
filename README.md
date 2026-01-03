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
<img style="width:700px; heigth:500px" src="https://github.com/yedincel/How-to-Write-PLSQL/blob/main/images/SQL.png?raw=true"></img>
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

> Operatörler, değişkenler ve değerler üzerinde işlemler yapmamızı sağlayan sembollerdir.
> PL/SQL'de aritmetik, karşılaştırma, mantıksal ve string operatörleri bulunmaktadır.

### Aritmetik Operatörler

> Sayısal değerler üzerinde matematiksel işlemler yapmak için kullanılır.

| Operatör | Açıklama | Örnek |
|----------|----------|-------|
| + | Toplama | 5 + 3 = 8 |
| - | Çıkarma | 5 - 3 = 2 |
| * | Çarpma | 5 * 3 = 15 |
| / | Bölme | 10 / 2 = 5 |
| ** | Üs alma | 2 ** 3 = 8 |
| MOD | Mod alma (kalan) | MOD(10, 3) = 1 |

```sql
-- Aritmetik operatör örnekleri
DECLARE
  v_sayi1 NUMBER := 10;
  v_sayi2 NUMBER := 3;
  v_sonuc NUMBER;
BEGIN
  v_sonuc := v_sayi1 + v_sayi2;
  dbms_output.put_line('Toplama: ' || v_sonuc);
  
  v_sonuc := v_sayi1 - v_sayi2;
  dbms_output.put_line('Çıkarma: ' || v_sonuc);
  
  v_sonuc := v_sayi1 * v_sayi2;
  dbms_output.put_line('Çarpma: ' || v_sonuc);
  
  v_sonuc := v_sayi1 / v_sayi2;
  dbms_output.put_line('Bölme: ' || v_sonuc);
  
  v_sonuc := v_sayi1 ** v_sayi2;
  dbms_output.put_line('Üs alma: ' || v_sonuc);
  
  v_sonuc := MOD(v_sayi1, v_sayi2);
  dbms_output.put_line('Mod: ' || v_sonuc);
END;
```

```sql
-- Kullanıcıdan iki sayı alıp toplama işlemi yapma
DECLARE
  v_sayi1 NUMBER := &sayi1;
  v_sayi2 NUMBER := &sayi2;
  v_toplam NUMBER;
BEGIN
  v_toplam := v_sayi1 + v_sayi2;
  dbms_output.put_line(v_sayi1 || ' + ' || v_sayi2 || ' = ' || v_toplam);
END;
```

---

### Karşılaştırma Operatörleri

> İki değeri karşılaştırmak için kullanılır. Sonuç olarak TRUE veya FALSE döner.

| Operatör | Açıklama | Örnek |
|----------|----------|-------|
| = | Eşittir | 5 = 5 (TRUE) |
| != veya <> | Eşit değildir | 5 != 3 (TRUE) |
| > | Büyüktür | 5 > 3 (TRUE) |
| < | Küçüktür | 3 < 5 (TRUE) |
| >= | Büyük eşittir | 5 >= 5 (TRUE) |
| <= | Küçük eşittir | 3 <= 5 (TRUE) |

```sql
-- Karşılaştırma operatörü örnekleri
DECLARE
  v_yas NUMBER := &yas;
BEGIN
  if v_yas >= 18 then
    dbms_output.put_line('Ehliyet alabilirsiniz');
  else
    dbms_output.put_line('Ehliyet alamazsınız');
  end if;
END;
```

```sql
-- İki sayıyı karşılaştırma
DECLARE
  v_sayi1 NUMBER := &sayi1;
  v_sayi2 NUMBER := &sayi2;
BEGIN
  if v_sayi1 = v_sayi2 then
    dbms_output.put_line('Sayılar eşittir');
  elsif v_sayi1 > v_sayi2 then
    dbms_output.put_line(v_sayi1 || ' büyüktür ' || v_sayi2);
  else
    dbms_output.put_line(v_sayi1 || ' küçüktür ' || v_sayi2);
  end if;
END;
```

```sql
-- Kullanıcı giriş kontrolü
DECLARE
  v_kullanici VARCHAR2(20) := '&kullanici';
  v_sifre VARCHAR2(20) := '&sifre';
BEGIN
  if v_kullanici = 'admin' AND v_sifre = '12345' then
    dbms_output.put_line('Giriş başarılı!');
  else
    dbms_output.put_line('Kullanıcı adı veya şifre hatalı!');
  end if;
END;
```

---

### Mantıksal Operatörler

> Birden fazla koşulu birleştirmek veya tersine çevirmek için kullanılır.

| Operatör | Açıklama | Örnek |
|----------|----------|-------|
| AND | Ve - Her iki koşul da doğru olmalı | (5 > 3) AND (10 > 5) → TRUE |
| OR | Veya - Koşullardan en az biri doğru olmalı | (5 > 3) OR (10 < 5) → TRUE |
| NOT | Değil - Koşulu tersine çevirir | NOT (5 > 3) → FALSE |

```sql
-- AND operatörü örneği
DECLARE
  v_yas NUMBER := &yas;
  v_ehliyet CHAR := '&ehliyet'; -- Y veya N
BEGIN
  if v_yas >= 18 AND v_ehliyet = 'Y' then
    dbms_output.put_line('Araba kiralayabilirsiniz');
  else
    dbms_output.put_line('Araba kiralayamazsınız');
  end if;
END;
```

```sql
-- OR operatörü örneği
DECLARE
  v_gun VARCHAR2(10) := '&gun';
BEGIN
  if v_gun = 'Cumartesi' OR v_gun = 'Pazar' then
    dbms_output.put_line('Hafta sonu! Tatil günü');
  else
    dbms_output.put_line('Hafta içi! Çalışma günü');
  end if;
END;
```

```sql
-- NOT operatörü örneği
DECLARE
  v_uye BOOLEAN := FALSE;
BEGIN
  if NOT v_uye then
    dbms_output.put_line('Üye değilsiniz. Lütfen kayıt olun!');
  else
    dbms_output.put_line('Hoş geldiniz!');
  end if;
END;
```

```sql
-- Karmaşık mantıksal operatör örneği
DECLARE
  v_not NUMBER := &not;
  v_devamsizlik NUMBER := &devamsizlik;
BEGIN
  if (v_not >= 50 AND v_devamsizlik < 5) OR v_not >= 85 then
    dbms_output.put_line('Dersten geçtiniz!');
  else
    dbms_output.put_line('Dersten kaldınız!');
  end if;
END;
```

---

### String (Birleştirme) Operatörleri

> String (metin) değerleri birleştirmek için kullanılır.

| Operatör | Açıklama | Örnek |
|----------|----------|-------|
| \|\| | İki string'i birleştirir | 'Merhaba' \|\| ' Dünya' → 'Merhaba Dünya' |
| CONCAT() | İki string'i birleştirir (fonksiyon) | CONCAT('Merhaba', ' Dünya') → 'Merhaba Dünya' |

```sql
-- String birleştirme örneği
DECLARE
  v_ad VARCHAR2(20) := '&ad';
  v_soyad VARCHAR2(20) := '&soyad';
  v_tam_ad VARCHAR2(50);
BEGIN
  v_tam_ad := v_ad || ' ' || v_soyad;
  dbms_output.put_line('Adınız Soyadınız: ' || v_tam_ad);
END;
```

```sql
-- CONCAT fonksiyonu ile birleştirme
DECLARE
  v_sehir VARCHAR2(20) := 'İstanbul';
  v_ulke VARCHAR2(20) := 'Türkiye';
BEGIN
  dbms_output.put_line(CONCAT(CONCAT(v_sehir, ', '), v_ulke));
  -- Alternatif: || operatörü daha pratik
  dbms_output.put_line(v_sehir || ', ' || v_ulke);
END;
```

```sql
-- Çoklu birleştirme örneği
DECLARE
  v_isim VARCHAR2(20) := 'Ahmet';
  v_yas NUMBER := 25;
  v_sehir VARCHAR2(20) := 'Ankara';
BEGIN
  dbms_output.put_line(v_isim || ' ' || v_yas || ' yaşında ve ' || v_sehir || ' şehrinde yaşıyor.');
END;
```

---

### Özel Operatörler

> Belirli durumlarda kullanılan özel operatörlerdir.

#### IS NULL / IS NOT NULL

> Bir değişkenin NULL olup olmadığını kontrol eder.

```sql
DECLARE
  v_maas NUMBER := NULL;
BEGIN
  if v_maas IS NULL then
    dbms_output.put_line('Maaş bilgisi girilmemiş');
  else
    dbms_output.put_line('Maaş: ' || v_maas);
  end if;
END;
```

#### BETWEEN

> Bir değerin iki değer arasında olup olmadığını kontrol eder.

```sql
DECLARE
  v_not NUMBER := &not;
BEGIN
  if v_not BETWEEN 50 AND 70 then
    dbms_output.put_line('Notunuz orta seviyede');
  elsif v_not BETWEEN 71 AND 85 then
    dbms_output.put_line('Notunuz iyi seviyede');
  elsif v_not BETWEEN 86 AND 100 then
    dbms_output.put_line('Notunuz çok iyi seviyede');
  else
    dbms_output.put_line('Notunuz yetersiz');
  end if;
END;
```

#### IN

> Bir değerin belirli değerler listesinde olup olmadığını kontrol eder.

```sql
DECLARE
  v_sehir VARCHAR2(20) := '&sehir';
BEGIN
  if v_sehir IN ('İstanbul', 'Ankara', 'İzmir') then
    dbms_output.put_line(v_sehir || ' büyük şehirlerden biridir');
  else
    dbms_output.put_line(v_sehir || ' küçük veya orta ölçekli bir şehirdir');
  end if;
END;
```

#### LIKE

> String değerlerde pattern (desen) eşleştirmesi yapar.
> % → Sıfır veya daha fazla karakter
> _ → Tek bir karakter

```sql
DECLARE
  v_isim VARCHAR2(20) := '&isim';
BEGIN
  if v_isim LIKE 'A%' then
    dbms_output.put_line('İsminiz A harfi ile başlıyor');
  elsif v_isim LIKE '%t' then
    dbms_output.put_line('İsminiz t harfi ile bitiyor');
  elsif v_isim LIKE '%me%' then
    dbms_output.put_line('İsminizde "me" geçiyor');
  else
    dbms_output.put_line('İsminiz farklı bir yapıda');
  end if;
END;
```

---

### Öncelik Sırası

> Operatörlerin çalışma önceliği aşağıdaki gibidir (yukarıdan aşağıya):

1. ** (Üs alma)
2. +, - (İşaret: pozitif/negatif)
3. *, / (Çarpma, Bölme)
4. +, -, || (Toplama, Çıkarma, Birleştirme)
5. =, !=, <, >, <=, >=, IS NULL, LIKE, BETWEEN, IN
6. NOT
7. AND
8. OR

```sql
-- Öncelik sırası örneği
DECLARE
  v_sonuc NUMBER;
BEGIN
  v_sonuc := 10 + 5 * 2;
  dbms_output.put_line('10 + 5 * 2 = ' || v_sonuc); -- Sonuç: 20 (önce çarpma)
  
  v_sonuc := (10 + 5) * 2;
  dbms_output.put_line('(10 + 5) * 2 = ' || v_sonuc); -- Sonuç: 30 (önce parantez)
END;
```

```sql
-- Karmaşık öncelik örneği
DECLARE
  v_a NUMBER := 5;
  v_b NUMBER := 10;
  v_c NUMBER := 3;
BEGIN
  if v_a > 3 AND v_b < 15 OR v_c = 3 then
    -- Önce AND, sonra OR değerlendirilir
    dbms_output.put_line('Koşul sağlandı');
  end if;
  
  -- Parantez kullanarak önceliği değiştirme
  if v_a > 3 AND (v_b < 15 OR v_c = 3) then
    dbms_output.put_line('Parantezli koşul sağlandı');
  end if;
END;
```

---

### Pratik Örnekler

```sql
-- Hesap makinesi uygulaması
DECLARE
  v_sayi1 NUMBER := &sayi1;
  v_sayi2 NUMBER := &sayi2;
  v_islem CHAR := '&islem'; -- +, -, *, /
  v_sonuc NUMBER;
BEGIN
  if v_islem = '+' then
    v_sonuc := v_sayi1 + v_sayi2;
  elsif v_islem = '-' then
    v_sonuc := v_sayi1 - v_sayi2;
  elsif v_islem = '*' then
    v_sonuc := v_sayi1 * v_sayi2;
  elsif v_islem = '/' then
    if v_sayi2 != 0 then
      v_sonuc := v_sayi1 / v_sayi2;
    else
      dbms_output.put_line('Hata: Sıfıra bölme yapılamaz!');
      RETURN;
    end if;
  else
    dbms_output.put_line('Geçersiz işlem!');
    RETURN;
  end if;
  
  dbms_output.put_line(v_sayi1 || ' ' || v_islem || ' ' || v_sayi2 || ' = ' || v_sonuc);
END;
```

```sql
-- VKI (Vücut Kitle İndeksi) hesaplama
DECLARE
  v_kilo NUMBER := &kilo;
  v_boy NUMBER := &boy; -- metre cinsinden (örn: 1.75)
  v_vki NUMBER;
BEGIN
  v_vki := v_kilo / (v_boy ** 2);
  
  dbms_output.put_line('VKI: ' || ROUND(v_vki, 2));
  
  if v_vki < 18.5 then
    dbms_output.put_line('Zayıf');
  elsif v_vki BETWEEN 18.5 AND 24.9 then
    dbms_output.put_line('Normal');
  elsif v_vki BETWEEN 25 AND 29.9 then
    dbms_output.put_line('Fazla kilolu');
  else
    dbms_output.put_line('Obez');
  end if;
END;
```

```sql
-- E-posta doğrulama kontrolü
DECLARE
  v_email VARCHAR2(50) := '&email';
BEGIN
  if v_email LIKE '%@%.%' AND 
     v_email NOT LIKE '@%' AND 
     v_email NOT LIKE '%@' then
    dbms_output.put_line('Geçerli bir e-posta adresi');
  else
    dbms_output.put_line('Geçersiz e-posta adresi!');
  end if;
END;
```

---

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
