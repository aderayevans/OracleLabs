--
noi di
noi den
--noidi: *manoidi, tennoidi;
--noiden: *manoiden, tennoiden;
--tourlist: *tourid, manoidi, manoiden, gianguoilon, giatreem, phuongtien, thoiluong *ngaydi, ngayden
--customerlist: *customerid, tenkh, sdt, email, yck, is_nguoilon
--booklist: *tourid, *customerid, 

booktour
noidi, noiden, ngaydi, (is_nguoilon, tenkh, sdt, email, yck)

CREATE TABLE noidi (
    manoidi  VARCHAR(10) NOT NULL CHECK (regexp_like(manoidi, '^DI\d+$')),
    tennoidi VARCHAR(20) NOT NULL,
    CONSTRAINT PK_noidi PRIMARY KEY (manoidi)
);


CREATE TABLE noiden (
    manoiden  VARCHAR(10) NOT NULL CHECK (regexp_like(manoiden, '^DEN\d+$')),
    tennoiden VARCHAR(20) NOT NULL,
    CONSTRAINT PK_noiden PRIMARY KEY (manoiden)
);

drop table tourlist;
CREATE TABLE tourlist (
    tourid VARCHAR(10) NOT NULL CHECK (regexp_like(tourid, '^TOUR\d+$')),
    manoidi  VARCHAR(10) NOT NULL CHECK (regexp_like(manoidi, '^DI\d+$')),
    manoiden  VARCHAR(10) NOT NULL CHECK (regexp_like(manoiden, '^DEN\d+$')),
    gianguoilon INT not null check(gianguoilon > 0),
    giatreem INT not null check(giatreem > 0),
    phuongtien VARCHAR(10) DEFAULT('CAR') CHECK(phuongtien IN ('CAR', 'PLANE')),
    thoiluong VARCHAR(20) NOT NULL CHECK (regexp_like(THOILUONG, '^[0-9]+ngay[0-9]+dem$')),
    ngaydi DATE NOT NULL,
    ngayden DATE NOT NULL,
    CONSTRAINT PK_tourlist PRIMARY KEY (tourid),
    CONSTRAINT FK_tourlist_NOIDI FOREIGN KEY (manoidi)
            REFERENCES noidi (manoidi),
    CONSTRAINT FK_tourlist_NOIDEN FOREIGN KEY (manoiden)
            REFERENCES noiden (manoiden)
);

drop table CUSTOMERLIST;
create table CUSTOMERLIST
(
    CUSTOMERID VARCHAR(10) NOT NULL CHECK (regexp_like(CUSTOMERID, '^CUS\d+$')),
    tenkh VARCHAR(20) NOT NULL,
    sdt VARCHAR(20) NOT NULL CHECK (regexp_like(sdt, '[0-9]{10}')),
    email VARCHAR(50) NOT NULL CHECK (regexp_like(email, '[A-Za-z0-9]+@[a-z]+')),
    yck VARCHAR(100),
    is_nguoilon int,
    CONSTRAINT PK_CUSTOMERLIST PRIMARY KEY (CUSTOMERID)
);

CREATE TABLE booklist (
    tourid VARCHAR(10) NOT NULL CHECK (regexp_like(tourid, '^TOUR\d+$')),
    CUSTOMERID VARCHAR(10) NOT NULL CHECK (regexp_like(CUSTOMERID, '^CUS\d+$')),
    CONSTRAINT PK_booklist PRIMARY KEY (tourid, CUSTOMERID)
);

INSERT INTO noidi (manoidi, tennoidi)
    VALUES ('DI001', 'PHU QUOC');
    
INSERT INTO noidi (manoidi, tennoidi)
    VALUES ('DI002', 'HOI AN');
    
INSERT INTO noiden (manoiden, tennoiden)
    VALUES ('DEN001', 'HUE');
    
INSERT INTO noiden (manoiden, tennoiden)
    VALUES ('DEN002', 'DA NANG');    
COMMIT WORK;

INSERT INTO TOURLIST (TOURID, MANOIDI, MANOIDEN, 
        GIANGUOILON, GIATREEM, PHUONGTIEN, 
        THOILUONG, NGAYDI, NGAYDEN
        )
    VALUES ('TOUR001', 'DI001', 'DEN002', '7000000', '5000000',
        'PLANE', '1ngay1dem', TO_DATE('16/11/21','DD/MM/YY'),
        TO_DATE('18/11/21','DD/MM/YY')
        );
        
INSERT INTO TOURLIST (TOURID, MANOIDI, MANOIDEN, 
        GIANGUOILON, GIATREEM, PHUONGTIEN, 
        THOILUONG, NGAYDI, NGAYDEN
        )
    VALUES ('TOUR002', 'DI002', 'DEN001', '3850000', '1000000',
        'PLANE', '5ngay4dem', TO_DATE('16/11/21','DD/MM/YY'),
        TO_DATE('17/11/21','DD/MM/YY')
        );
        
INSERT INTO TOURLIST (TOURID, MANOIDI, MANOIDEN, 
        GIANGUOILON, GIATREEM, PHUONGTIEN, 
        THOILUONG, NGAYDI, NGAYDEN
        )
    VALUES ('TOUR003', 'DI002', 'DEN001', '3850000', '1000000',
        'PLANE', '9ngay10dem', TO_DATE('16/11/21','DD/MM/YY'),
        TO_DATE('17/11/21','DD/MM/YY')
        );
        
