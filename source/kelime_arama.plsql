DECLARE
  v_cumle varchar2(100);
  v_aranan_kelime varchar2(20);
  v_sonuc boolean := false;
BEGIN
  v_cumle := '&cumle';
  v_aranan_kelime := '&kelime';
  
  for v_sayi in 1..length(v_cumle) loop
    if substr(v_cumle, v_sayi, length(v_aranan_kelime)) = v_aranan_kelime then
      v_sonuc := true;
      exit;
    end if;
  end loop;
  
  if v_sonuc then
    dbms_output.put_line(v_cumle || ' c�mlesi i�inde ' || v_aranan_kelime || ' kelimesi ge�mektedir.');
  else
    dbms_output.put_line(v_cumle || ' c�mlesi i�inde ' || v_aranan_kelime || ' kelimesi ge�memektedir!');
  end if;
END;
