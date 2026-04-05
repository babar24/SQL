# SQL
This repository can be used for quick revisions of concepts of SQL which includes syntax and definitions of the different types of SQL commands. Most of the commands are provided in MySQL syntax. Syntax may vary for SQL Server and PostgreSQL.

## Data Manipulation Language (DML) Commands

| Command | Description | Syntax | Example |
|---|---|---|---|
| SELECT | The SELECT command retrieves data from a database. | `SELECT column1, column2 FROM table_name;` | `SELECT first_name, last_name FROM customers;` |
| INSERT | The INSERT command adds new records to a table. | `INSERT INTO table_name (column1, column2) VALUES (value1, value2);` | `INSERT INTO customers (first_name, last_name) VALUES ('Mary', 'Doe');` |
| UPDATE | The UPDATE command is used to modify existing records in a table. | `UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;` | `UPDATE employees SET employee_name = 'John Doe', department = 'Marketing' WHERE employee_id = 1;` |
| DELETE | The DELETE command removes records from a table. | `DELETE FROM table_name WHERE condition;` | `DELETE FROM employees WHERE employee_name = 'John Doe';` |

## Data Definition Language (DDL) Commands

| Command | Description | Syntax | Example |
|---|---|---|---|
| CREATE | The CREATE command creates a new database and objects, such as a table, index, view, or stored procedure. | `CREATE TABLE table_name (column1 datatype1, column2 datatype2, ...);` | `CREATE TABLE employees (employee_id INT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), age INT);` |
| ALTER | The ALTER command adds, deletes, or modifies columns in an existing table. | `ALTER TABLE table_name ADD column_name datatype;` | `ALTER TABLE customers ADD email VARCHAR(100);` |
| DROP | The DROP command is used to drop an existing table in a database. | `DROP TABLE table_name;` | `DROP TABLE customers;` |
| TRUNCATE | The TRUNCATE command is used to delete the data inside a table, but not the table itself. | `TRUNCATE TABLE table_name;` | `TRUNCATE TABLE customers;` |

## Data Control Language (DCL) Commands

| Command | Description | Syntax | Example |
|---|---|---|---|
| GRANT | The GRANT command is used to give specific privileges to users or roles. | `GRANT SELECT, INSERT ON table_name TO user_name;` | `GRANT SELECT, INSERT ON employees TO 'John Doe';` |
| REVOKE | The REVOKE command is used to take away privileges previously granted to users or roles. | `REVOKE SELECT, INSERT ON table_name FROM user_name;` | `REVOKE SELECT, INSERT ON employees FROM 'John Doe';` |

## Querying Data Commands

| Command | Description | Syntax | Example |
|---|---|---|---|
| SELECT Statement | The SELECT statement is the primary command used to retrieve data from a database. | `SELECT column1, column2 FROM table_name;` | `SELECT first_name, last_name FROM customers;` |
| WHERE Clause | The WHERE clause is used to filter rows based on a specified condition. | `SELECT * FROM table_name WHERE condition;` | `SELECT * FROM customers WHERE age > 30;` |
| ORDER BY Clause | The ORDER BY clause is used to sort the result set in ascending or descending order based on a specified column. | `SELECT * FROM table_name ORDER BY column_name ASC;` or `SELECT * FROM table_name ORDER BY column_name DESC;` | `SELECT * FROM products ORDER BY price DESC;` |
| GROUP BY Clause | The GROUP BY clause groups rows based on the values in a specified column. It is often used with aggregate functions like COUNT, SUM, AVG, etc. | `SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name;` | `SELECT category, COUNT(*) FROM products GROUP BY category;` |
| HAVING Clause | The HAVING clause filters grouped results based on a specified condition. | `SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name HAVING condition;` | `SELECT category, COUNT(*) FROM products GROUP BY category HAVING COUNT(*) > 5;` |

## Joining Commands

