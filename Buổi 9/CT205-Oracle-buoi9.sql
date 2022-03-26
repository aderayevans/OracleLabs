-- IN VSCODE: press F1, select connect oracle to connect before run sql script

/*
--HangXe(*ID_Hang, TenHang)
--LoaiXe(*ID_Loai, TenLoai)
--MauXe(ID_Xe, TenMauXe, NguonGoc, GiaNiemYet, GiaDamPhan, DongCo, CongSuat, MomenXoan,
    
    fk: ID_Loai
    pk: ID_Xe, ID_Hang
    )
*/
CREATE TABLE HangXe (
    ID_Hang INT NOT NULL,
    TenHang VARCHAR(20) NOT NULL,
    CONSTRAINT PK_HANGXE PRIMARY KEY (ID_Hang)
);

CREATE TABLE LoaiXe (
    ID_Loai INT NOT NULL,
    TenLoai VARCHAR(20) NOT NULL,
    CONSTRAINT PK_LOAIXE PRIMARY KEY (ID_Loai)
);

CREATE TABLE MauXe (
    ID_Xe INT NOT NULL,
    ID_Hang INT NOT NULL,
    ID_Loai INT NOT NULL,
    TenMauXe VARCHAR(30) NOT NULL,
    NguonGoc VARCHAR(20) NOT NULL CHECK(NguonGoc IN ('Nhap khau', 'Lap rap')),
    GiaNiemYet INT NOT NULL CHECK(GiaNiemYet >= 0),
    GiaDamPhan INT CHECK(GiaDamPhan >= 0),
    DongCo VARCHAR(20) NOT NULL,
    CongSuat INT NOT NULL CHECK(CongSuat >= 0),
    MomenXoan INT NOT NULL CHECK(MomenXoan >= 0),
    CONSTRAINT PK_MAUXE PRIMARY KEY (ID_Xe, ID_Hang)
);

ALTER TABLE MauXe
    ADD CONSTRAINT FK_MAUXE_LOAIXE FOREIGN KEY (ID_Loai)
        REFERENCES LoaiXe (ID_Loai);

ALTER TABLE MauXe
    ADD CONSTRAINT FK_MAUXE_HANGXE FOREIGN KEY (ID_Hang)
        REFERENCES HangXe (ID_Hang);

CREATE SEQUENCE id_loai_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE id_hang_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0 
    NOCACHE 
    NOCYCLE;

CREATE SEQUENCE id_xe_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0 
    NOCACHE 
    NOCYCLE;

--################################################################################################

/* 
INSERT INTO HangXe (ID_Hang, TenHang)
    VALUES (id_hang_seq.NEXTVAL, 'Chevrolet')

INSERT INTO LoaiXe (ID_Loai, TenLoai)
    VALUES (id_loai_seq.NEXTVAL, 'Sedan')

INSERT INTO MauXe (ID_Xe, ID_Hang, ID_Loai, TenMauXe, NguonGoc, GiaNiemYet, GiaDamPhan, DongCo, CongSuat, MomenXoan) 
    VALUES (1, 1, 1, 'Forester i-L 2.0 - CVT', 'Nhap khau', 1128, 993, 2.0 H4, 154, 196);
*/
--################################ add_HangXe procedure
-- create procedure step
CREATE OR REPLACE PROCEDURE add_HangXe (ten HangXe.TenHang%TYPE)
IS
    row_count int;
    existed_val EXCEPTION;
BEGIN
    SELECT count(*) INTO row_count FROM HangXe WHERE HangXe.TenHang = ten;
    IF row_count = 0 THEN
        INSERT INTO HangXe (ID_Hang, TenHang) VALUES (id_hang_seq.NEXTVAL, ten);
    ELSE
        RAISE existed_val;
    END IF;
    COMMIT;
    EXCEPTION
        WHEN existed_val THEN
            DBMS_OUTPUT.PUT_LINE('EXISTED Error!!!');
