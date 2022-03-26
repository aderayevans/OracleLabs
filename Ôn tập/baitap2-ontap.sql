--2. Bài tập tổng hợp (??t tên các objects có prefix là “BT-”)
--    a. Thiếtt k? CSDL (ràng bu?c, bieu thuc chinh quy…) g?m ít nh?t 5 b?ng, nh?p DL ít nh?t 3 dòng m?i b?ng
--    b. Viết ít nhất 2 thủ tục, 2 hàm, 2 trigger cho CSDL trên
--    c. C?p quy?n cho 1 bạn trong nhóm có th? truy c?p DL, hàm, th? t?c trên

--nguoichoi: *manc, tennc, email, tendangnhap, matkhau
--nhanvat: *manv, tennv, manc(manc), ngaytaonv(sysdate)
--class: *classid, classname
--sword: *swordid, swordname, damage
--information: *manv, classid(classid), gioitinh
--equipment: *manv, swordid(swordid)
--log: *logid, logtime(sysdate), action, oldval, newval

CREATE TABLE BT_nguoichoi (
    manc VARCHAR(10) NOT NULL CHECK (regexp_like(manc, '^NC\d+$')),
    tennc VARCHAR(20) NOT NULL,
    email VARCHAR(30) CHECK (regexp_like(email, '[A-Za-z0-9]+@[a-z]+')),
    tendangnhap VARCHAR(30) NOT NULL UNIQUE,
    matkhau VARCHAR(20) NOT NULL 
        CHECK (regexp_like(matkhau, '[A-Za-z0-9]{4,}')),
    CONSTRAINT PK_BT_nguoichoi PRIMARY KEY (manc)
);

alter table bt_nguoichoi
    drop constraint bt_nguoichoi_matkhau_check_regex;
alter table bt_nguoichoi
    add constraint bt_nguoichoi_matkhau_check_regex
        check (regexp_like(matkhau, '[A-Za-z0-9]{4,}?'));

--nhanvat: *manv, tennv, manc(manc), ngaytaonv(sysdate)
CREATE TABLE BT_nhanvat (
    manv VARCHAR(10) NOT NULL CHECK (regexp_like(manv, '^NV\d+$')),
    tennv VARCHAR(20) NOT NULL UNIQUE,
    manc  VARCHAR(10) NOT NULL CHECK (regexp_like(manc, '^NC\d+$')),
    ngaytaonv DATE DEFAULT sysdate,
    CONSTRAINT PK_BT_nhanvat PRIMARY KEY (manv, manc),
    CONSTRAINT FK_BT_nguoichoi_nhanvat FOREIGN KEY (manc)
            REFERENCES BT_nguoichoi (manc)
);

alter table bt_nhanvat
    drop constraint PK_BT_nhanvat;
    
alter table bt_nhanvat
    add constraint PK_BT_nhanvat PRIMARY KEY (manv, manc);

--class: *classid, classname
CREATE TABLE BT_class (
    classid VARCHAR(10) NOT NULL CHECK (regexp_like(classid, '^CL\d+$')),
    classname VARCHAR(20) NOT NULL UNIQUE,
    CONSTRAINT PK_BT_class PRIMARY KEY (classid)
);

--sword: *swordid, swordname, damage
CREATE TABLE BT_sword (
    swordid VARCHAR(10) NOT NULL CHECK (regexp_like(swordid, '^SO\d+$')),
    swordname VARCHAR(20) NOT NULL UNIQUE,
    damage INT not null check(damage > 0),
    CONSTRAINT PK_BT_sword PRIMARY KEY (swordid)
);

alter table BT_sword 
    add damage INT not null check(damage > 0);

--information: *manv, classid(classid), gioitinh
CREATE TABLE BT_information (
    manc VARCHAR(10) NOT NULL CHECK (regexp_like(manc, '^NC\d+$')),
    manv VARCHAR(10) NOT NULL CHECK (regexp_like(manv, '^NV\d+$')),
    classid VARCHAR(10) NOT NULL CHECK (regexp_like(classid, '^CL\d+$')),
    gioitinh VARCHAR(5) DEFAULT('NAM') CHECK(gioitinh IN ('NAM', 'NU')),
    
    CONSTRAINT PK_BT_information PRIMARY KEY (manv, manc),
    CONSTRAINT FK_BT_class_information FOREIGN KEY (classid)
            REFERENCES BT_class (classid)
);