INSERT INTO TOURLIST (TOURID, MANOIDI, MANOIDEN, 
        GIANGUOILON, GIATREEM, PHUONGTIEN, 
        THOILUONG, NGAYDI, NGAYDEN
        )
    VALUES ('TOUR004', 'DI002', 'DEN001', '3850000', '1000000',
        'PLANE', '1ngay1dem', TO_DATE('16/11/21','DD/MM/YY'),
        TO_DATE('17/11/21','DD/MM/YY')
        );
        
SELECT * FROM user_cons_columns 
    where constraint_name = 'SYS_C00126758';

INSERT INTO CUSTOMERLIST (CUSTOMERID, tenkh, sdt, email, yck, is_nguoilon)
    VALUES ('CUS001', 'Minh Quang', '0327072525', 'quangb1510210@student.ctu.edu.vn', null, '1');

INSERT INTO CUSTOMERLIST (CUSTOMERID, tenkh, sdt, email, yck, is_nguoilon)
    VALUES ('CUS002', 'Ade Evans', '0327072527', 'aderayevans@gmail.com', null, null);

COMMIT WORK;

INSERT INTO booklist (tourid, CUSTOMERID)
    VALUES ('TOUR001', 'CUS002');

INSERT INTO booklist (tourid, CUSTOMERID)
    VALUES ('TOUR002', 'CUS001');

--##################PROCEDURE########################
CREATE OR REPLACE PROCEDURE book_tour
    (
    n_tourid tourlist.tourid%TYPE,
    n_customerid CUSTOMERLIST.CUSTOMERID%TYPE
    )
IS
BEGIN
    
    INSERT INTO booklist (tourid, CUSTOMERID)
    VALUES (n_tourid, n_customerid);
    
    DBMS_OUTPUT.PUT_LINE('Booking new tour ' || n_customerid || ' : ' ||  n_tourid);
END;


SET SERVEROUTPUT ON
EXECUTE book_tour('TOUR003', 'CUS002');

select * from booklist;

--##################FUNCTION########################
create or replace FUNCTION get_tour_info (
    n_tennoidi noidi.tennoidi%TYPE,
    n_tennoiden noiden.tennoiden%TYPE,
    n_ngaydi tourlist.ngaydi%TYPE
)
RETURN 
    VARCHAR2
IS
    n_manoidi noidi.manoidi%TYPE;
    n_manoiden noiden.manoiden%TYPE;
    --n_tourid tourlist.tourid%TYPE;
    thongtin VARCHAR2(100);
BEGIN
    select manoidi into n_manoidi
    from b1510210.noidi 
    where tennoidi = n_tennoidi;
    
    select manoiden into n_manoiden
    from b1510210.noiden
    where tennoiden= n_tennoiden;
        
    FOR eachtourid IN 
        (
        select tourid
        from b1510210.tourlist
        where manoidi = n_manoidi and manoiden = n_manoiden 
            and ngaydi = n_ngaydi
        ) 
    LOOP 
        thongtin:= thongtin || ' ' || eachtourid.tourid; 
    END LOOP;
    RETURN thongtin;
END;

SET SERVEROUTPUT ON
DECLARE
    result VARCHAR(100);
BEGIN
    result := get_tour_info('PHU QUOC', 'DA NANG', TO_DATE('16/11/21','DD/MM/YY'));
    DBMS_OUTPUT.PUT_LINE(result);
END;

SET SERVEROUTPUT ON
DECLARE
    result VARCHAR(100);
BEGIN
    result := get_tour_info('HOI AN', 'HUE', TO_DATE('16/11/21','DD/MM/YY'));
    DBMS_OUTPUT.PUT_LINE(result);
END;


COMMIT WORK;

--###L?? DBA c???a 1 ????n v???, b???n s??? l??m g?? ????? h??? tr??? ????n v??? ph??t tri???n t???t h??n?
- L?? m???t database administrator, b??n c???nh nh???ng nhi???m v??? c?? b???n nh?? ?????c t??? y??u c???u, ph??n t??ch, 
thi???t k???, c??i ?????t, ki???m th??? ???ng d???ng. Th?? m???i bi???n ph??p ?????m b???n an ninh, to??n v???n c??ng nh?? ti???t ki???m 
b??? nh??? l??? tr???, ki???m tra s??? v???n h??nh c???a h??? th???ng c??ng s??? ???????c ?????t l??n h??ng ?????u, v???i t???t c??? c??c bi???n ph??p
ph????ng ph??p nghi???p v??? th?????ng c??, th??m v??o ???? l?? s??? h???c h???i c??i m???i theo s??? v???n h??nh c???a c??c c?? s??? 
d??? li???u, c??c c??ng ngh??? l??u tr???, c??c c??ng ngh??? k???t n???i c???i ti???n m???i s??? ???????c ti???p thu v?? h???c h???i, nh???m 
thay ?????i v?? ph??t tri???n h??? th???ng c?? s??? d??? li???u, n??ng cao ch???t l?????ng h??? th???ng.