END;
-- testing step
SET SERVEROUTPUT ON
EXECUTE add_HangXe('test');
SELECT * FROM HangXe;
DELETE FROM HangXe;
ALTER SEQUENCE id_hang_seq RESTART START WITH 0;
-- insert step
EXECUTE add_HangXe('Chevrolet');
EXECUTE add_HangXe('Ford');
EXECUTE add_HangXe('Honda');
EXECUTE add_HangXe('Hyundai');
EXECUTE add_HangXe('Infiniti');
EXECUTE add_HangXe('Isuzu');
EXECUTE add_HangXe('Kia');
EXECUTE add_HangXe('Lexus');
EXECUTE add_HangXe('Maserati');
EXECUTE add_HangXe('Mazda');
EXECUTE add_HangXe('Mercedes');
EXECUTE add_HangXe('Mitsubishi');
EXECUTE add_HangXe('Nissan');
EXECUTE add_HangXe('Peugeot');
EXECUTE add_HangXe('Porsche');
EXECUTE add_HangXe('Renault');
EXECUTE add_HangXe('Ssangyong');
EXECUTE add_HangXe('Subaru');
EXECUTE add_HangXe('Suzuki');
EXECUTE add_HangXe('Toyota');
EXECUTE add_HangXe('Vinfast');
EXECUTE add_HangXe('Suzuki');
EXECUTE add_HangXe('Volkswagen');
EXECUTE add_HangXe('Volvo');
--################################ add_LoaiXe procedure
-- create procedure step
CREATE OR REPLACE PROCEDURE add_LoaiXe (ten LoaiXe.TenLoai%TYPE)
IS
    row_count int;
    existed_val EXCEPTION;
BEGIN
    SELECT count(*) INTO row_count FROM LoaiXe WHERE LoaiXe.TenLoai = ten;
    IF row_count = 0 THEN
        INSERT INTO LoaiXe (ID_Loai, TenLoai) VALUES (id_loai_seq.NEXTVAL, ten);
    ELSE
        RAISE existed_val;
    END IF;
    COMMIT;
    EXCEPTION
        WHEN existed_val THEN
            DBMS_OUTPUT.PUT_LINE('EXISTED Error!!!');
END;
-- testing step
SET SERVEROUTPUT ON
EXECUTE add_LoaiXe('test');
SELECT * FROM LoaiXe;
DELETE FROM LoaiXe;
ALTER SEQUENCE id_loai_seq RESTART START WITH 0; 
-- insert step
EXECUTE add_LoaiXe('Sedan');
EXECUTE add_LoaiXe('Hatchback');
EXECUTE add_LoaiXe('MPV');
EXECUTE add_LoaiXe('SUV');
EXECUTE add_LoaiXe('SUV-Coupe');
EXECUTE add_LoaiXe('SUV-Wagon');
EXECUTE add_LoaiXe('Pick-up');
EXECUTE add_LoaiXe('Coupe');
EXECUTE add_LoaiXe('Coupe 2 cua');
EXECUTE add_LoaiXe('Coupe 4 cua');
EXECUTE add_LoaiXe('Crossover');
EXECUTE add_LoaiXe('Convertible');
EXECUTE add_LoaiXe('Roadster');
EXECUTE add_LoaiXe('Sieu xe');
EXECUTE add_LoaiXe('Station Wagon');
--################################ add_MauXe procedure
-- create procedure step
CREATE OR REPLACE PROCEDURE add_MauXe (
    n_TenHang         HangXe.TenHang%TYPE,
    n_TenLoai         LoaiXe.TenLoai%TYPE,
    n_TenMauXe        MauXe.TenMauXe%TYPE,
    n_NguonGoc        MauXe.NguonGoc%TYPE,
    n_GiaNiemYet      MauXe.GiaNiemYet%TYPE,
    n_GiaDamPhan      MauXe.GiaDamPhan%TYPE,
    n_DongCo          MauXe.DongCo%TYPE,
    n_CongSuat        MauXe.CongSuat%TYPE,
    n_MomenXoan       MauXe.MomenXoan%TYPE
)
IS
    n_ID_Hang         MauXe.ID_Hang%TYPE;
    n_ID_Loai         MauXe.ID_Loai%TYPE;
BEGIN
    SELECT ID_Hang INTO n_ID_Hang FROM HangXe
        WHERE TenHang = n_TenHang;

    SELECT ID_Loai INTO n_ID_Loai FROM LoaiXe
        WHERE TenLoai = n_TenLoai;

    INSERT INTO MauXe (ID_Xe, ID_Hang, ID_Loai, TenMauXe, NguonGoc, 
            GiaNiemYet, GiaDamPhan, DongCo, CongSuat, MomenXoan) 
        VALUES (id_xe_seq.NEXTVAL, n_ID_Hang, n_ID_Loai, n_TenMauXe, n_NguonGoc, 
            n_GiaNiemYet, n_GiaDamPhan, n_DongCo, n_CongSuat, n_MomenXoan);

    COMMIT;
