-- Function Hitung Total Harga Pesanan

create or replace function calculate_harga_makanan(id_pesanan1 in varchar2)
   return INTEGER as
        total INTEGER := 0;
        i INTEGER;
        cursor c_makanan is
           select HARGA_MAKANAN*JUMLAH_MAKANAN
           from C_DETAIL_PESANAN join MAKANAN on C_DETAIL_PESANAN.ID_MAKANAN = MAKANAN.ID_MAKANAN
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