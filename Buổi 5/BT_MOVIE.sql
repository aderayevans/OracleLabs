--------------------REVOKE PRIVILEGES----------------------
REVOKE CREATE TABLE FROM b1510210_test1;
REVOKE CREATE SESSION FROM b1510210_test1;
REVOKE CREATE USER FROM b1510210_test1;
REVOKE ALTER USER FROM b1510210_test1;
REVOKE DROP USER FROM b1510210_test1;

REVOKE CREATE TABLE FROM b1510210_test2;
REVOKE CREATE SESSION FROM b1510210_test2;
REVOKE CREATE USER FROM b1510210_test2;
REVOKE ALTER USER FROM b1510210_test2;
REVOKE DROP USER FROM b1510210_test2;

REVOKE CREATE TABLE FROM b1510210_test3;
REVOKE CREATE SESSION FROM b1510210_test3;
REVOKE CREATE USER FROM b1510210_test3;
REVOKE ALTER USER FROM b1510210_test3;
REVOKE DROP USER FROM b1510210_test3;
--------------------GRANT PRIVILEGES----------------------
----ADMIN
GRANT CREATE TABLE, CREATE SESSION, CREATE USER, ALTER USER, DROP USER TO b1510210_test1;
GRANT SELECT, UPDATE, DELETE ON BT_ACTOR TO b1510210_test1 WITH GRANT OPTION;
GRANT SELECT, UPDATE, DELETE ON BT_GENRE TO b1510210_test1 WITH GRANT OPTION;
GRANT SELECT, UPDATE, DELETE ON BT_MOVIE TO b1510210_test1 WITH GRANT OPTION;
GRANT SELECT, UPDATE, DELETE ON BT_MOVIE_ACTOR TO b1510210_test1 WITH GRANT OPTION;
GRANT SELECT, UPDATE, DELETE ON BT_MOVIE_GENRE TO b1510210_test1 WITH GRANT OPTION;
GRANT SELECT, UPDATE, DELETE ON BT_MOVIE_STATUS TO b1510210_test1 WITH GRANT OPTION;
GRANT SELECT, UPDATE, DELETE ON BT_PRODUCTION_COMPANY TO b1510210_test1 WITH GRANT OPTION;
GRANT SELECT, UPDATE, DELETE ON BT_SPOKEN_LANGUAGE TO b1510210_test1 WITH GRANT OPTION;
----MOVIE ADMIN
GRANT CREATE SESSION, CREATE USER, ALTER USER, DROP USER TO b1510210_test2;
GRANT SELECT ON BT_ACTOR TO b1510210_test2 WITH GRANT OPTION;
GRANT SELECT ON BT_GENRE TO b1510210_test2 WITH GRANT OPTION;
GRANT SELECT ON BT_MOVIE_GENRE TO b1510210_test2 WITH GRANT OPTION;
GRANT SELECT ON BT_MOVIE_STATUS TO b1510210_test2 WITH GRANT OPTION;
GRANT SELECT ON BT_PRODUCTION_COMPANY TO b1510210_test2 WITH GRANT OPTION;
GRANT SELECT ON BT_SPOKEN_LANGUAGE TO b1510210_test2 WITH GRANT OPTION;
GRANT SELECT, UPDATE, DELETE ON BT_MOVIE TO b1510210_test2 WITH GRANT OPTION;
GRANT SELECT, UPDATE, DELETE ON BT_MOVIE_ACTOR TO b1510210_test2 WITH GRANT OPTION;
----USER
GRANT CREATE SESSION TO b1510210_test3;
GRANT SELECT ON BT_ACTOR TO b1510210_test3 WITH GRANT OPTION;
GRANT SELECT ON BT_GENRE TO b1510210_test3 WITH GRANT OPTION;
GRANT SELECT ON BT_MOVIE TO b1510210_test3 WITH GRANT OPTION;
GRANT SELECT ON BT_MOVIE_ACTOR TO b1510210_test3 WITH GRANT OPTION;
GRANT SELECT ON BT_MOVIE_GENRE TO b1510210_test3 WITH GRANT OPTION;
GRANT SELECT ON BT_MOVIE_STATUS TO b1510210_test3 WITH GRANT OPTION;
GRANT SELECT ON BT_PRODUCTION_COMPANY TO b1510210_test3 WITH GRANT OPTION;
GRANT SELECT ON BT_SPOKEN_LANGUAGE TO b1510210_test3 WITH GRANT OPTION;
---------------------------------------------------
--   DATA FOR TABLE BT_SPOKEN_LANGUAGE
---------------------------------------------------
INSERT INTO BT_SPOKEN_LANGUAGE (ISO_639_1, ISO_LAN_NAME) values ('ar', 'Arabic');
INSERT INTO BT_SPOKEN_LANGUAGE (ISO_639_1, ISO_LAN_NAME) values ('zh', 'Chinese');
INSERT INTO BT_SPOKEN_LANGUAGE (ISO_639_1, ISO_LAN_NAME) values ('en', 'English');
INSERT INTO BT_SPOKEN_LANGUAGE (ISO_639_1, ISO_LAN_NAME) values ('ko', 'Korean');
INSERT INTO BT_SPOKEN_LANGUAGE (ISO_639_1, ISO_LAN_NAME) values ('es', 'Spanish');
INSERT INTO BT_SPOKEN_LANGUAGE (ISO_639_1, ISO_LAN_NAME) values ('vi', 'Vietnamese');