| Command | Description | Syntax | Example |
|---|---|---|---|
| INNER JOIN | The INNER JOIN command returns rows with matching values in both tables. | `SELECT * FROM table1 INNER JOIN table2 ON table1.column = table2.column;` | `SELECT * FROM employees INNER JOIN departments ON employees.department_id = departments.id;` |
| LEFT JOIN / LEFT OUTER JOIN | The LEFT JOIN command returns all rows from the left table and matching rows from the right table. | `SELECT * FROM table1 LEFT JOIN table2 ON table1.column = table2.column;` | `SELECT * FROM employees LEFT JOIN departments ON employees.department_id = departments.id;` |
| RIGHT JOIN / RIGHT OUTER JOIN | The RIGHT JOIN command returns all rows from the right table and matching rows from the left table. | `SELECT * FROM table1 RIGHT JOIN table2 ON table1.column = table2.column;` | `SELECT * FROM employees RIGHT JOIN departments ON employees.department_id = departments.department_id;` |
| FULL JOIN / FULL OUTER JOIN | The FULL JOIN command returns all rows when there is a match in either the left or right table. | `SELECT * FROM table1 FULL JOIN table2 ON table1.column = table2.column;` | `SELECT * FROM employees LEFT JOIN departments ON employees.employee_id = departments.employee_id UNION SELECT * FROM employees RIGHT JOIN departments ON employees.employee_id = departments.employee_id;` |
| CROSS JOIN | The CROSS JOIN command combines every row from the first table with every row from the second table, creating a Cartesian product. | `SELECT * FROM table1 CROSS JOIN table2;` | `SELECT * FROM employees CROSS JOIN departments;` |
| SELF JOIN | The SELF JOIN command joins a table with itself. | `SELECT * FROM table1 t1, table1 t2 WHERE t1.column = t2.column;` | `SELECT * FROM employees t1, employees t2 WHERE t1.employee_id = t2.employee_id;` |
| NATURAL JOIN | The NATURAL JOIN command matches columns with the same name in both tables. | `SELECT * FROM table1 NATURAL JOIN table2;` | `SELECT * FROM employees NATURAL JOIN departments;` |

## Subqueries in SQL

| Command | Description | Syntax | Example |
|---|---|---|---|
| IN | The IN command is used to determine whether a value matches any value in a subquery result. It is often used in the WHERE clause. | `SELECT column(s) FROM table WHERE value IN (subquery);` | `SELECT * FROM customers WHERE city IN (SELECT city FROM suppliers);` |
| ANY | The ANY command is used to compare a value to any value returned by a subquery. It can be used with comparison operators like =, >, <, etc. | `SELECT column(s) FROM table WHERE value < ANY (subquery);` | `SELECT * FROM products WHERE price < ANY (SELECT unit_price FROM supplier_products);` |
| ALL | The ALL command is used to compare a value to all values returned by a subquery. It can be used with comparison operators like =, >, <, etc. | `SELECT column(s) FROM table WHERE value > ALL (subquery);` | `SELECT * FROM orders WHERE order_amount > ALL (SELECT total_amount FROM previous_orders);` |

## Aggregate Functions Commands

| Command | Description | Syntax | Example |
|---|---|---|---|
| COUNT() | The COUNT command counts the number of rows or non-null values in a specified column. | `SELECT COUNT(column_name) FROM table_name;` | `SELECT COUNT(age) FROM employees;` |
| SUM() | The SUM command is used to calculate the sum of all values in a specified column. | `SELECT SUM(column_name) FROM table_name;` | `SELECT SUM(revenue) FROM sales;` |
| AVG() | The AVG command is used to calculate the average (mean) of all values in a specified column. | `SELECT AVG(column_name) FROM table_name;` | `SELECT AVG(price) FROM products;` |
| MIN() | The MIN command returns the minimum (lowest) value in a specified column. | `SELECT MIN(column_name) FROM table_name;` | `SELECT MIN(price) FROM products;` |
| GROUP_CONCAT() | The GROUP_CONCAT command concatenates data from multiple rows into one field. It is a GROUP BY aggregate function that returns NULL if no non-NULL values exist. | `SELECT col1, col2, GROUP_CONCAT([DISTINCT] col_name [ORDER BY col_name] [SEPARATOR str_val]) FROM table_name GROUP BY col_name;` | `SELECT dept_id, GROUP_CONCAT(DISTINCT emp_id ORDER BY emp_id SEPARATOR ', ') AS "employees ids" FROM employee GROUP BY dept_id;` |
| MAX() | The MAX command returns the maximum (highest) value in a specified column. | `SELECT MAX(column_name) FROM table_name;` | `SELECT MAX(price) FROM products;` |

## String Functions in SQL