alter table BT_information 
    add manc VARCHAR(10) NOT NULL CHECK (regexp_like(manc, '^NC\d+$'));

alter table BT_information
    drop constraint PK_BT_information;
    
alter table BT_information
    add constraint PK_BT_information PRIMARY KEY (manv, manc);

--equipment: *manv, swordid(swordid)
CREATE TABLE BT_equipment (
    manc VARCHAR(10) NOT NULL CHECK (regexp_like(manc, '^NC\d+$')),
    manv VARCHAR(10) NOT NULL CHECK (regexp_like(manv, '^NV\d+$')),
    swordid VARCHAR(10) NOT NULL CHECK (regexp_like(swordid, '^SO\d+$')),
    
    CONSTRAINT PK_BT_equipment PRIMARY KEY (manv, manc),
    CONSTRAINT FK_BT_sword_equipment FOREIGN KEY (swordid)
            REFERENCES BT_sword (swordid)
);

alter table BT_equipment 
    add manc VARCHAR(10) NOT NULL CHECK (regexp_like(manc, '^NC\d+$'));

alter table BT_equipment
    drop constraint PK_BT_equipment;
    
alter table BT_equipment
    add constraint PK_BT_equipment PRIMARY KEY (manv, manc);


--log: *logid, logtime(sysdate), action, oldval, newval, note
CREATE TABLE BT_log (
    logid INT NOT NULL,
    logtime DATE DEFAULT sysdate,
    action VARCHAR(10) NOT NULL
        CHECK(action in ('UPDATE', 'INSERT', 'DELETE', 'PROCEDURE', 'FUNCTION')),
    oldval VARCHAR(20),
    newval  VARCHAR(20),
    note VARCHAR(20),
    
    CONSTRAINT PK_BT_log PRIMARY KEY (logid)
);

CREATE SEQUENCE id_log_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0 
    NOCACHE 
    NOCYCLE;

--################INSERT##############

INSERT INTO BT_nguoichoi (manc, tennc, email, tendangnhap, matkhau)
    VALUES ('NC001', 'Chevrolet', 'chevrolet@gmail.com', 'Chevrolet', 'Chev113');
INSERT INTO BT_nguoichoi (manc, tennc, email, tendangnhap, matkhau)
    VALUES ('NC002', 'Ssangyong', 'ssangyong@gmail.com', 'Ssangyong', 'Ssan113');
INSERT INTO BT_nguoichoi (manc, tennc, email, tendangnhap, matkhau)
    VALUES ('NC003', 'Aderayevans', 'aderayevans@gmail.com', 'Aderayevans', 'Ader113');
INSERT INTO BT_nguoichoi (manc, tennc, email, tendangnhap, matkhau)
    VALUES ('NC004', 'Tester', 'tester@gmail.com', 'MrTester', 'Tes1');
  
select * from B1510210.BT_nguoichoi;  
    
SELECT * FROM user_cons_columns 
    where constraint_name = 'SYS_C00122650';
    
INSERT INTO BT_nhanvat (manv, tennv, manc)
    VALUES ('NV001', 'Chevrolet001', 'NC001');
INSERT INTO BT_nhanvat (manv, tennv, manc)
    VALUES ('NV001', 'Ssangyong001', 'NC002');
INSERT INTO BT_nhanvat (manv, tennv, manc)
    VALUES ('NV001', 'Aderayevans001', 'NC003');

select * from B1510210.BT_nhanvat;  

INSERT INTO BT_class (classid, classname)
    VALUES ('CL001', 'Knight');
INSERT INTO BT_class (classid, classname)
    VALUES ('CL002', 'Hunter');
INSERT INTO BT_class (classid, classname)
    VALUES ('CL003', 'Sorcerer');
    
select * from B1510210.BT_class;  