END;
-- testing step
-- test insert accept value
SET SERVEROUTPUT ON
EXECUTE add_MauXe('Subaru','SUV', 'Forester i-L 2.0 - CVT', 'Nhap khau', 1128, 993, '2.0 H4', 154, 196);
SELECT * FROM MauXe;
DELETE FROM MauXe;
ALTER SEQUENCE id_xe_seq RESTART START WITH 0;
-- test wrong tenhang ----> ORA-01403: no data found
SET SERVEROUTPUT ON
EXECUTE add_MauXe('test','SUV', 'Forester i-L 2.0 - CVT', 'Nhap khau', 1128, 993, '2.0 H4', 154, 196);
SELECT * FROM MauXe;
DELETE FROM MauXe;
ALTER SEQUENCE id_xe_seq RESTART START WITH 0;
-- test wrong check gia niem yet >= 0 ------> ORA-02290: check constraint (B1510210.SYS_C00109221) violated
SET SERVEROUTPUT ON
EXECUTE add_MauXe('Subaru','SUV', 'Forester i-L 2.0 - CVT', 'Nhap khau', -1, 993, '2.0 H4', 154, 196);
SELECT * FROM MauXe;
DELETE FROM MauXe;
ALTER SEQUENCE id_xe_seq RESTART START WITH 0;
-- insert step
--Forester i-S 2.0 - CVT    Subaru SUV	Nhập khẩu	1.218	1.029	2.0 H4	154	196
EXECUTE add_MauXe('Subaru','SUV', 'Forester i-S 2.0 - CVT', 'Nhap khau', 1218, 1029, '2.0 H4', 154, 196);
--QX60	Infiniti	SUV	Nhập khẩu	3.099	3.059	3.5 V6	265	334
EXECUTE add_MauXe('Infiniti','SUV', 'QX60', 'Nhap khau', 3099, 3059, '3.5 V6', 265, 334);
--Juke	Nissan	SUV	Nhập khẩu	1.060	1.040	1.6 I4 DOHC	115	158
EXECUTE add_MauXe('Nissan','SUV', 'Juke', 'Nhap khau', 1060, 1040, '1.6 I4 DOHC', 115, 158);
--Navara 2WD cao cấp	Nissan	Pick-up	Nhập khẩu	748	748	Diesel 2.5 I4	190	450
EXECUTE add_MauXe('Nissan','Pick-up', 'Navara 2WD cao cap', 'Nhap khau', 748, 748, 'Diesel 2.5 I4', 190, 450);
--Sunny XL	Nissan	Sedan	Lắp ráp	498	474	1.5 I4 HR15	99	134
EXECUTE add_MauXe('Nissan','Sedan', 'Sunny XL', 'Lap rap', 498, 474, '1.5 I4 HR15', 99, 134);
--ES250	Lexus	Sedan	Nhập khẩu	2.500	2.500	2.5 I4	205	243
EXECUTE add_MauXe('Lexus','Sedan', 'ES250', 'Nhap khau', 2500, 2500, '2.5 I4', 205, 243);
--LM 350 5 chỗ	Lexus	MPV	Nhập khẩu	8.200	8.200	3.5 V6	296	361
EXECUTE add_MauXe('Lexus','MPV', 'LM 350 5 cho', 'Nhap khau', 8200, 8200, '3.5 V6', 296, 361);
--################################ update_GiaNiemYet procedure
-- create update_GiaNiemYet step
CREATE OR REPLACE PROCEDURE update_GiaNiemYet(
    n_ID_Xe         MauXe.ID_Xe%TYPE,
    n_GiaNiemYet    MauXe.GiaNiemYet%TYPE
)
IS
BEGIN
    UPDATE MauXe SET GiaNiemYet = n_GiaNiemYet 
        WHERE ID_Xe = n_ID_Xe;
    COMMIT;
END;
-- testing step
SELECT * FROM MauXe;
EXECUTE update_GiaNiemYet(0, 1111);
--################################ update_GiaDamPhan procedure
-- create update_GiaDamPhan step
CREATE OR REPLACE PROCEDURE update_GiaDamPhan(
    n_ID_Xe         MauXe.ID_Xe%TYPE,
    n_GiaDamPhan    MauXe.GiaDamPhan%TYPE
)
IS
BEGIN
    UPDATE MauXe SET GiaDamPhan = n_GiaDamPhan 
        WHERE ID_Xe = n_ID_Xe;
    COMMIT;
