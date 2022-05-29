
create or replace procedure calculate_rating_driver(id_driver1 in varchar2)
   as
   begin
      update DRIVER
         set RATING_DRIVER = (select round(avg(RATING_DRIVER),2)
                              from RATING_DRIVER
                              where ID_DRIVER = id_driver1)
      where ID_DRIVER = id_driver1;
   end;
/

create or replace procedure calculate_rating_makanan(id_makanan1 in varchar2)
   as
   begin
      update MAKANAN
         set RATING_MAKANAN = (select round(avg(RATING_MAKANAN),2)
                              from RATING_MAKANAN
                              where ID_MAKANAN = id_makanan1)
      where ID_MAKANAN = id_makanan1;
   end;
/

create or replace function calculate_harga_makanan(id_pesanan1 in varchar2)
   return INTEGER as
        total INTEGER := 0;
        i INTEGER;
        cursor c_makanan is
           select HARGA_MAKANAN*JUMLAH_MAKANAN
           from DETAIL_PESANAN join MAKANAN on DETAIL_PESANAN.ID_MAKANAN = MAKANAN.ID_MAKANAN
           where ID_PESANAN = id_pesanan1;
   begin
        open c_makanan;
        loop
           fetch c_makanan into i;
           exit when c_makanan%notfound;
           total := total + i;
        end loop;
        close c_makanan;
        return total; 
   end;
/

create or replace procedure calculate_rating_restoran(id_restoran1 in varchar2)
   as
   begin
      update RESTORAN
         set RATING_RESTORAN = (select round(avg(RATING_MAKANAN),2)
                              from MAKANAN
                              where ID_RESTORAN = id_restoran1)
      where ID_RESTORAN = id_restoran1;
   end;
/

create or replace trigger rating_driver_trigger
   after insert or update or delete on RATING_DRIVER
   for each row
   begin
      calculate_rating_driver(:new.ID_DRIVER);
   end;
/

create or replace trigger rating_makanan_trigger
   after insert or update or delete on RATING_MAKANAN
   for each row
   begin
      calculate_rating_makanan(:new.ID_MAKANAN);
   end;
/

create or replace trigger rating_restoran_trigger
   after insert or update or delete on MAKANAN
   for each row
   begin
      calculate_rating_restoran(:new.ID_RESTORAN);
   end;
/

create or replace trigger harga_makanan_trigger
   after insert on DETAIL_PESANAN
   for each row
   begin
      update PESANAN
         set TOTAL_HARGA = calculate_harga_makanan(:new.ID_PESANAN)
      where ID_PESANAN = :new.ID_PESANAN;
   end;
/

create or replace procedure add_rating_driver(id_pembeli in varchar2, id_driver in varchar2, rating in number)
   as
   begin
      insert into RATING_DRIVER values (id_pembeli, id_driver, rating);
      calculate_rating_driver(id_driver);
   end;

/

create or replace procedure add_rating_makanan(id_pembeli in varchar2, id_makanan in varchar2, rating in number)
   as
   begin
      insert into RATING_MAKANAN values (id_pembeli, id_makanan, rating);
      calculate_rating_makanan(id_makanan);
      calculate_rating_restoran(select ID_RESTORAN from MAKANAN where ID_MAKANAN = id_makanan);
   end;
/

create or replace procedure add_pembeli(nama_pembeli in varchar2, alamat_pembeli in varchar2, no_tel_pembeli in varchar2, email in varchar2)
   as
   begin
      insert into PEMBELI values ('PBLI' || PEMBELI_SEQ.nextval , nama_pembeli, alamat_pembeli, no_tel_pembeli, email);
   end;
/

create or replace procedure add_driver(nama_driver in varchar2, no_tel_driver in varchar2)
   as
   begin
      insert into DRIVER(id_driver, nama_driver, no_tel_driver) values ('DRV' || DRIVER_SEQ.nextval, nama_driver, no_tel_driver);
   end;
/

create or replace procedure add_restoran(nama_restoran in varchar2, alamat_restoran in varchar2, no_tel_restoran in varchar2)
   as
   begin
      insert into RESTORAN(id_restoran, nama_restoran, alamat_restoran, no_tel_restoran) values ('RSTRN'|| RESTORAN_SEQ.nextval, nama_restoran, alamat_restoran, no_tel_restoran);
   end;
/

create or replace procedure add_makanan(nama_makanan in varchar2, harga_makanan in number, id_restoran in varchar2)
   as
   begin
      insert into MAKANAN(id_makanan, nama_makanan, harga_makanan, id_restoran) values ('MKN'|| MAKANAN_SEQ.nextval, nama_makanan, harga_makanan, id_restoran);
   end;
/

create or replace procedure add_pesanan(id_pembeli in varchar2, id_driver in varchar2)
   as
   begin
      insert into PESANAN(id_pesanan, id_pembeli, id_driver, tanggal_pemesanan) values ('PSN'|| PESANAN_SEQ.nextval, id_pembeli, id_driver, systimestamp);
   end;
/

create or replace procedure add_detail_pesanan(id_pesanan in varchar2, id_makanan in varchar2, jumlah_makanan in number)
   as
   begin
      insert into DETAIL_PESANAN(id_pesanan, id_makanan, jumlah_makanan) values (id_pesanan, id_makanan, jumlah_makanan);
   end;
/



