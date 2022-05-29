/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     23/05/2022 06.52.28                          */
/*==============================================================*/


alter table DETAIL_PESANAN
   drop constraint FK_DETAIL_P_MEMILIKI_PESANAN;

alter table DETAIL_PESANAN
   drop constraint FK_DETAIL_P_MEMILIKI2_MAKANAN;

alter table MAKANAN
   drop constraint FK_MAKANAN_SEDIA_RESTORAN;

alter table PESANAN
   drop constraint FK_PESANAN_MENGANTAR_DRIVER;

alter table PESANAN
   drop constraint FK_PESANAN_RELATIONS_PEMBELI;

alter table RATING_DRIVER
   drop constraint FK_RATING_D_MENILAI3_PEMBELI;

alter table RATING_DRIVER
   drop constraint FK_RATING_D_MENILAI4_DRIVER;

alter table RATING_MAKANAN
   drop constraint FK_RATING_M_MENILAI_PEMBELI;

alter table RATING_MAKANAN
   drop constraint FK_RATING_M_MENILAI2_MAKANAN;

drop table DETAIL_PESANAN cascade constraints;

drop table DRIVER cascade constraints;

drop table MAKANAN cascade constraints;

drop table PEMBELI cascade constraints;

drop table PESANAN cascade constraints;

drop table RATING_DRIVER cascade constraints;

drop table RATING_MAKANAN cascade constraints;

drop table RESTORAN cascade constraints;

/*==============================================================*/
/* Table: DETAIL_PESANAN                                        */
/*==============================================================*/
create table DETAIL_PESANAN  (
   ID_PESANAN           VARCHAR2(10)                    not null,
   ID_MAKANAN           VARCHAR2(10)                    not null,
   constraint PK_DETAIL_PESANAN primary key (ID_PESANAN, ID_MAKANAN)
);

/*==============================================================*/
/* Table: DRIVER                                                */
/*==============================================================*/
create table DRIVER  (
   ID_DRIVER            VARCHAR2(5)                     not null,
   NAMA_DRIVER          VARCHAR2(50),
   NO_TEL_DRIVER        VARCHAR2(12),
   RATING_DRIVER        FLOAT,
   constraint PK_DRIVER primary key (ID_DRIVER)
);

/*==============================================================*/
/* Table: MAKANAN                                               */
/*==============================================================*/
create table MAKANAN  (
   ID_MAKANAN           VARCHAR2(10)                    not null,
   ID_RESTORAN          VARCHAR2(10),
   NAMA_MAKANAN         VARCHAR2(100),
   HARGA_MAKANAN        INTEGER,
   RATING_MAKANAN       FLOAT,
   constraint PK_MAKANAN primary key (ID_MAKANAN)
);

/*==============================================================*/
/* Table: PEMBELI                                               */
/*==============================================================*/
create table PEMBELI  (
   ID_PEMBELI           VARCHAR2(10)                    not null,
   NAMA_PEMBELI         VARCHAR2(50),
   ALAMAT_PEMBELI       VARCHAR2(200),
   NO_TEL_PEMBELI       VARCHAR2(12),
   EMAIL                VARCHAR2(50),
   constraint PK_PEMBELI primary key (ID_PEMBELI)
);

/*==============================================================*/
/* Table: PESANAN                                               */
/*==============================================================*/
create table PESANAN  (
   ID_PESANAN           VARCHAR2(10)                    not null,
   ID_PEMBELI           VARCHAR2(10),
   ID_DRIVER            VARCHAR2(5),
   TANGGAL_PEMESANAN    TIMESTAMP,
   TOTAL_HARGA          INTEGER,
   constraint PK_PESANAN primary key (ID_PESANAN)
);

/*==============================================================*/
/* Table: RATING_DRIVER                                         */
/*==============================================================*/
create table RATING_DRIVER  (
   ID_PEMBELI           VARCHAR2(10)                    not null,
   ID_DRIVER            VARCHAR2(5)                     not null,
   RATING_DRIVER        NUMBER(5),
   constraint PK_RATING_DRIVER primary key (ID_PEMBELI, ID_DRIVER)
);

/*==============================================================*/
/* Table: RATING_MAKANAN                                        */
/*==============================================================*/
create table RATING_MAKANAN  (
   ID_PEMBELI           VARCHAR2(10)                    not null,
   ID_MAKANAN           VARCHAR2(10)                    not null,
   RATING_MAKANAN       NUMBER(5),
   constraint PK_RATING_MAKANAN primary key (ID_PEMBELI, ID_MAKANAN)
);

/*==============================================================*/
/* Table: RESTORAN                                              */
/*==============================================================*/
create table RESTORAN  (
   ID_RESTORAN          VARCHAR2(10)                    not null,
   NAMA_RESTORAN        VARCHAR2(50),
   ALAMAT_RESTORAN      VARCHAR2(200),
   NO_TEL_RESTORAN      VARCHAR2(12),
   RATING_RESTORAN      FLOAT,
   constraint PK_RESTORAN primary key (ID_RESTORAN)
);

alter table DETAIL_PESANAN
   add constraint FK_DETAIL_P_MEMILIKI_PESANAN foreign key (ID_PESANAN)
      references PESANAN (ID_PESANAN);

alter table DETAIL_PESANAN
   add constraint FK_DETAIL_P_MEMILIKI2_MAKANAN foreign key (ID_MAKANAN)
      references MAKANAN (ID_MAKANAN);

alter table MAKANAN
   add constraint FK_MAKANAN_SEDIA_RESTORAN foreign key (ID_RESTORAN)
      references RESTORAN (ID_RESTORAN);

alter table PESANAN
   add constraint FK_PESANAN_MENGANTAR_DRIVER foreign key (ID_DRIVER)
      references DRIVER (ID_DRIVER);

alter table PESANAN
   add constraint FK_PESANAN_RELATIONS_PEMBELI foreign key (ID_PEMBELI)
      references PEMBELI (ID_PEMBELI);

alter table RATING_DRIVER
   add constraint FK_RATING_D_MENILAI3_PEMBELI foreign key (ID_PEMBELI)
      references PEMBELI (ID_PEMBELI);

alter table RATING_DRIVER
   add constraint FK_RATING_D_MENILAI4_DRIVER foreign key (ID_DRIVER)
      references DRIVER (ID_DRIVER);

alter table RATING_MAKANAN
   add constraint FK_RATING_M_MENILAI_PEMBELI foreign key (ID_PEMBELI)
      references PEMBELI (ID_PEMBELI);

alter table RATING_MAKANAN
   add constraint FK_RATING_M_MENILAI2_MAKANAN foreign key (ID_MAKANAN)
      references MAKANAN (ID_MAKANAN);