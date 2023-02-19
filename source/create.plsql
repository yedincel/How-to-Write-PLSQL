CREATE TABLE "LIVE"."MUS_SIPARIS" -- M��teri sipari�lerinin tutuldu�u bir tablo create ettik.
-- PCTFREE, PCTUSED, INITIRANS gibi �zelliklerin a��klamas�n� a�a��daki b�l�me ekledim.
   (	
    "FIS_TUR" NUMBER(3,0) CONSTRAINT "NN_SH_FISTUR" NOT NULL ENABLE, 
	"FIS_NO" NUMBER(6,0) CONSTRAINT "NN_SH_FISNO" NOT NULL ENABLE, 
	"FIS_TRH" DATE CONSTRAINT "NN_SH_FISTRH" NOT NULL ENABLE, 
	"MAL_NO" VARCHAR2(8 BYTE) CONSTRAINT "NN_SH_MALNO" NOT NULL ENABLE, 
	"IRS_NO" NUMBER(6,0), 
	"IRS_TRH" DATE, 
	"MALVEREN" VARCHAR2(6 BYTE), 
	"MIKTAR" NUMBER(10,3)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
 TABLESPACE "LIVE";


/*
-PCTFREE: Yeni bir sayfa olu�turuldu�unda, tablodaki veri bloklar�n�n bo�luk y�zdesini belirler. �rne�in, PCTFREE 10, her yeni sayfada verilerin %10'unu bo� b�rak�r. Bu �zellik, verilerin g�ncellenmesi veya yeni verilerin ekleme i�lemleri gibi veri de�i�ikliklerinin s�k oldu�u durumlarda kullan�l�r.

-PCTUSED: Veri bloklar�n�n bo� alan�n� doldurmak i�in kullan�lan bir e�ik de�er belirler. �rne�in, PCTUSED 40, her veri blo�unda en az %40 doluluk oran� sa�lar. Bu �zellik, veri de�i�ikliklerinin daha az oldu�u, okuma i�lemlerinin daha yo�un oldu�u durumlarda kullan�l�r.

-INITRANS: �lk yararl� i�lemi ba�latan veritaban� i�lemi say�s�n� belirler. Yararl� i�lemler, bir veri blo�una yap�lan okuma veya yazma i�lemleridir. INITRANS 1, her bir veri blo�u i�in yaln�zca bir yararl� i�lem yap�lmas�n� sa�lar.

-MAXTRANS: Bir veri blo�undaki maksimum yararl� i�lem say�s�n� belirler. Bu �zellik, veri bloklar�ndaki yararl� i�lemlerin say�s�n� kontrol etmek ve a��r� y�klemeden ka��nmak i�in kullan�l�r.

-NOCOMPRESS: Tablodaki verilerin s�k��t�r�lmas�n� engeller.

-LOGGING: Veri de�i�ikliklerinin log dosyalar�nda kaydedilmesini sa�lar. Bu �zellik, veri kayb�n� �nlemek ve kurtarma i�lemleri i�in yedekleme olu�turmak i�in kullan�l�r.

-TABLESPACE: Tablonun olu�turulaca�� tablespace ad�n� belirler. Tablespace, veritaban�nda verilerin depoland��� fiziksel bir b�l�md�r. Tablonun olu�turulaca�� tablespace, tablonun boyutuna, veri eri�im s�kl���na ve yedekleme ihtiya�lar�na ba�l� olarak se�ilir.
*/