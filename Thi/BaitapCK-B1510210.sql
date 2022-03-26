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
    CONSTRAINT PK_tourlist PRIMARY KEY (tourid, ngaydi),
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
    n_tennoidi noidi.tennoidi%TYPE,
    n_tennoiden noiden.tennoiden%TYPE,
    n_ngaydi tourlist.ngaydi%TYPE,
    n_is_nguoilon customerlist.is_nguoilon%TYPE,
    n_tenkh customerlist.tenkh%TYPE,
    n_sdt customerlist.sdt%TYPE,
    n_email customerlist.email%TYPE,
    n_yck customerlist.yck%TYPE,
    )
IS
    n_manoidi noidi.manoidi%TYPE;
    n_manoiden noiden.manoiden%TYPE;
    n_tourid tourlist.tourid%TYPE;
BEGIN
    select manoidi into n_manoidi
    from b1510210.noidi 
    where tennoidi = n_tennoidi;
    
    select manoiden into n_manoiden
    from b1510210.noiden
    where tennoiden= n_tennoiden;
    
    select tourid into n_tourid
    from b1510210.tourlist
    where manoidi = n_manoidi and manoiden = n_manoiden;
    
    INSERT INTO BT_class (classid, classname)
        VALUES (newclassid, newclassname);
    DBMS_OUTPUT.PUT_LINE('Add a new class ' || newclassname || ' succeeded');
END;
