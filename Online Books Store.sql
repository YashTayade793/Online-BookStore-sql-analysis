CREATE DATABASE Book_Store;
USE Book_Store;

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

-- 1) Retrieve all books in the "Fiction" genre:
		SELECT * FROM books 
		WHERE Genre = 'Fiction';

-- 2) Find books published after the year 1950:
		SELECT * FROM books 
		WHERE Published_Year > 1950;
    
-- 3) List all customers from the Canada:
		SELECT * FROM customers	
		WHERE Country = 'Canada';
    
-- 4) Show orders placed in November 2023:
		SELECT * FROM orders
		WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
		SELECT SUM(Stock) AS Total_Stock 
        FROM books;

-- 6) Find the details of the most expensive book:
		SELECT * FROM books
        ORDER BY Price DESC
        LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
		SELECT * FROM orders 
		WHERE Quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:
		SELECT * FROM orders
        WHERE Total_Amount > 20;

-- 9) List all genres available in the Books table:
		SELECT DISTINCT Genre 
        FROM books;
        
-- 10) Find the book with the lowest stock:
		SELECT * FROM books 
        ORDER BY Stock ASC
        LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:
		SELECT 
        ROUND(SUM(Total_Amount),2) AS Revenue 
        FROM orders;
        
-- 12) Retrieve the total number of books sold for each genre:
		SELECT B.Genre,
        COUNT(O.Quantity) AS Total_Books_Sold
		FROM orders AS O
		INNER JOIN  books AS B
        ON O.Book_ID = B.Book_ID
        GROUP BY B.Genre;
        
-- 2) Find the average price of books in the "Fantasy" genre:
		SELECT Genre, ROUND(AVG(Price),2) AS AVG_PRICE
        FROM books
        WHERE Genre = 'Fantasy'
        GROUP BY Genre;

-- 3) List customers who have placed at least 2 orders:
		SELECT O.Customer_ID, C.name, 
        COUNT(O.order_id) AS NO_OF_ORDERS 
        FROM orders AS O
        INNER JOIN customers AS C
        ON O.Customer_ID = C.Customer_ID
        GROUP BY O.Customer_ID, C.name
        HAVING NO_OF_ORDERS >= 2;

-- 4) Find the most frequently ordered book:
		SELECT O.BooK_ID, B.Title, B.Author, B.Genre, 
        COUNT(O.Order_ID) AS NO_OF_BOOKS
        FROM orders AS O
        INNER JOIN books AS B
        ON O.Book_id = B.Book_id
        GROUP BY B.BooK_ID, B.Title, B.Author, B.Genre
        ORDER BY NO_OF_BOOKS DESC
        LIMIT 1;
        
-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
		SELECT * FROM books
        WHERE Genre = 'Fantasy'
        ORDER BY Price DESC 
        LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
		SELECT B.Author, 
        SUM(O.Quantity) AS Total_Quantity
        FROM Books AS B 
        INNER JOIN Orders AS O
        ON B.Book_ID = O.Book_ID
        GROUP BY B.Author
        ORDER BY Total_Quantity DESC;

-- 7) List the cities where customers who spent over $30 are located:
		SELECT DISTINCT C.CITY, ROUND(O.Total_Amount,0) AS Total_Amount
        FROM Customers AS C 
        INNER JOIN Orders AS O
        ON C.Customer_ID = O.Order_ID
        WHERE Total_Amount > 30 
        ORDER BY Total_Amount DESC;
        
-- 8) Find the customer who spent the most on orders:
		SELECT C.Customer_ID, C.Name, 
        ROUND(SUM(O.Total_Amount),0) AS Total_Spent
        FROM Orders AS O
        INNER JOIN Customers AS C
        ON O.Customer_ID = C.Customer_ID
        GROUP BY C.Customer_ID, C.Name
        ORDER BY Total_Spent DESC 
        LIMIT 1;
        
-- 9) Calculate the stock remaining after fulfilling all orders:
		SELECT B.Book_ID, B.Title, B.Stock, 
		COALESCE(SUM(O.QUANTITY),0) AS Order_Quantity,
		B.Stock - COALESCE(SUM(O.QUANTITY),0) AS Remaining_Quantity 
		FROM BOOKS AS B
		LEFT JOIN ORDERS AS O
		ON B.BOOK_ID = O.BOOK_ID
		GROUP BY B.Book_ID, B.Title, B.Stock;

		