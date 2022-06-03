-- Procedure Hitung Rating Driver

create or replace procedure calculate_rating_driver(id_driver1 in varchar2)
   as
   begin
      update DRIVER
         set RATING_DRIVER = (select round(avg(RATING_DRIVER),2)
                              from C_RATING_DRIVER
                              where ID_DRIVER = id_driver1)
      where ID_DRIVER = id_driver1;
   end;
/

-- Procedure Hitung Rating Makanan 

create or replace procedure calculate_rating_makanan(id_makanan1 in varchar2)
   as
   begin
      update MAKANAN
         set RATING_MAKANAN = (select round(avg(RATING_MAKANAN),2)
                              from C_RATING_MAKANAN
                              where ID_MAKANAN = id_makanan1)
      where ID_MAKANAN = id_makanan1;
   end;
/

-- Procedure untuk menambah data pada tabel

create or replace procedure add_rating_driver(id_pembeli in varchar2, id_driver in varchar2, rating in number)
   as
   begin
      insert into RATING_DRIVER values (id_pembeli, id_driver, rating);
   end;
/

create or replace procedure add_rating_makanan(id_pembeli in varchar2, id_makanan in varchar2, rating in number)
   as
   begin
      insert into RATING_MAKANAN values (id_pembeli, id_makanan, rating);
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



