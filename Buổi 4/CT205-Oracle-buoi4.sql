--############################### Buoi 4    #################################
--------------------------------- Bai tap 12 ---------------------------------
CREATE TABLE NhaXB (
    MaNXB char(4) NOT NULL CONSTRAINT PK_NXB PRIMARY KEY
    CHECK (MaNXB IN ('1389', '0736', '0877', '1622', '1756')
    or regexp_like(MaNXB,'[A-Z]9[1-9]\d')),
    TenNXB varchar2(40) NULL,
    ThPho varchar2(20) NULL,
    QGia varchar2(30) DEFAULT 'VietNam' NULL 
);
-- ORA-02290: check constraint (B1510210.SYS_C0073598) violated
insert into NhaXB (manxb, tennxb,thpho)
values('9980','NXB Van Hoa 1', 'TP HCM');
--
insert into NhaXB (manxb, tennxb,thpho)
values('1389','NXB Van Hoa 1', 'TP HCM');
--------------------------------- Bai tap 13 ---------------------------------
-----Create DONVI, KH, LOAIBH, TENBH
--------------------------------------------------------
--  File created - Tuesday-October-27-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table DONVI
--------------------------------------------------------

CREATE TABLE DONVI (MADV CHAR(4), TENDV CHAR(20), DCHI CHAR(20), TEL CHAR(8));
--------------------------------------------------------
--  DDL for Table KH
--------------------------------------------------------

CREATE TABLE KH (MAKH CHAR(4), HOTEN CHAR(19), NAMSINH NUMBER(*,0), MADV CHAR(4), PHAI NUMBER(*,0));
--------------------------------------------------------
--  DDL for Table LOAIBH
--------------------------------------------------------

CREATE TABLE LOAIBH (MALOAI CHAR(2), TENLOAI CHAR(15), MUCPHI NUMBER(*,0));
--------------------------------------------------------
--  DDL for Table THEBH
--------------------------------------------------------

CREATE TABLE THEBH (MALOAI CHAR(2), NGAYBD DATE, MAKH CHAR(4), THOIHAN NUMBER(*,0));

---------------------------------------------------
--   DATA FOR TABLE DONVI
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DONVI
Insert into DONVI (MADV,TENDV,DCHI,TEL) values ('A01 ','DAI TRUYEN HINH     ','2 HAI BA TRUNG      ','38324235');
Insert into DONVI (MADV,TENDV,DCHI,TEL) values ('A02 ','SO KHOA HOC CNMT    ','7 NGUYEN TRAI       ','38456312');
Insert into DONVI (MADV,TENDV,DCHI,TEL) values ('B01 ','SO DIEN LUC         ','18 TRAN HUNG DAO    ','38125894');
Insert into DONVI (MADV,TENDV,DCHI,TEL) values ('B02 ','XI NGHIEP DUOC      ','55 LE LOI           ','38247666');
Insert into DONVI (MADV,TENDV,DCHI,TEL) values ('B03 ','TRUNG TAM NANG LUONG','19 LANH BINH THANG  ','38345311');
Insert into DONVI (MADV,TENDV,DCHI,TEL) values ('B04 ','CTY XO SO KT CAN THO','20 NAM KY KHOI NGHIA','38324123');
Insert into DONVI (MADV,TENDV,DCHI,TEL) values ('B05 ','CANG CAN THO        ','108 CMT8            ','38124341');
Insert into DONVI (MADV,TENDV,DCHI,TEL) values ('A03 ','TOA AN NHAN DAN TINH','75 PHAN DINH PHUNG  ','38034219');
Insert into DONVI (MADV,TENDV,DCHI,TEL) values ('A04 ','TRUONG PTTH C.V.LIEM','2 XO VIET NGHE TINH ','38325664');
Insert into DONVI (MADV,TENDV,DCHI,TEL) values ('A05 ','SO TU PHAP          ','10 HOA BINH         ','38259987');

