-- Trigger Rating Driver

create or replace trigger rating_driver_trigger
   after insert or update or delete on RATING_DRIVER
   for each row
   begin
      insert into C_RATING_DRIVER values (:new.ID_PEMBELI, :new.ID_DRIVER, :new.RATING_DRIVER);
      calculate_rating_driver(:new.ID_DRIVER);
   end;
/

-- Trigger Rating Makanan

create or replace trigger rating_makanan_trigger
   after insert or update or delete on RATING_MAKANAN
   for each row
   begin
      insert into C_RATING_MAKANAN values (:new.ID_PEMBELI, :new.ID_MAKANAN, :new.RATING_MAKANAN);
      calculate_rating_makanan(:new.ID_MAKANAN);
   end;
/
-- Trigger Hitung Harga Makanan

create or replace trigger harga_makanan_trigger
   after insert on DETAIL_PESANAN
   for each row
   begin
      insert into C_DETAIL_PESANAN values (:new.ID_PESANAN, :new.ID_MAKANAN, :new.JUMLAH_MAKANAN);
      update PESANAN
         set TOTAL_HARGA = calculate_harga_makanan(:new.ID_PESANAN)
      where ID_PESANAN = :new.ID_PESANAN;
   end;
/