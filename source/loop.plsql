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
/*Bu kodun �al��mas� i�in yedincel_kutuphane ad�ndaki tabloya ihtiya� vard�r.
Sizin veri taban�n�zda bu tablo olmad��� i�in benzer �ekilde kendi tablonuzu olu�turup, 
verileri ekleyin ve kodlar� ona g�re ayarlay�p tekrar �al��t�r�n */

while v_sayi < v_sayac loop

 dbms_output.put_line('K�t�phanedeki kitaplar�n listesi');
 
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