| Command | Description | Syntax | Example |
|---|---|---|---|
| CONCAT() | The CONCAT command concatenates two or more strings into a single string. | `SELECT CONCAT(string1, string2, ...) AS concatenated_string FROM table_name;` | `SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;` |
| CONCAT_WS() | The CONCAT_WS() function adds two or more expressions together with a separator. | `SELECT CONCAT_WS(separator, expression1, expression2, expression3, ...) FROM table_name;` | `SELECT CONCAT_WS('-', 'SQL', 'Tutorial', 'is', 'fun!') AS ConcatenatedString;` |
| STRCMP() | The STRCMP() function compares two strings. Returns 0 if equal, -1 if string1 < string2, 1 if string1 > string2. | `SELECT STRCMP(string1, string2) FROM table_name;` | `SELECT STRCMP('SQL Tutorial', 'SQL Tutorial');` |
| SUBSTRING()/SUBSTR() | The SUBSTRING command extracts a substring from a string. | `SELECT SUBSTRING(string FROM start_position [FOR length]) AS substring FROM table_name;` or `SELECT SUBSTR(string, start, length) FROM table_name;` | `SELECT SUBSTRING(product_name FROM 1 FOR 5) AS substring FROM products;` |
| MID() | The MID() function extracts a substring from a string (starting at any position). | `SELECT MID(string, start, length) FROM table_name;` | `SELECT MID('SQL Tutorial', 5, 3) AS ExtractString;` |
| CHAR_LENGTH()/LENGTH()/CHARACTER_LENGTH() | The LENGTH command returns the length (number of characters) of a string. | `SELECT CHAR_LENGTH(string) AS length FROM table_name;` | `SELECT CHAR_LENGTH(product_name) AS length FROM products;` |
| UCASE()/UPPER() | The UPPER command converts all characters in a string to uppercase. | `SELECT UPPER(string) AS uppercase_string FROM table_name;` | `SELECT UPPER(first_name) AS uppercase_first_name FROM employees;` |
| LCASE()/LOWER() | The LOWER command converts all characters in a string to lowercase. | `SELECT LOWER(string) AS lowercase_string FROM table_name;` | `SELECT LOWER(last_name) AS lowercase_last_name FROM employees;` |
| TRIM() | The TRIM command removes specified prefixes or suffixes (or whitespace by default) from a string. | `SELECT TRIM([LEADING | TRAILING | BOTH] characters FROM string) AS trimmed_string FROM table_name;` | `SELECT TRIM(TRAILING ' ' FROM full_name) AS trimmed_full_name FROM customers;` |
| LTRIM() | The LTRIM() function removes leading spaces from a string. | `SELECT LTRIM(string) FROM table_name;` | `SELECT LTRIM('     SQL Tutorial') AS LeftTrimmedString;` |
| RTRIM() | The RTRIM() function removes trailing spaces from a string. | `SELECT RTRIM(string) FROM table_name;` | `SELECT RTRIM('SQL Tutorial     ') AS RightTrimmedString;` |
| FORMAT() | The FORMAT() function formats a number to a format like "#,###,###.##", rounded to a specified number of decimal places, then returns the result as a string. | `SELECT FORMAT(number, decimal_places) FROM table_name;` | `SELECT FORMAT(250500.5634, 0);` |
| REVERSE() | The REVERSE() function reverses a string and returns the result. | `SELECT REVERSE(string) FROM table_name;` | `SELECT REVERSE(CustomerName) FROM Customers;` |
| LEFT() | The LEFT command returns a specified number of characters from the left of a string. | `SELECT LEFT(string, num_characters) AS left_string FROM table_name;` | `SELECT LEFT(product_name, 5) AS left_product_name FROM products;` |
| RIGHT() | The RIGHT command returns a specified number of characters from the right of a string. | `SELECT RIGHT(string, num_characters) AS right_string FROM table_name;` | `SELECT RIGHT(order_number, 4) AS right_order_number FROM orders;` |
| REPLACE() | The REPLACE command replaces occurrences of a substring within a string. | `SELECT REPLACE(string, old_substring, new_substring) AS replaced_string FROM table_name;` | `SELECT REPLACE(description, 'old_string', 'new_string') AS replaced_description FROM product_descriptions;` |

## Numeric Functions in SQL