END;
-- testing step
SELECT * FROM MauXe;
EXECUTE update_GiaDamPhan(0, 999);
--################################ get_GiaDamPhan function
-- create get_GiaDamPhan step
CREATE OR REPLACE FUNCTION get_GiaDamPhan(
    n_ID_Xe MauXe.ID_Xe%TYPE
)
RETURN MauXe.GiaDamPhan%TYPE
IS
    n_GiaDamPhan    MauXe.GiaDamPhan%TYPE;
BEGIN
    SELECT GiaDamPhan INTO n_GiaDamPhan FROM MauXe 
        WHERE ID_Xe = n_ID_Xe;
    RETURN n_GiaDamPhan;
END;

SELECT ID_Xe, get_GiaDamPhan(ID_Xe) AS GiaDamPhan FROM MauXe;

--################################ get_LoaiXe_Have_HighestPrice function
-- create get_LoaiXe_Have_HighestPrice step
CREATE OR REPLACE FUNCTION get_LoaiXe_Have_HighestPrice
RETURN 
    LoaiXe.TenLoai%TYPE
IS
    n_TenLoai LoaiXe.TenLoai%TYPE;
BEGIN
    SELECT TenLoai INTO n_TenLoai
    FROM
        (
            SELECT ID_Loai FROM MauXe
                WHERE GIANIEMYET = (
                                    SELECT MAX(GiaNiemYet)
                                    FROM MauXe
                                    )
        ) ids JOIN LoaiXe lx on ids.ID_Loai = lx.ID_Loai;
    RETURN n_TenLoai;
END;
--testing step
SET SERVEROUTPUT ON
DECLARE
    test LoaiXe.TenLoai%TYPE;
BEGIN
    test := get_LoaiXe_Have_HighestPrice;
    dbms_output.put_line(test);
END;
--################################ get_HangXe_Have_HighestPrice function
-- create get_HangXe_Have_HighestPrice step
CREATE OR REPLACE FUNCTION get_HangXe_Have_HighestPrice
RETURN 
    HangXe.TenHang%TYPE
IS
    n_TenHang HangXe.TenHang%TYPE;
BEGIN
    SELECT TenHang INTO n_TenHang
    FROM
        (
            SELECT ID_Hang FROM MauXe
                WHERE GIANIEMYET = (
                                    SELECT MAX(GiaNiemYet)
                                    FROM MauXe
                                    )
        ) ids JOIN HangXe hx on ids.ID_Hang = hx.ID_Hang;
    RETURN n_TenHang;
END;
--testing step
SET SERVEROUTPUT ON
DECLARE
    test HangXe.TenHang%TYPE;
BEGIN
    test := get_HangXe_Have_HighestPrice;
    dbms_output.put_line(test);
END;
--################################ del_MauXe procedure
-- create del_MauXe step
CREATE OR REPLACE PROCEDURE del_MauXe (n_ID_Xe MauXe.ID_XE%TYPE)
IS
BEGIN
    DELETE FROM MauXe WHERE ID_Xe = n_ID_Xe;
    COMMIT;
END;
--testing step
SELECT * FROM MauXe;
EXECUTE add_MauXe('Nissan','SUV', 'Juke', 'Nhap khau', 1060, 1040, '1.6 I4 DOHC', 115, 158);
EXECUTE del_MauXe(9);
--################################ get_GiaLanBanh function
-- create get_GiaLanBanh step
CREATE OR REPLACE FUNCTION get_GiaLanBanh (n_GiaNiemYet MauXe.GiaNiemYet%TYPE)
RETURN MauXe.GiaNiemYet%TYPE
IS
BEGIN
    RETURN n_GiaNiemYet + round((n_GiaNiemYet*10)/100) + 1560000 + 437000 + 1000000 + 340000;
END;
--testing step
SET SERVEROUTPUT ON
DECLARE
    test MauXe.GiaNiemYet%TYPE;
    n_GiaNiemYet MauXe.GiaNiemYet%TYPE;
BEGIN
    n_GiaNiemYet := 659000000;
    test := get_GiaLanBanh(n_GiaNiemYet);
    dbms_output.put_line(test);
END;

CREATE USER B1510210_OTOADMIN IDENTIFIED BY "THOracle@2021@otoadmin";
GRANT CREATE SESSION TO B1510210_OTOADMIN;
GRANT create table, create procedure, create trigger TO B1510210_OTOADMIN;
GRANT SELECT, UPDATE ON MauXe TO B1510210_OTOADMIN;
GRANT SELECT, UPDATE ON HangXe TO B1510210_OTOADMIN;
GRANT SELECT, UPDATE ON LoaiXe TO B1510210_OTOADMIN;