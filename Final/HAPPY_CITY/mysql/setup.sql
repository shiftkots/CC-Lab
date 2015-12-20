-- This entire database can be constructed by running “source setup.sql” from mysql.
CREATE DATABASE `happy_city` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

USE `happy_city`;

GRANT ALL PRIVILEGES ON happy_city.* TO 'the_user'@'localhost' IDENTIFIED BY 'the_password';

source file.sql;
source user.sql;
