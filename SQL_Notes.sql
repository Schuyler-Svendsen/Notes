/*  SQL Notes  */

root / sky / M.

mysql-ctl cli; /* Start the CLI  */

SHOW DATABASES;
CREATE DATABASE <name>;
DROP DATABASE <name>;
USE <database name>;
SELECT database <name>;

-->  EXAMPLE  <--
  CREATE TABLE <tablename>             /* Creating a Table */
    (
        column_name data_type,
        column_name data_type
    );
  SHOW COLUMNS FROM <tablename>;       /* See the columns in a Table */

DROP TABLE <name>;  

INSERT INTO <tablename>(column1, column2)  VALUES (value, value), (value, value);  

NOT NULL                           /*  Null not allowed  */
SELECT * FROM <table>;             /*  View Values from Table  */
SELECT * FROM <table> WHERE <value>=*
SELECT * AS .... FROM <table>

CONCAT (column name, anotherColumn)   /*  Combines text from ranges or strings - ' ' for space*/

  SELECT SUBSTRING('hello world', 3, 8)  -->  =llo worl
  SELECT SUBSTRING('Hello world', -7)  -->  =o world


-->  EXAMPLE  <--
  SELECT
    CONCAT(author_fname, ' ', author_lname) AS 'full name',
    CONCAT(stock_quantity, ' in stock') AS quantity
  FROM books;


SHOW WARNINGS;        /*  Shows Warning Values */

AUTO_INCREMENT        /*  Creates unique number identifier when inserting into table */
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

--> STRING FUNCTIONS <--
SOURCE
REPLACE 
REVERSE                /*   Reverses a String  */
CHAR_LENGTH()          /*   Tells # of characters in string  */
UPPER / LOWER          /*   Changes Case  */

--> SELECTIONS <--
DISTINCT               /*   Selects only unique values with no duplicates */
ORDER BY <value>       /*   Orders columns by <value>  */
    DESC               /*   Ascending and Descending   */
    ASC
LIMIT
WHERE * LIKE  '%da%'   /*  Searches for anywhere * has the phrase 'da'  */


-->  EXAMPLES  <--
  SELECT 
    CONCAT(title, ' - ', released_year) AS summary 
  FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title FROM books WHERE title LIKE '%\_%'  -->  Where there is 1 percent sign


--> AGGREGATE FUNCTIONS  <--
COUNT
DISTINCT
GROUP BY             /*  Good for counting averages  */
MIN / MAX            /*  Finds minimum or maximum in table */
SUM
AVG                  /*  Averages  */


-->  EXAMPLES  <--
  SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released')
    AS year FROM books GROUP BY released_year;

  SELECT title, pages FROM books 
    WHERE pages = (SELECT Max(pages) 
  FROM books);

  SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(pages) AS 'longest book'
  FROM books
  GROUP BY author_lname, author_fname ORDER BY author_lname;


-->  DATA TYPES  <--
VARCHAR            /*    */
CHAR               /*  Has a fixed length  */
NUMBERS
    INT
    DECIMAL(# digits, # decimals)

CREATE TABLE items(price DECIMAL(5,2));
INSERT INTO items(price) VALUES(786959);    -->  = 999.99

FLOAT / DOUBLE             /*  Are approximates to around 7 digits  */
DATE / TIME / DATETIME
CURDATE() / CURTIME()      /*  Gives Current Date / Time  */
DATE_FORMAT()              /*  Seed Documentation for Abbreviated Codes  */

  CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
  INSERT INTO people (name, birthdate, birthtime, birthdt)
    VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

-->  Formatting Dates <--
