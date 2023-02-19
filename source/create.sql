CREATE TABLE "LIVE"."MUS_SIPARIS" -- Müþteri sipariþlerinin tutulduðu bir tablo create ettik.
-- PCTFREE, PCTUSED, INITIRANS gibi özelliklerin açýklamasýný aþaðýdaki bölüme ekledim.
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
-PCTFREE: Yeni bir sayfa oluþturulduðunda, tablodaki veri bloklarýnýn boþluk yüzdesini belirler. Örneðin, PCTFREE 10, her yeni sayfada verilerin %10'unu boþ býrakýr. Bu özellik, verilerin güncellenmesi veya yeni verilerin ekleme iþlemleri gibi veri deðiþikliklerinin sýk olduðu durumlarda kullanýlýr.

-PCTUSED: Veri bloklarýnýn boþ alanýný doldurmak için kullanýlan bir eþik deðer belirler. Örneðin, PCTUSED 40, her veri bloðunda en az %40 doluluk oraný saðlar. Bu özellik, veri deðiþikliklerinin daha az olduðu, okuma iþlemlerinin daha yoðun olduðu durumlarda kullanýlýr.

-INITRANS: Ýlk yararlý iþlemi baþlatan veritabaný iþlemi sayýsýný belirler. Yararlý iþlemler, bir veri bloðuna yapýlan okuma veya yazma iþlemleridir. INITRANS 1, her bir veri bloðu için yalnýzca bir yararlý iþlem yapýlmasýný saðlar.

-MAXTRANS: Bir veri bloðundaki maksimum yararlý iþlem sayýsýný belirler. Bu özellik, veri bloklarýndaki yararlý iþlemlerin sayýsýný kontrol etmek ve aþýrý yüklemeden kaçýnmak için kullanýlýr.

-NOCOMPRESS: Tablodaki verilerin sýkýþtýrýlmasýný engeller.

-LOGGING: Veri deðiþikliklerinin log dosyalarýnda kaydedilmesini saðlar. Bu özellik, veri kaybýný önlemek ve kurtarma iþlemleri için yedekleme oluþturmak için kullanýlýr.

-TABLESPACE: Tablonun oluþturulacaðý tablespace adýný belirler. Tablespace, veritabanýnda verilerin depolandýðý fiziksel bir bölümdür. Tablonun oluþturulacaðý tablespace, tablonun boyutuna, veri eriþim sýklýðýna ve yedekleme ihtiyaçlarýna baðlý olarak seçilir.
*/