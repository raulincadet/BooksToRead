--================================================================
--		SOME QUERIES TO ANALYZE DATA
--================================================================

USE Books
select * from tbooks
-- Count the number of books, publishers, and authors found in my Books database
SELECT number_books=COUNT(title) FROM tbooks
SELECT number_publisher=COUNT(*) FROM tpublishers
SELECT number_authors=COUNT(*) FROM tauthors


-- Simple query, to display the titles of the books and their published years. 
SELECT title, book_year FROM tbooks


-- Display the books titles and their related published year, ordering the titles alphabetically, but select only those published after 2010
SELECT title,book_year FROM tbooks
WHERE book_year >2010
ORDER BY title



-- Query from several tables to display the books titles, their authors names and their publishers name
SELECT title, tauthors.firstname, tauthors.lastname, tpublishers.pub_Name
FROM tbooks
INNER JOIN tauthors ON tauthors.auth_ID=tbooks.auth_ID
INNER JOIN tpublishers ON tpublishers.pub_ID=tbooks.publisher_ID

--========================================================================================================================
-- The previous query display 12 books instead of 13. Let me find out the book titles that do not display
SELECT title FROM tbooks
WHERE title NOT IN (
SELECT title FROM tbooks
INNER JOIN tauthors ON tauthors.auth_ID=tbooks.auth_ID
INNER JOIN tpublishers ON tpublishers.pub_ID=tbooks.publisher_ID
)
-- The book not displaying when joining the tables tbooks, tauthors and tpublishers is the one for which there is not 
-- any information related to the publisher.

--===========================================================================================================
-- I want the query to display all books with their authors  full names and publishers names, but with a NULL value if 
-- an information is missing.
SELECT title, tauthors.firstname, tauthors.lastname, tpublishers.pub_Name
FROM tbooks
LEFT JOIN tauthors ON tauthors.auth_ID=tbooks.auth_ID
LEFT JOIN tpublishers ON tpublishers.pub_ID=tbooks.publisher_ID


-- Count the number of books by publisher and by year
SELECT pub_Name,tbooks.book_year, N=COUNT(tbooks.title) FROM tpublishers
LEFT JOIN tbooks ON tbooks.publisher_ID=tpublishers.pub_ID
GROUP BY pub_Name, book_year
ORDER BY pub_Name,book_year

-- Since a book title may be repeat in the list of books, I should correct the previous query
-- to count only for unique books.
SELECT Publishers=pub_Name,'Year'=tbooks.book_year, N=COUNT(DISTINCT tbooks.title) FROM tpublishers
LEFT JOIN tbooks ON tbooks.publisher_ID=tpublishers.pub_ID
GROUP BY pub_Name, book_year
ORDER BY pub_Name,book_year
-- the result show a different of count value for the publisher Wiley in 2009


--============================================================================
-- MORE STATISTICS BY PUBLISHERS, GROUPED BY PUBLISHERS NAMES
-- Mean: Mean of books by year;
-- N_year: Number of years for which the database has at least a book title for the related publishers
-- Sum: Total of books by publihser
-- myMean: Mean of books, by year, calculated using the statistical formula instead of the AVG() function previously used
-- Min: The minimum number of books, by year, for a publisher
-- Max: The maximum number of books, by year, by publisher
SELECT Publishers, Mean=CAST(AVG(N) AS float),N_year=COUNT(Publishers),Sum=SUM(N),myMean=SUM(N)/COUNT(Publishers), Min=MIN(N), Max=MAX(N) FROM
(
SELECT Publishers=pub_Name,'Year'=tbooks.book_year,N=cast(COUNT(DISTINCT tbooks.title) as float) FROM tpublishers
LEFT JOIN tbooks ON tbooks.publisher_ID=tpublishers.pub_ID
GROUP BY pub_Name,book_year) AS DECIMAL
GROUP BY Publishers  




