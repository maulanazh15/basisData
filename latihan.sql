Create or replace function hitung_metode_pembayaran(metode_bayar in varchar2)  
	Return integer as
		jumlah integer;
		cursor c_jumlah is select count(*) from pembayaran where metode_pembayaran=metode_bayar;
    Begin 
        Open c_jumlah;
            Fetch c_jumlah into jumlah;
            Return jumlah;
        Close c_jumlah;
end;
/  

Insert into jumlah_metode_pembayaran(metode_pembayaran) values('kredit');
Insert into jumlah_metode_pembayaran(metode_pembayaran) values('debit');

