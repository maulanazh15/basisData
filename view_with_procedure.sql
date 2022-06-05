
create or replace view info_pesanan as 
select id_pesanan, nama_pembeli,nama_driver,alamat_pembeli, tanggal_pemesanan, total_harga 
        from pesanan join pembeli on pesanan.id_pembeli = pembeli.id_pembeli 
        join driver on pesanan.id_driver = driver.id_driver;
