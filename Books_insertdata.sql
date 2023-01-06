--=========================================================================
-- This file insert data to the tables of the database 'Books' and correct
-- some mistakes:
--		- removing a column from a table
--		- adding new data in several tables
-- Then, all data of table 'tbooks' are shown
--=======================================================================


USE Books  -- to tell SQL to use the database 'Books' for the next queries


--======================================================================
-- Adding data to the table of the authors
INSERT INTO tauthors(auth_ID, firstname, middlename, lastname)
	VALUES(	
	01,'Walter','','Isaacson'),
	(02,'Rich','','Horwath'),
	(03,'Napoleon','','Hill'),
	(04,'Dale', '', 'Carnegie'),
	(05, 'David', '', 'Butler'),
	(06, 'Timothy','','Ferris'),
	(07, 'Sun', '', 'Tzu'),
	(08, 'Daniel', '', 'Kahneman'),
	(09,'Jim', '', 'Collins'),
	(10,'Ford','R','Myers'),
	(11,'James','','Clear'),
	(12,'Rich','','Horwath');

--====================================================================
-- Adding data to the table of the publishers
INSERT INTO tpublishers(pub_ID,pub_Name,pub_web,country_ID)
	VALUES(
	01,'Simon & Schuster','',''),
	(02,'HarperCollins','http://www.harpercollins.com/','USA'),
	(03,'John Wiley & Sons', 'http://www.wiley.com/','USA'),
	(04,'Avery Publishing Group','https://www.penguin.com/avery-overview/',''),
	(05,'Farrar, Straus and Giroux','','USA'),
	(06,'Signet','',''),
	(07,'Penguin','','');

--====================================================================
-- Since I forget to create a column for the authors id, I add it --
ALTER TABLE tbooks
ADD auth_ID INT NOT NULL,
ADD	publisher_ID  NOT NULL;

-- Adding a new author
INSERT INTO tauthors(auth_ID,firstname,middlename,lastname)
	VALUES
	(13,'Adelle',NULL,'Davis');

--====================================================================
---- I don't need the column city in the table tbooks
ALTER TABLE tbooks 
DROP COLUMN city;


--====================================================================
-- I add data related to some great books
INSERT INTO tbooks(book_ID,title,isbn,book_year,auth_ID,publisher_ID)
	VALUES
	(01,'How to win friends and influence people',	'9781451612578',2011,04,01),
	(02,'Good to great - why some companies make the leap... and others don’t','0066620996',2011,09,02),
	(03,'Get the job you want, even no one''s hiring',	'9780470493854',2009,10,03),
	(04,'Elevate - The three disciplines of advanced strategic thinking', '9781118596463',2014,12,03),
	(05,'Benjamin Franklin and the invention of America : an American life','9780743260848',2003,01,01),
	(06,'Atomic Habits: An Easy &Proven Way to Build Good Habits &Break Bad Ones',	'9780735211292',NULL,11,04),
	(07,'Thinking fast and slow','9780374533557',2011,08,05),
	(08,'Speed reading with the right brain: Learn to read ideas instead of just words',NULL,2014,05,NULL),
	(09,'Let''s Eat Right to Keep Fit','9780451155504',1970,13,06),
	(10,'Think and grow rich',	'9781585424337',2005,03,07);

--====================================================================
-- Showing all data from table 'tbooks'
SELECT * FROM tbooks
