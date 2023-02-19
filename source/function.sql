DECLARE 
   v_sayi1 number; 
   v_sayi2 number; 
   v_en_buyuk number; 
   
FUNCTION ENbuyuksayi(x IN number, y IN number)  
RETURN number 
IS 
    z number; 
BEGIN 
   if x > y then
      z:= x; 
   else
      z:= y; 
   end if;
   RETURN z; 
END ENbuyuksayi; 

BEGIN 
   v_sayi1:= 23; 
   v_sayi2:= 45;  
   v_en_buyuk := ENbuyuksayi(v_sayi1, v_sayi2); 
   dbms_output.put_line('En büyük sayi: ' || v_en_buyuk); 
END;