---------------------------------------------------
--   END DATA FOR TABLE BT_SPOKEN_LANGUAGE
---------------------------------------------------
---------------------------------------------------
--   DATA FOR TABLE BT_GENRE
---------------------------------------------------
/*ORA-01031: insufficient privileges : need privilege to create sequence
CREATE SEQUENCE genre_id_seq
    INCREMENT BY 1
    START WITH 0;

INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (genre_id_seq.NEXTVAL, 'Action');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (genre_id_seq.NEXTVAL, 'Adventure');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (genre_id_seq.NEXTVAL, 'Animation');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (genre_id_seq.NEXTVAL, 'Comedy');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (genre_id_seq.NEXTVAL, 'Drama');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (genre_id_seq.NEXTVAL, 'Fantasy');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (genre_id_seq.NEXTVAL, 'Horror');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (genre_id_seq.NEXTVAL, 'Romance');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (genre_id_seq.NEXTVAL, 'Sci-Fi');
*/
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (0, 'Musical');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (1, 'Action');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (2, 'Adventure');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (3, 'Animation');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (4, 'Comedy');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (5, 'Drama');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (6, 'Fantasy');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (7, 'Horror');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (8, 'Romance');
INSERT INTO BT_GENRE (GENRE_ID, GENRE_TITLE) values (9, 'Sci-Fi');

