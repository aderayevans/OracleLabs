/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     9/12/2021 10:26:55 PM                        */
/*==============================================================*/


alter table BT_MOVIE
   drop constraint FK_BT_MOVIE_MOVIE_MOV_BT_MOVIE;

alter table BT_MOVIE
   drop constraint FK_BT_MOVIE_PC_MOVIE_BT_PRODU;

alter table BT_MOVIE
   drop constraint FK_BT_MOVIE_SL_MOVIE_BT_SPOKE;

alter table BT_MOVIE_ACTOR
   drop constraint FK_BT_MOVIE_MOVIE_ACT_BT_ACTOR;

alter table BT_MOVIE_ACTOR
   drop constraint FK_BT_MOVIE_MOVIE_ACT_BT_MOVIE;

alter table BT_MOVIE_GENRE
   drop constraint FK_BT_MOVIE_MOVIE_GEN_BT_GENRE;

alter table BT_MOVIE_GENRE
   drop constraint FK_BT_MOVIE_MOVIE_GEN_BT_MOVIE;

drop table BT_ACTOR cascade constraints;

drop table BT_GENRE cascade constraints;

drop index SL_MOVIE_FK;

drop index PC_MOVIE_FK;

drop index MOVIE_MOVIE_STATUS_FK;

drop table BT_MOVIE cascade constraints;

drop index MOVIE_ACTOR_FK2;

drop index MOVIE_ACTOR_FK;

drop table BT_MOVIE_ACTOR cascade constraints;

drop index MOVIE_GENRE_FK2;

drop index MOVIE_GENRE_FK;

drop table BT_MOVIE_GENRE cascade constraints;

drop table BT_MOVIE_STATUS cascade constraints;

drop table BT_PRODUCTION_COMPANY cascade constraints;

drop table BT_SPOKEN_LANGUAGE cascade constraints;

/*==============================================================*/
/* Table: BT_ACTOR                                              */
/*==============================================================*/
create table BT_ACTOR 
(
   ACTOR_ID             INTEGER              not null,
   ACTOR_NAME           CHAR(50),
   ACTOR_GENDER         CHAR(10)
   CHECK (ACTOR_GENDER IN ('male', 'female')),
   constraint PK_BT_ACTOR primary key (ACTOR_ID)
);

/*==============================================================*/
/* Table: BT_GENRE                                              */
/*==============================================================*/
create table BT_GENRE 
(
   GENRE_ID             INTEGER              not null,
   GENRE_TITLE          CHAR(50),
   constraint PK_BT_GENRE primary key (GENRE_ID)
);

/*==============================================================*/
/* Table: BT_MOVIE                                              */
/*==============================================================*/
create table BT_MOVIE 
(
   STATUS_ID            INTEGER              not null,
   MOVIE_ID             INTEGER              not null,
   ISO_639_1            CHAR(50)             not null,
   PC_ID                INTEGER              not null,
   MOVIE_ORIGINAL_TITLE CHAR(50),
   MOVIE_TITLE          CHAR(50),
   MOVIE_IS_FOR_ADULT   SMALLINT,
   MOVIE_RELEASE_DATE   DATE,
   constraint PK_BT_MOVIE primary key (STATUS_ID, MOVIE_ID)
);

/*==============================================================*/
/* Index: MOVIE_MOVIE_STATUS_FK                                 */
/*==============================================================*/
create index MOVIE_MOVIE_STATUS_FK on BT_MOVIE (
   STATUS_ID ASC
);

/*==============================================================*/
/* Index: PC_MOVIE_FK                                           */
/*==============================================================*/
create index PC_MOVIE_FK on BT_MOVIE (
   PC_ID ASC
);

/*==============================================================*/
/* Index: SL_MOVIE_FK                                           */
/*==============================================================*/
create index SL_MOVIE_FK on BT_MOVIE (
   ISO_639_1 ASC
);

/*==============================================================*/
/* Table: BT_MOVIE_ACTOR                                        */
/*==============================================================*/
create table BT_MOVIE_ACTOR 
(
   ACTOR_ID             INTEGER              not null,
   STATUS_ID            INTEGER              not null,
   MOVIE_ID             INTEGER              not null,
   constraint PK_BT_MOVIE_ACTOR primary key (ACTOR_ID, STATUS_ID, MOVIE_ID)
);

