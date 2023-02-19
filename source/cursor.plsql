DECLARE

   CURSOR cur_onay_listesi IS
    SELECT
    m.musteri_no,
    m.eposta,
    mto.onay,
    decode(mto.text_kod,11,'SMS',12,'TELEFON',13,'EPOSTA') text_kod
    
    FROM
    depo.mo_musteri m,
    depo.mo_text_onay mto
    
    WHERE m.musteri_no = mto.musteri_no
      and mto.text_kod IN (11,12,13) -- sms / telefon / eposta
      and m.eposta is not null -- epostasi dolu olmali 
      and m.musteri_no > 100700
    ORDER BY musteri_no, eposta, text_kod, onay; 
    
BEGIN
        for r in cur_onay_listesi  loop
        dbms_output.put_line('Musteri no: ' || r.musteri_no ||'     '|| 'E-posta: ' ||r.eposta ||'     '||'Text onay: '|| r.onay ||'    '||'Text kod: '|| r.text_kod);
        end loop;
END;	  