| Command | Description | Syntax | Example |
|---|---|---|---|
| ROUND() | Round the number to n decimal places. | `SELECT ROUND(number, n) FROM table_name;` | `SELECT ProductName, Price, ROUND(Price, 1) AS RoundedPrice FROM Products;` |
| RAND() | Returns a random number between 0 (inclusive) and 1 (exclusive). If seed is specified, returns a repeatable sequence. | `SELECT RAND(seed);` | `SELECT RAND(6);` |
| ABS() | Returns the absolute (positive) value of a number. | `SELECT ABS(number) FROM table_name;` | `SELECT ABS(-243.5);` |
| CEIL()/CEILING() | Returns the smallest integer value that is greater than or equal to a number. | `SELECT CEIL(number) FROM table_name;` | `SELECT CEIL(25.75);` |
| FLOOR() | Returns the largest integer value that is smaller than or equal to a number. | `SELECT FLOOR(number) FROM table_name;` | `SELECT FLOOR(25.75);` |
| PI() | Returns the value of PI. | `SELECT PI();` | `SELECT PI();` |
| DEGREES() | Converts a value in radians to degrees. | `SELECT DEGREES(number) FROM table_name;` | `SELECT DEGREES(1.5);` |
| RADIANS() | Converts a degree value into radians. | `SELECT RADIANS(number) FROM table_name;` | `SELECT RADIANS(180);` |
| DIV | Integer division operator that returns the quotient. | `SELECT x DIV y FROM table_name;` | `SELECT 10 DIV 5;` |
| POW()/POWER() | Returns the value of a number raised to the power of another number. | `SELECT POW(x, y) FROM table_name;` | `SELECT POW(4, 2);` |
| MOD() | Returns the remainder of a number divided by another number. | `SELECT MOD(x, y) FROM table_name;` | `SELECT 18 MOD 4;` |
| SQRT() | Returns the square root of a number. | `SELECT SQRT(number) FROM table_name;` | `SELECT SQRT(64);` |
| TRUNCATE() | Truncates a number to the specified number of decimal places. | `SELECT TRUNCATE(number, decimals) FROM table_name;` | `SELECT TRUNCATE(135.375, 2);` |

### Date and Time SQL Commands

| Command | Description | Syntax | Example | Notes |
|---|---|---|---|---|
| CURRENT_DATE()/CURDATE() | The CURRENT_DATE command returns the current date. | `SELECT CURRENT_DATE() AS current_date;` | `SELECT CURRENT_DATE() AS current_date;` | Date returned as `YYYY-MM-DD` or `YYYYMMDD` |
| CURRENT_TIME()/CURTIME() | The CURRENT_TIME command returns the current time. | `SELECT CURRENT_TIME() AS current_time;` | `SELECT CURRENT_TIME() AS current_time;` | Time returned as `HH:MM:SS` or `HHMMSS.uuuuuu` |
| CURRENT_TIMESTAMP() | The CURRENT_TIMESTAMP command returns the current date and time. | `SELECT CURRENT_TIMESTAMP() AS current_timestamp;` | `SELECT CURRENT_TIMESTAMP() AS current_timestamp;` | Date/time returned as `YYYY-MM-DD HH:MM:SS` or `YYYYMMDDHHMMSS.uuuuuu` |
| NOW() | The NOW() function returns the current date and time. | `SELECT NOW();` | `SELECT NOW();` | Date/time returned as `YYYY-MM-DD HH:MM:SS` or `YYYYMMDDHHMMSS.uuuuuu` |
| DATE() | The DATE() function extracts the date part from a datetime expression. | `SELECT DATE(expression) FROM table_name;` | `SELECT DATE('2017-06-15');` | |
| DAY()/DAYOFMONTH() | Returns the day of the month for a given date (1 to 31). | `SELECT DAY(date) FROM table_name;` | `SELECT DAY('2017-06-15 09:34:21');` | |
| DAYNAME() | Returns the weekday name for a given date. | `SELECT DAYNAME(date) FROM table_name;` | `SELECT DAYNAME('2017-06-15');` | |
| DAYOFWEEK() | Returns the weekday index for a given date (1 = Sunday, 2 = Monday, ..., 7 = Saturday). | `SELECT DAYOFWEEK(date) FROM table_name;` | `SELECT DAYOFWEEK('2017-06-15 09:34:21');` | |
| DAYOFYEAR() | Returns the day of the year for a given date (1 to 366). | `SELECT DAYOFYEAR(date) FROM table_name;` | `SELECT DAYOFYEAR('2017-01-01');` | |
| MONTH() | Returns the month part for a given date (1 to 12). | `SELECT MONTH(date) FROM table_name;` | `SELECT MONTH('2017-06-15 09:34:21');` | |
| MONTHNAME() | Returns the name of the month for a given date. | `SELECT MONTHNAME(date) FROM table_name;` | `SELECT MONTHNAME('2017-06-15');` | |
| QUARTER() | Returns the quarter of the year for a given date (1 to 4). | `SELECT QUARTER(date) FROM table_name;` | `SELECT QUARTER('2017-06-15');` | Jan–Mar = 1, Apr–Jun = 2, Jul–Sep = 3, Oct–Dec = 4 |
| WEEK() | Returns the week number for a given date (0 to 53). | `SELECT WEEK(date, firstdayofweek) FROM table_name;` | `SELECT WEEK('2017-06-15');` | `firstdayofweek` determines week numbering rules |
| WEEKDAY() | Returns the weekday number for a given date (0 = Monday, ..., 6 = Sunday). | `SELECT WEEKDAY(date) FROM table_name;` | `SELECT WEEKDAY('2017-06-15');` | |
| WEEKOFYEAR() | Returns the week number for a date (1 to 53) using Monday as first day and week 1 has > 3 days. | `SELECT WEEKOFYEAR(date) FROM table_name;` | `SELECT WEEKOFYEAR('2017-01-01');` | |
| YEAR() | Returns the year part for a given date (1000 to 9999). | `SELECT YEAR(date) FROM table_name;` | `SELECT YEAR('2017-06-15');` | |
| YEARWEEK() | Returns the year and week number for a date. | `SELECT YEARWEEK(date, firstdayofweek) FROM table_name;` | `SELECT YEARWEEK('2017-10-25');` | `firstdayofweek` changes how weeks are calculated |
| DATE_FORMAT() | Formats a date using the specified format string. | `SELECT DATE_FORMAT(date, format) FROM table_name;` | `SELECT DATE_FORMAT('2017-06-15', '%W %M %e %Y');` | Uses format codes like `%Y`, `%m`, `%d`, `%H`, `%i`, `%s`, etc. |
| DATE_ADD()/DATE_SUB()/ADDDATE() | Adds or subtracts a specified interval from a date. | `SELECT DATE_ADD(date_expression, INTERVAL value unit) AS new_date;` | `SELECT DATE_ADD('2017-06-15 09:34:21', INTERVAL -3 HOUR);` | Units include `MICROSECOND`, `SECOND`, `MINUTE`, `HOUR`, `DAY`, `WEEK`, `MONTH`, `QUARTER`, `YEAR`, etc. |
| EXTRACT() | Extracts a specific part from a date or time. | `SELECT EXTRACT(part FROM date_expression) AS extracted_part;` | `SELECT EXTRACT(MONTH FROM '2017-06-15');` | |
| TIMESTAMPDIFF() | Calculates the difference between two timestamps in the specified unit. | `SELECT TIMESTAMPDIFF(unit, timestamp1, timestamp2) AS difference;` | `SELECT TIMESTAMPDIFF(DAY, '1898-03-22', '2019-05-02') AS Result;` | Units can be `DAY`, `WEEK`, `MONTH`, `QUARTER`, `YEAR`, `HOUR`, `MINUTE`, `SECOND`, `MICROSECOND` |
| DATEDIFF() | Calculates the difference in days between two dates. | `SELECT DATEDIFF(date1, date2) AS difference_in_days;` | `SELECT DATEDIFF('2017/08/25', '2011/08/25') AS DateDiff;` | Result is `date1 - date2` |