/*==============================================================*/
/* Index: MOVIE_ACTOR_FK                                        */
/*==============================================================*/
create index MOVIE_ACTOR_FK on BT_MOVIE_ACTOR (
   ACTOR_ID ASC
);

/*==============================================================*/
/* Index: MOVIE_ACTOR_FK2                                       */
/*==============================================================*/
create index MOVIE_ACTOR_FK2 on BT_MOVIE_ACTOR (
   STATUS_ID ASC,
   MOVIE_ID ASC
);

/*==============================================================*/
/* Table: BT_MOVIE_GENRE                                        */
/*==============================================================*/
create table BT_MOVIE_GENRE 
(
   GENRE_ID             INTEGER              not null,
   STATUS_ID            INTEGER              not null,
   MOVIE_ID             INTEGER              not null,
   constraint PK_BT_MOVIE_GENRE primary key (GENRE_ID, STATUS_ID, MOVIE_ID)
);

/*==============================================================*/
/* Index: MOVIE_GENRE_FK                                        */
/*==============================================================*/
create index MOVIE_GENRE_FK on BT_MOVIE_GENRE (
   GENRE_ID ASC
);

/*==============================================================*/
/* Index: MOVIE_GENRE_FK2                                       */
/*==============================================================*/
create index MOVIE_GENRE_FK2 on BT_MOVIE_GENRE (
   STATUS_ID ASC,
   MOVIE_ID ASC
);

/*==============================================================*/
/* Table: BT_MOVIE_STATUS                                       */
/*==============================================================*/
create table BT_MOVIE_STATUS 
(
   STATUS_ID            INTEGER              not null,
   STATUS_TITLE         CHAR(50),
   constraint PK_BT_MOVIE_STATUS primary key (STATUS_ID)
);

/*==============================================================*/
/* Table: BT_PRODUCTION_COMPANY                                 */
/*==============================================================*/
create table BT_PRODUCTION_COMPANY 
(
   PC_ID                INTEGER              not null,
   PC_NAME              CHAR(50),
   PC_ORIGIN_COUNTRY    CHAR(50),
   constraint PK_BT_PRODUCTION_COMPANY primary key (PC_ID)
);

/*==============================================================*/
/* Table: BT_SPOKEN_LANGUAGE                                    */
/*==============================================================*/
create table BT_SPOKEN_LANGUAGE 
(
   ISO_639_1            CHAR(50)             not null,
   ISO_LAN_NAME         CHAR(50),
   constraint PK_BT_SPOKEN_LANGUAGE primary key (ISO_639_1)
);

alter table BT_MOVIE
   add constraint FK_BT_MOVIE_MOVIE_MOV_BT_MOVIE foreign key (STATUS_ID)
      references BT_MOVIE_STATUS (STATUS_ID);

alter table BT_MOVIE
   add constraint FK_BT_MOVIE_PC_MOVIE_BT_PRODU foreign key (PC_ID)
      references BT_PRODUCTION_COMPANY (PC_ID);

alter table BT_MOVIE
   add constraint FK_BT_MOVIE_SL_MOVIE_BT_SPOKE foreign key (ISO_639_1)
      references BT_SPOKEN_LANGUAGE (ISO_639_1);

alter table BT_MOVIE_ACTOR
   add constraint FK_BT_MOVIE_MOVIE_ACT_BT_ACTOR foreign key (ACTOR_ID)
      references BT_ACTOR (ACTOR_ID);

alter table BT_MOVIE_ACTOR
   add constraint FK_BT_MOVIE_MOVIE_ACT_BT_MOVIE foreign key (STATUS_ID, MOVIE_ID)
      references BT_MOVIE (STATUS_ID, MOVIE_ID);

alter table BT_MOVIE_GENRE
   add constraint FK_BT_MOVIE_MOVIE_GEN_BT_GENRE foreign key (GENRE_ID)
      references BT_GENRE (GENRE_ID);

alter table BT_MOVIE_GENRE
   add constraint FK_BT_MOVIE_MOVIE_GEN_BT_MOVIE foreign key (STATUS_ID, MOVIE_ID)
      references BT_MOVIE (STATUS_ID, MOVIE_ID);

