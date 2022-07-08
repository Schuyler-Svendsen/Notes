/*  SQL Notes  */

root / sky / M...

mysql-ctl cli; /* Start the CLI  */

SHOW DATABASES;
CREATE DATABASE <name>;
DROP DATABASE <name>;
USE <database name>;
SELECT database <name>;


CREATE TABLE <tablename>   /* Creating a Table */
    (
        column_name data_type,
        column_name data_type
    );
SHOW COLUMNS FROM <tablename>;       /* See the columns in a Table */
DESC <name>;  
DROP TABLE <name>;  

INSERT INTO <tablename>(column1, column2)  VALUES (value, value), (value, value);  

NOT NULL                        /*  Null not allowed  */
SELECT * FROM <table>;         /*  View Values from Table  */
SELECT * FROM <table> WHERE <value>=*
SELECT * AS .... FROM <table>


SHOW WARNINGS;        /*  Shows Warning Values */

AUTO_INCREMENT   /*  Creates unique number identifier when inserting into table */
DEFAULT <name>;

-->  EXAMPLE <--
CREATE TABLE employees (
    id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed',
    PRIMARY KEY(id)
);

CRUD  -->  Create, Read, Update, Delete

UPDATE <table> SET <value>=* WHERE <value>=*;    /*  Updates and replaces value  */

DELETE FROM <table> WHERE <value>=*;             /*  Deletes row with given value  */

VARCHAR  -  INT 