### Conditional/Advanced SQL Expressions

| Command | Description | Syntax | Example |
|---|---|---|---|
| CASE Statement | The CASE statement allows you to perform conditional logic within a query. | `SELECT column1, column2, CASE WHEN condition1 THEN result1 WHEN condition2 THEN result2 ELSE default_result END AS alias FROM table_name;` | `SELECT order_id, total_amount, CASE WHEN total_amount > 1000 THEN 'HighValueOrder' WHEN total_amount > 500 THEN 'Medium ValueOrder' ELSE 'Low ValueOrder' END AS order_status FROM orders;` |
| IF() | The IF() function evaluates a condition and returns a value based on the evaluation. | `SELECT IF(condition, true_value, false_value) AS alias FROM table_name;` | `SELECT name, age, IF(age > 50, 'Senior', 'Junior') AS employee_category FROM employees;` |
| COALESCE() | The COALESCE() function returns the first non-null value from a list of values. | `SELECT COALESCE(value1, value2, ...) AS alias FROM table_name;` | `SELECT COALESCE(first_name, middle_name) AS preferred_name FROM employees;` |
| BIN() | The BIN() function returns a binary representation of a number as a string value. | `SELECT BIN(number) FROM table_name;` | `SELECT BIN(8);` |
| CAST()/CONVERT() | The CAST() function converts a value to the specified datatype. | `SELECT CAST(value AS datatype) FROM table_name;` | `SELECT CAST('2017-08-29' AS DATE);` |
| NULLIF() | The NULLIF() function returns NULL if two specified expressions are equal; otherwise it returns the first expression. | `SELECT NULLIF(expression1, expression2) AS alias FROM table_name;` | `SELECT NULLIF(total_amount, discounted_amount) AS diff_amount FROM orders;` |






