--############################### Buoi 1    #################################
/* Admin worksheet
create user B1510210 identified by "THOracle@2021" quota 10M on DATA;
grant create session, create table, create user, alter user, drop user, create procedure, create trigger to B1510210 with admin option;

revoke create session from B1510210;
*/
-- User B1510210 worksheet
CREATE TABLE animals (
    name CHAR(30) NOT NULL
);
drop table animals;
CREATE TABLE pets (
    name VARCHAR(30) NOT NULL,
    breed VARCHAR(30) NOT NULL
);
-- Oracle only allows insert one row at a time
-- "column not allowed here" error occurs when use double quote "cat" in values
INSERT INTO pets (name, breed) VALUES ('dog', 'Husky');
INSERT INTO pets (name, breed) VALUES ('cat', 'Persian Tabby');
INSERT INTO pets (name, breed) VALUES ('parrot', 'Scarlet macaw');

SELECT * FROM pets;