INSERT INTO BT_sword (swordid, swordname, damage)
    VALUES ('SO001', 'Claymore', '25');
INSERT INTO BT_sword (swordid, swordname, damage)
    VALUES ('SO002', 'Crystal Greatsword', '55');
INSERT INTO BT_sword (swordid, swordname, damage)
    VALUES ('SO003', 'Uchigatana', '45');

select * from B1510210.BT_sword; 

INSERT INTO BT_information (manc, manv, classid, gioitinh)
    VALUES ('NC001', 'NV001', 'CL001', 'NU');
    
INSERT INTO BT_information (manc, manv, classid, gioitinh)
    VALUES ('NC002', 'NV001', 'CL003', 'NAM');
    
INSERT INTO BT_information (manc, manv, classid, gioitinh)
    VALUES ('NC003', 'NV001', 'CL002', 'NAM');
    
select * from B1510210.BT_information;

INSERT INTO BT_equipment (manc, manv, swordid)
    VALUES ('NC001', 'NV001', 'SO001');
INSERT INTO BT_equipment (manc, manv, swordid)
    VALUES ('NC002', 'NV001', 'SO002');
INSERT INTO BT_equipment (manc, manv, swordid)
    VALUES ('NC003', 'NV001', 'SO003');

select * from B1510210.BT_equipment;

--##################PROCEDURE########################
CREATE OR REPLACE PROCEDURE add_class
    (newclassid BT_class.classid%TYPE, newclassname BT_class.classname%TYPE)
IS
BEGIN
    INSERT INTO BT_class (classid, classname)
        VALUES (newclassid, newclassname);
    DBMS_OUTPUT.PUT_LINE('Add a new class ' || newclassname || ' succeeded');
END;

SET SERVEROUTPUT ON
EXECUTE add_class('CL004', 'Thief');

select * from B1510210.BT_class;  

CREATE OR REPLACE PROCEDURE add_sword(
        newswordid      BT_sword.swordid%TYPE, 
        newswordname    BT_sword.swordname%TYPE,
        newdamage    BT_sword.damage%TYPE
    )
IS
BEGIN
    INSERT INTO BT_sword (swordid, swordname, damage)
        VALUES (newswordid, newswordname, newdamage);
    DBMS_OUTPUT.PUT_LINE('Add a new sword ' || newswordname || ' (' || newdamage || ')' || ' succeeded');
END;

SET SERVEROUTPUT ON
EXECUTE add_sword('SO004', 'Zweihander', 50);

select * from B1510210.BT_sword;  

--##################FUNCTION########################
CREATE OR REPLACE FUNCTION get_nhanvat (
    input_manc  BT_information.manc%TYPE, 
    input_manv  BT_information.manv%TYPE
)
RETURN 
    VARCHAR2
IS
    thongtin VARCHAR2(100);
    newline VARCHAR(20);
    tennv   BT_nhanvat.tennv%TYPE;
    gioitinh    BT_information.gioitinh%TYPE;
    classname   BT_class.classname%TYPE;
    swordname   BT_sword.swordname%TYPE;
    damage  BT_sword.damage%TYPE;
BEGIN
--    have: manc, manv
--    essentials: tennv(BT_nhanvat), gioitinh(BT_information),
--                classname(BT_class), swordname(BT_sword), damage(BT_sword)
--    manc + manv -> BT_information + BT_equipment
--    BT_information ->(classid) BT_class
--    BT_equipment ->(swordid) BT_sword
    DBMS_OUTPUT.PUT_LINE(input_manc);
    DBMS_OUTPUT.PUT_LINE(input_manv);
    select tt.tennv, tt.gioitinh, class.classname, sword.swordname, sword.damage into tennv, gioitinh, classname, swordname, damage
    from 
    (
        select nv.tennv, info.gioitinh, info.classid, equip.swordid
        from BT_nhanvat nv 
            left join BT_information info 
                on (nv.manc = info.manc and nv.manv = info.manv)
            left join BT_equipment equip 
                on (nv.manc = equip.manc and nv.manv = equip.manv)
        where nv.manc = input_manc and nv.manv = input_manv
    ) tt
        left join BT_class class
            on tt.classid = class.classid
        left join BT_sword sword
            on tt.swordid = sword.swordid;
    
