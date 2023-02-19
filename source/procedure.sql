DECLARE
v_sayi1 number;
v_sayi2 number;
v_en_kucuk number;

PROCEDURE ENkucuk(v_sayi1 IN number, v_sayi2 IN number, v_en_kucuk OUT number) IS

BEGIN
if v_sayi1 < v_sayi2 then
v_en_kucuk := v_sayi1;

else
v_en_kucuk := v_sayi2;

end if;

END ENkucuk;

BEGIN
v_sayi1:= 10;
v_sayi2:= 20;
ENkucuk(v_sayi1, v_sayi2, v_en_kucuk);

dbms_output.put_line('En kucuk sayi: ' || v_en_kucuk);
END;