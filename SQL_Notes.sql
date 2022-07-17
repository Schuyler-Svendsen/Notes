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
VARCHAR              
CHAR               /*  Has a fixed length, Faster for fixed length text  */
NUMBERS
    INT
    DECIMAL(# digits, # decimals)
    FLOAT / DOUBLE           /*  Are approximates to around 7 digits  */
CREATE TABLE items(price DECIMAL(5,2));
INSERT INTO items(price) VALUES(786959);    -->  = 999.99

-->  Formatting Dates <-- 
DATE / TIME / DATETIME          /*  Value for Date and Time  YYY-MM-DD HH:MM:SS */
TIMESTAMP DEFAULT NOW()         /*  Good for timestamping creation or updates - Smaller */
CURDATE() / CURTIME()           /*  Gives Current Date & Time  */
DAY() / DAYNAME() / DAYOFWEEK() / DAYOFYEAR() / MONTH() / MONTHNAME() / HOUR() / MINUTE()
DATE_FORMAT()                   /*  See Documentation for Abbreviated Codes  */
DATEDIFF(expr1, expr2)          /*  Subtracts the two dates  */
DATE_ADD

  CREATE TABLE people (name VARCHAR(100), 
     birthdate DATE, birthtime TIME, birthdt DATETIME,
     changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP);
 
  INSERT INTO people (name, birthdate, birthtime, birthdt)
    VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

  SELECT DAYOFWEEK(NOW());   SELECT DATE_FORMAT(NOW(), '%w');    /*  Numerical           */
  SELECT DAYNAME(NOW());     SELECT DATE_FORMAT(NOW(), '%W');    /*  String name         */
  SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');                     /*  mm/dd/yyy           */
  SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');                   /*  Month Date at Time  */

SELECT name, birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);

-->  LOGICAL OPERATORS  <--
!=                           /*  Not Equal */
NOT LIKE                     
> / <                        /*   Greater Than / Less Than                */
AND / &&                     /*   Combines Cluases.  Both must be true    */ 
OR / ||                      /*   Only 1 condition must be true           */
BETWEEN                      /*   Select for an upper and lower range     */
CAST()                       /*   Converts from one data type to another  */
IN() / NOT IN()              /*   Is  or  Not is                          */
%                            /*   Modulo Tests if something is even       */
CASE  WHEN  ElSE  END AS

SELECT title, author_lname FROM books WHERE author_lname != 'Harris'
  AND released_year > 2014;

SELECT title, released_year FROM books
  WHERE released_year >= 2000 AND released_year % 2 != 0;

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 

SELECT author_fname, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
GROUP BY author_lname, author_fname;


-->  RELATIONSHIPS AND JOINS <--
FOREIGN KEY()  REFERENCES <>()                   /*  When creating tables  */
INNER JOIN
LEFT JOIN
RIGHT JOIN
IFNULL(<value>,  )                               /*  If null, repleace <value> with 2nd    */
ON DELETE CASCADE                                /*  Rows in child table deleted w/ parent */ 

  -- IMPLICIT INNER JOIN
SELECT first_name, last_name, order_date, amount
FROM customers, orders 
    WHERE customers.id = orders.customer_id;
    
  -- EXPLICIT INNER JOINS
SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id;

  -- LEFT JOIN
SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;

  --ON DELETE CASCADE



  CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
  );
  CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
  );