---------------------------------------------------
--   END DATA FOR TABLE BT_GENRE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE BT_PRODUCTION_COMPANY
---------------------------------------------------
INSERT INTO BT_PRODUCTION_COMPANY (PC_ID, PC_NAME, PC_ORIGIN_COUNTRY) values (0, 'Walt Disney', 'United States');
INSERT INTO BT_PRODUCTION_COMPANY (PC_ID, PC_NAME, PC_ORIGIN_COUNTRY) values (1, 'Sony Pictures', 'United States');
INSERT INTO BT_PRODUCTION_COMPANY (PC_ID, PC_NAME, PC_ORIGIN_COUNTRY) values (2, 'TVB', 'Hong Kong');
---------------------------------------------------
--   END DATA FOR TABLE BT_PRODUCTION_COMPANY
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE BT_MOVIE_STATUS
---------------------------------------------------
INSERT INTO BT_MOVIE_STATUS (STATUS_ID, STATUS_TITLE) VALUES (0, 'Rumored');
INSERT INTO BT_MOVIE_STATUS (STATUS_ID, STATUS_TITLE) VALUES (1, 'Planned');
INSERT INTO BT_MOVIE_STATUS (STATUS_ID, STATUS_TITLE) VALUES (2, 'In Production');
INSERT INTO BT_MOVIE_STATUS (STATUS_ID, STATUS_TITLE) VALUES (3, 'Post Production');
INSERT INTO BT_MOVIE_STATUS (STATUS_ID, STATUS_TITLE) VALUES (4, 'Released');
INSERT INTO BT_MOVIE_STATUS (STATUS_ID, STATUS_TITLE) VALUES (5, 'Canceled');
---------------------------------------------------
--   END DATA FOR TABLE BT_MOVIE_STATUS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE BT_ACTOR
---------------------------------------------------
INSERT INTO BT_ACTOR (ACTOR_ID, ACTOR_NAME, ACTOR_GENDER) VALUES (0, 'Arnold Schwarzenegger', 'male');
INSERT INTO BT_ACTOR (ACTOR_ID, ACTOR_NAME, ACTOR_GENDER) VALUES (1, 'Dwayne Johnson', 'male');
INSERT INTO BT_ACTOR (ACTOR_ID, ACTOR_NAME, ACTOR_GENDER) VALUES (2, 'Keanu Reeves', 'male');
INSERT INTO BT_ACTOR (ACTOR_ID, ACTOR_NAME, ACTOR_GENDER) VALUES (3, 'Ryan Reynolds', 'male');
INSERT INTO BT_ACTOR (ACTOR_ID, ACTOR_NAME, ACTOR_GENDER) VALUES (4, 'Quan V?nh Hà', 'female');
INSERT INTO BT_ACTOR (ACTOR_ID, ACTOR_NAME, ACTOR_GENDER) VALUES (5, 'Giang Hoa', 'male');
INSERT INTO BT_ACTOR (ACTOR_ID, ACTOR_NAME, ACTOR_GENDER) VALUES (6, 'Âu D??ng Ch?n Hoa', 'male');
---------------------------------------------------
--   END DATA FOR TABLE BT_ACTOR
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE BT_MOVIE
---------------------------------------------------
INSERT INTO BT_MOVIE (STATUS_ID, MOVIE_ID, ISO_639_1, PC_ID, movie_original_title, movie_title, movie_is_for_adult, movie_release_date) 
VALUES (3, 0, 'en', 0, 'Shang-Chi and the Legend of the Ten Rings', 'Shang-Chi and the Legend of the Ten Rings', '1', NULL);
INSERT INTO BT_MOVIE (STATUS_ID, MOVIE_ID, ISO_639_1, PC_ID, movie_original_title, movie_title, movie_is_for_adult, movie_release_date) 
VALUES (4, 1, 'en', 0, 'Deadpool 2', 'Deadpool 2', '1', TO_DATE('05/18/2018','MM/DD/YYYY'));
INSERT INTO BT_MOVIE (STATUS_ID, MOVIE_ID, ISO_639_1, PC_ID, movie_original_title, movie_title, movie_is_for_adult, movie_release_date) 
VALUES (3, 2, 'en', 0, 'John Wick 4', 'John Wick 4', '1', TO_DATE('05/27/2022','MM/DD/YYYY'));
INSERT INTO BT_MOVIE (STATUS_ID, MOVIE_ID, ISO_639_1, PC_ID, movie_original_title, movie_title, movie_is_for_adult, movie_release_date) 
VALUES (4, 3, 'en', 2, '????', 'Th?ng Bình Công Chúa', '0', TO_DATE('01/27/1997','MM/DD/YYYY'));
INSERT INTO BT_MOVIE (STATUS_ID, MOVIE_ID, ISO_639_1, PC_ID, movie_original_title, movie_title, movie_is_for_adult, movie_release_date) 
VALUES (4, 4, 'en', 2, '????', 'Quá kh? và hi?n t?i', '0', TO_DATE('01/21/2003','MM/DD/YYYY'));
---------------------------------------------------
--   END DATA FOR TABLE BT_MOVIE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE BT_MOVIE_ACTOR
---------------------------------------------------
INSERT INTO BT_MOVIE_ACTOR (ACTOR_ID, STATUS_ID, MOVIE_ID) VALUES (6, 4, 3);
INSERT INTO BT_MOVIE_ACTOR (ACTOR_ID, STATUS_ID, MOVIE_ID) VALUES (4, 4, 3);
INSERT INTO BT_MOVIE_ACTOR (ACTOR_ID, STATUS_ID, MOVIE_ID) VALUES (4, 4, 4);
INSERT INTO BT_MOVIE_ACTOR (ACTOR_ID, STATUS_ID, MOVIE_ID) VALUES (5, 4, 4);
INSERT INTO BT_MOVIE_ACTOR (ACTOR_ID, STATUS_ID, MOVIE_ID) VALUES (3, 4, 1);
---------------------------------------------------
--   END DATA FOR TABLE BT_MOVIE_ACTOR
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE BT_MOVIE_GENRE
---------------------------------------------------
INSERT INTO BT_MOVIE_GENRE (GENRE_ID, STATUS_ID, MOVIE_ID) VALUES (4, 4, 3);
INSERT INTO BT_MOVIE_GENRE (GENRE_ID, STATUS_ID, MOVIE_ID) VALUES (5, 4, 3);
INSERT INTO BT_MOVIE_GENRE (GENRE_ID, STATUS_ID, MOVIE_ID) VALUES (8, 4, 3);
INSERT INTO BT_MOVIE_GENRE (GENRE_ID, STATUS_ID, MOVIE_ID) VALUES (4, 4, 4);
INSERT INTO BT_MOVIE_GENRE (GENRE_ID, STATUS_ID, MOVIE_ID) VALUES (5, 4, 4);
INSERT INTO BT_MOVIE_GENRE (GENRE_ID, STATUS_ID, MOVIE_ID) VALUES (8, 4, 4);
---------------------------------------------------
--   END DATA FOR TABLE BT_MOVIE_GENRE
---------------------------------------------------