---------------------------------------------------
--   END DATA FOR TABLE DONVI
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE THEBH
--   FILTER = none used
---------------------------------------------------
REM INSERTING into THEBH
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('05-DEC-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'001 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('12-SEP-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'001 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('05-DEC-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'002 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('01-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'003 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('XE',to_timestamp('10-FEB-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'003 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NH',to_timestamp('08-OCT-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'004 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('09-FEB-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'005 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('14-OCT-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'006 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('08-OCT-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'006 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('01-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'004 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('XE',to_timestamp('08-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'005 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('04-JAN-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'007 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('05-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'007 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('09-JAN-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'008 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('09-MAY-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'009 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('08-OCT-96 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'010 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('14-OCT-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'011 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('09-MAY-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'011 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('09-JAN-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'012 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('01-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'012 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('XE',to_timestamp('12-OCT-96 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'013 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('09-JAN-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'014 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('08-JUN-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'015 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('05-SEP-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'016 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('09-MAY-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'017 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('12-JAN-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'013 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('XE',to_timestamp('11-FEB-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'014 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('11-FEB-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'015 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('01-JAN-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'016 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('01-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'015 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('01-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'017 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('08-OCT-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'018 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('08-OCT-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'019 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('08-OCT-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'020 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('01-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'021 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('XE',to_timestamp('14-OCT-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'022 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('08-OCT-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'023 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('14-OCT-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'024 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('21-OCT-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'025 ',3);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('06-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'024 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('12-DEC-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'001 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('02-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'003 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('XE',to_timestamp('12-MAY-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'003 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NH',to_timestamp('07-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'004 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('04-FEB-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'005 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('13-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'006 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('07-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'006 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('13-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'004 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('XE',to_timestamp('09-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'005 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('05-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'007 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('12-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'007 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('04-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'008 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('07-JAN-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'010 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('13-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'011 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('10-MAY-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'011 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('XE',to_timestamp('11-JAN-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'013 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('07-SEP-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'015 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('XE',to_timestamp('13-MAY-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'014 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('13-MAY-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'015 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('02-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'016 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('07-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'015 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('07-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'017 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('07-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'018 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('07-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'019 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('07-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'020 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('13-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'021 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('XE',to_timestamp('13-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'022 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('07-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'023 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TN',to_timestamp('13-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'024 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('20-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'025 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('TS',to_timestamp('13-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'024 ',12);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('06-DEC-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'001 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('06-DEC-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'002 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('09-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'006 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('06-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'007 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('09-JAN-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'010 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('10-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'012 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('06-SEP-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'016 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('13-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'013 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('02-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'017 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('09-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'018 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('09-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'019 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('09-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'020 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('07-DEC-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'001 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('07-DEC-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'002 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('08-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'006 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('13-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'007 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('08-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'010 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('11-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'012 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('07-SEP-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'016 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('14-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'013 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('08-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'017 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('08-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'018 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('08-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'019 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('YT',to_timestamp('08-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'020 ',6);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('15-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'006 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('10-MAY-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'009 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('02-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'012 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('10-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'014 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('10-MAY-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'017 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('02-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'015 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('02-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'021 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('22-JAN-98 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'025 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('14-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'006 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('11-MAY-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'009 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('03-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'012 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('11-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'014 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('11-MAY-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'017 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('08-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'015 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('14-JAN-00 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'021 ',24);
Insert into THEBH (MALOAI,NGAYBD,MAKH,THOIHAN) values ('NT',to_timestamp('21-JAN-99 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'025 ',24);

---------------------------------------------------
--   END DATA FOR TABLE THEBH
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOAIBH
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOAIBH
Insert into LOAIBH (MALOAI,TENLOAI,MUCPHI) values ('YT','BH Y TE        ',10);
Insert into LOAIBH (MALOAI,TENLOAI,MUCPHI) values ('TN','BH TAI NAN     ',15);
Insert into LOAIBH (MALOAI,TENLOAI,MUCPHI) values ('NT','BH NHAN THO    ',8);
Insert into LOAIBH (MALOAI,TENLOAI,MUCPHI) values ('XE','BH XE          ',9);
Insert into LOAIBH (MALOAI,TENLOAI,MUCPHI) values ('TS','BH DO TRANG SUC',7);
Insert into LOAIBH (MALOAI,TENLOAI,MUCPHI) values ('NH','BH NHA CUA     ',20);

---------------------------------------------------
--   END DATA FOR TABLE LOAIBH
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE KH
--   FILTER = none used
---------------------------------------------------
REM INSERTING into KH
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('001 ','NGUYEN VAN NHU     ',1955,'A01 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('002 ','TRAN BINH TRONG    ',1964,'B01 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('003 ','PHAM VAN HAI       ',1970,'A01 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('004 ','LY NHU THUY        ',1962,'A02 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('005 ','NGO VIET THUY      ',1948,'B02 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('006 ','NGUYEN NHAT TRUONG ',1968,'A02 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('007 ','TRIEU MY KIM       ',1966,'B02 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('008 ','BACH NHU TUYET     ',1973,'B01 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('009 ','NGO DAN THUY       ',1974,'A02 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('010 ','LUU TRONG LU       ',1966,'B02 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('011 ','LUU AI LINH        ',1958,'A01 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('012 ','TRUONG DONG BA     ',1958,'B01 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('013 ','NGUYEN THUY VAN    ',1969,'A01 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('014 ','NGUYEN ANH MAI     ',1949,'A02 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('015 ','TRUONG THU QUYEN   ',1952,'B01 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('016 ','PHAM ANH VU        ',1971,'B01 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('017 ','TRUONG PHONG BA    ',1970,'A02 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('018 ','TRAN HONG QUAN     ',1964,'A03 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('019 ','DO MINH KIET       ',1972,'A04 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('020 ','LUONG KIM CHI      ',1974,'A03 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('021 ','NGUYEN VINH THAO   ',1958,'B03 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('022 ','TRUONG THI HIEN MAI',1969,'B03 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('023 ','NGO KIEN NINH      ',1971,'B04 ',0);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('024 ','LY QUAN ANH        ',1963,'B05 ',1);
Insert into KH (MAKH,HOTEN,NAMSINH,MADV,PHAI) values ('025 ','THAI THI BACH TUYET',1974,'A05 ',0);

---------------------------------------------------
--   END DATA FOR TABLE KH
---------------------------------------------------
--------------------------------- Bai tap 14 ---------------------------------
---------a)
-----ORA-01735: invalid ALTER TABLE option: 
-----occurs when: alter table ( tablename dosomething ... dosomething_else );
-----Fix: alter table tablename dosomething; alter table tablename dosomething_else;
alter table donvi 
    add constraint pk_dv primary key (madv);
alter table donvi
    add constraint uk_tendv unique (tendv);
alter table donvi
    add check ( regexp_like ( trim(both ' ' from tel),
    '^\d{8}$' ) );

alter table kh
    add constraint pk_kh primary key (makh);
alter table kh
    add constraint fk_dv foreign key (madv) references donvi(madv);
alter table kh
    add constraint ck_phai check (phai in (0,1));
    
alter table loaibh 
    add constraint pk_loai primary key (maloai);
alter table loaibh 
    add constraint uk_tenloai unique (tenloai);
alter table loaibh 
    add constraint ck_mucphi check(mucphi>0);
    
alter table thebh 
    add primary key (maloai, MAKH, ngaybd);
alter table thebh 
    add foreign key (maloai) references loaibh(maloai);
alter table thebh 
    add foreign key (makh) references kh(makh);
alter table thebh 
    add constraint ck_thoihan check (thoihan >0);
---------b)
alter table thebh add (NgayKT date);
alter table thebh add check (ngayKT =add_months(ngayBD,thoihan));
update thebh set ngayKT =add_months(ngayBD,thoihan);
---------c)
alter table thebh add (ConHL int check(conHL in (0,1))) ;
update thebh set conHL = 0 where ngaykt <= sysdate;
update thebh set conHL = 1 where ngaykt > sysdate;
---------d)
Insert into thebh (maloai, ngaybd, makh, thoihan, ngaykt, conhl)
select distinct a.maloai, sysdate, a.makh, 6, add_months(sysdate, 6), 1
from thebh a, kh b, donvi c, loaibh d
where a.makh = b.makh and b.madv = c.madv and d.maloai = a.maloai
and tendv = 'SO DIEN LUC' and tenloai = 'BH Y TE';
--------------------------------- Bai tap 15 ---------------------------------
---------a)
create table THEBH_QUA_HAN as
select * from thebh where conhl = 0;
---------b)
Delete from THEBH where conhl = 0;
---------c)
Create table MUCPHI (maloai char(2) references loaibh(maloai),
    mucphi int check (mucphi>0), ngaybd date default (sysdate),
    nguoiCN char(20)default (user), primary key (maloai, ngaybd)
);