--    Nhân vật Chevrolet001
--    Giới tính: Nữ
--    Class: Knight
--    Sword: Claymore (25 damages)
    newline := CHR(13) || CHR(10);
    thongtin := 'Nhân vật ' || tennv || newline ||
                    'Giới tính: ' || gioitinh || newline ||
                    'Class: ' || classname || newline ||
                    'Sword: ' || swordname || ' (' || damage || ' damages)'; 
    RETURN thongtin;
END;

SET SERVEROUTPUT ON
DECLARE
    result VARCHAR(100);
BEGIN
    result := get_nhanvat('NC002', 'NV001');
    DBMS_OUTPUT.PUT_LINE(result);
END;

--select tt.tennv, tt.gioitinh, class.classname, sword.swordname, sword.damage
--from 
--(
--    select nv.tennv, info.gioitinh, info.classid, equip.swordid
--    from BT_nhanvat nv 
--        left join BT_information info 
--            on (nv.manc = info.manc and nv.manv = info.manv)
--        left join BT_equipment equip 
--            on (nv.manc = equip.manc and nv.manv = equip.manv)
--    where nv.manc = 'NC001' and nv.manv = 'NV001'
--) tt
--    left join BT_class class
--        on tt.classid = class.classid
--    left join BT_sword sword
--        on tt.swordid = sword.swordid; 

CREATE OR REPLACE FUNCTION get_damage (
    input_swordname  BT_sword.swordname%TYPE
)
RETURN
    BT_sword.damage%TYPE
IS
    result BT_sword.damage%TYPE;
BEGIN
    select BT_sword.damage into result
    from BT_sword
    where BT_sword.swordname = input_swordname;
    RETURN result;
END;

select * from BT_sword;

SET SERVEROUTPUT ON
DECLARE
    result BT_sword.damage%TYPE;
BEGIN
    result := get_damage('Uchigatana');
    DBMS_OUTPUT.PUT_LINE('Uchigatana: ' || result);
END;
--##################TRIGGER########################

CREATE OR REPLACE TRIGGER check_before_update_damage 
     BEFORE UPDATE OF damage on BT_SWORD 
     FOR EACH ROW
BEGIN
    IF :new.damage = :old.damage THEN  
        raise_application_error(-20225, 'Damage is the same as before');
    END IF;
END;

select * from BT_sword;

update Bt_sword
set damage = 50
where swordname = 'Zweihander';

CREATE OR REPLACE TRIGGER write_log 
     AFTER UPDATE OF damage on BT_SWORD 
     FOR EACH ROW
BEGIN
    INSERT INTO BT_log (logid, logtime, action, oldval, newval)
        VALUES (id_log_seq.nextval, sysdate, 'UPDATE', :old.damage, :new.damage);
END;

select * from BT_sword;

update Bt_sword
set damage = 52
where swordname = 'Zweihander';


select * from BT_nguoichoi;
select * from BT_nhanvat;
select * from BT_class;
select * from BT_sword;
select * from BT_information;
select * from BT_equipment;
select * from BT_log;

##################################
--Cấp quyền cho 1 bạn trong nhóm có thể truy cập DL, hàm, thủ tục trên
GRANT SELECT, UPDATE ON BT_nguoichoi TO B1609509;
GRANT SELECT, UPDATE ON BT_nhanvat TO B1609509;
GRANT SELECT, UPDATE ON BT_class TO B1609509;
GRANT SELECT, UPDATE ON BT_sword TO B1609509;
GRANT SELECT, UPDATE ON BT_information TO B1609509;
GRANT SELECT, UPDATE ON BT_equipment TO B1609509;
GRANT SELECT, UPDATE ON BT_log TO B1609509;

GRANT EXECUTE ON add_class TO B1609509;
GRANT EXECUTE ON add_sword TO B1609509;
GRANT EXECUTE ON get_nhanvat TO B1609509;
GRANT EXECUTE ON get_damage TO B1609509;


COMMIT WORK;
