-- CREATION OF THE DATABASE books AND ITS 4 TABLES --
-- The database is related to some great books --

CREATE DATABASE Books; -- To create the database books

USE Books

--- CREATION OF THE TABLES ------
CREATE TABLE tpublishers(		-- Table of data related to the publishers
	pub_ID INT PRIMARY KEY not null,
	pub_Name VARCHAR(50) not null,
	pub_web VARCHAR(500),
	country_ID VARCHAR(3)
);

CREATE TABLE tauthors(		-- Table of data related to the authors
	auth_ID INT PRIMARY KEY not null,
	firstname VARCHAR(20) not null,
	middlename VARCHAR(20),
	lastname VARCHAR(20) not null
);

CREATE TABLE tbooks(		-- Table of data related to the books
	book_ID INT PRIMARY KEY not null,
	title VARCHAR(250) not null,
	isbn VARCHAR(13),
	city VARCHAR(50),
	book_year INT
	);

CREATE TABLE tcountries(		-- Table: list of countries and their respective code 
	country_ID VARCHAR(3) PRIMARY KEY not null,
	country VARCHAR(100) not null
);