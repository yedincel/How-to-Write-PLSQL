DECLARE 
-- tablo verileri
v_kitap_adi varchar2(50);
v_yazar varchar2(50);
v_yil number;
v_tur varchar2(20);
v_sayfa number;
-- sayac ve sayi verileri
v_sayi number:=0;
v_sayac number:=&sayac; 

BEGIN
/*Bu kodun çalýþmasý için yedincel_kutuphane adýndaki tabloya ihtiyaç vardýr.
Sizin veri tabanýnýzda bu tablo olmadýðý için benzer þekilde kendi tablonuzu oluþturup, 
verileri ekleyin ve kodlarý ona göre ayarlayýp tekrar çalýþtýrýn */

while v_sayi < v_sayac loop

 dbms_output.put_line('Kütüphanedeki kitaplarýn listesi');
 
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
    
    dbms_output.put_line('********************************');
    v_sayi := v_sayi+1;
    
end loop;

END; 