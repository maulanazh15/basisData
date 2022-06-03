create table C_RATING_DRIVER  (
   ID_PEMBELI           VARCHAR2(10)                    not null,
   ID_DRIVER            VARCHAR2(5)                     not null,
   RATING_DRIVER        NUMBER(5),
   constraint PK_C_RATING_DRIVER primary key (ID_PEMBELI, ID_DRIVER)
);

create table C_RATING_MAKANAN  (
   ID_PEMBELI           VARCHAR2(10)                    not null,
   ID_MAKANAN           VARCHAR2(10)                    not null,
   RATING_MAKANAN       NUMBER(5),
   constraint PK_C_RATING_MAKANAN primary key (ID_PEMBELI, ID_MAKANAN)
);

create table C_DETAIL_PESANAN  (
   ID_PESANAN           VARCHAR2(10)                    not null,
   ID_MAKANAN           VARCHAR2(10)                    not null,
   JUMLAH_MAKANAN       NUMBER(2),
   constraint PK_C_DETAIL_PESANAN primary key (ID_PESANAN, ID_MAKANAN)
);

