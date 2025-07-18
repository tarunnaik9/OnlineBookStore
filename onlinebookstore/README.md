#  Online Book Store 
1. User Login Credentials: (tarun/tarun) || (username / password)

2. Admin Login Credentials: (admin/admin123)

# About 
A full-stack online book store project developed using JSP, Servlets, JDBC, MySQL, and Tomcat, enabling users to register, log in, browse books, add them to cart, and purchase. Admins can manage the book inventory (add, delete, view).

## Homepage
![Book Page](onlinebookstore/src/main/webapp/images/homepage.png)


# This Website is built for following purpose:-

1. For Selling books online.

2. Maintaining books selling history.

3. Adding and managing books.

4. User Friendly.

5. For Implementation of Http Servlets in Java.


# Admin Have Following Access for this online store site:-

1. Add New Books.

2. View Books Available.

3. Remove Books.

4. Increase Books Amount.


# Users Have Following Access for this online store site:-

1. Create New Account or Register.

2. Login.

3. View Available Books.

4. Select Books to Buy.

5. Select Books Quantity.

6. Buy Books.

7. Get Payment Receipt.


#  Tech Stack Used :-

1.Front-End Development:

   HTML

   CSS

   JSP

2.Back-End Development:

   Java [JDK 8+]

   JDBC

   Servlet

3.Database:

   MySql

4.Server:

   Apache Tomcat

5.Tools : 	

   IDE - Eclipse EE
 
#  How to Setup and Run Locally
### Note:
> This project requires **Apache Tomcat 9.0** to run.  
> Please install it locally to deploy the project in Eclipse or IntelliJ.

Download Link : https://tomcat.apache.org/download-90.cgi
Youtube resource : https://youtu.be/PH-bK3g2YmU?si=zvjdMk-lavILknro

Keep Tomcat outside your project folder, like this:
 F:\
├── apache-tomcat-9.0.100\    ← ✅ Keep this here (not pushed to GitHub)
└── onlinebookstore\          ← ✅ This is your project repo (can push to GitHub)
    ├── src\
    ├── WebContent\
    ├── .gitattributes
    └── README.md


### Prerequisites:
1. JDK 8 or above

2. Apache Tomcat 9.0

3. Eclipse EE or IntelliJ

4. MySQL installed and running


#  Step-by-Step Installation:

### 1.Clone the Repository

git clone https://github.com/tarunnaik9/OnlineBookStore.git

### 2.Open in Eclipse EE

   1 .File > Import > Dynamic Web Project
   2 .Choose { OnlineBookStore }

### 3.Create MySQL Database (Dummy Database )

CREATE DATABASE onlinebookstore;

use onlinebookstore;

CREATE TABLE books (

  barcode VARCHAR(100) PRIMARY KEY,
  
  name VARCHAR(100),
  
  author VARCHAR(100),
  
  price INT,
  
  quantity INT
  
);


CREATE TABLE users (

  username VARCHAR(100) PRIMARY KEY,
  
  password VARCHAR(100),
  
  firstname VARCHAR(100),
  
  lastname VARCHAR(100),
  
  address TEXT,
  
  phone VARCHAR(100),
  
  mailid VARCHAR(100),
  
  usertype INT
  
);


INSERT INTO books VALUES

('9780134190563','The Go Programming Language','Alan A. A. Donovan and Brian W. Kernighan',400,8),

('9780133053036','C++ Primer','Stanley Lippman and Josée Lajoie and Barbara Moo',976,13),

('9781718500457','The Rust Programming Language','Steve Klabnik and Carol Nichols',560,12),

('9781491910740','Head First Java','Kathy Sierra and Bert Bates and Trisha Gee',754,23),

('9781492056300','Fluent Python','Luciano Ramalho',1014,5),

('9781720043997','The Road to Learn React','Robin Wieruch',239,18),

('9780132350884','Clean Code: A Handbook of Agile Software Craftsmanship','Robert C Martin',288,3),

('9780132181273','Domain-Driven Design','Eric Evans',560,28),

('9781951204006','A Programmers Guide to Computer Science','William Springer',188,4),

('9780316204552','The Soul of a New Machine','Tracy Kidder',293,30),

('9780132778046','Effective Java','Joshua Bloch',368,21),

('9781484255995','Practical Rust Projects','Shing Lyu',257,15);


SELECT COUNT(*) FROM books;

SELECT * FROM books;

INSERT INTO users VALUES

('demo','demo','Demo','User','Demo Home','42502216225','demo@gmail.com',2),

('Admin','Admin','Mr.','Admin','Haldia WB','9584552224521','admin@gmail.com',1),

('tarun','tarun','tarun','tarun','telangana','123456789','tarun@gmail.com',2);


### 4.Configure JDBC Connection

.DBConnection.java file must have:

String url = "jdbc:mysql://localhost:3306/bookstore";

String username = "root";

String password = "your-password";


### 5.Add Required JARs

mysql-connector.jar (for JDBC)

.Add to lib folder or classpath

### 6.Run on Tomcat

 Right click on project > Run As > Run on Server

### 7.Access in Browser

.Visit http://localhost:8081/onlinebookstore/

# Screenshots

#### Hompage

![Home Page](onlinebookstore/src/main/webapp/images/homepage.png)

#### User_DashBoard

![Book Page](onlinebookstore/src/main/webapp/images/userdashboard.png)

#### Available Books

![Book Page](onlinebookstore/src/main/webapp/images/userBAdashboard.png)

#### Order Books Dashboard

![Book Page](onlinebookstore/src/main/webapp/images/orderbooksdashboard.png)

#### Admin_DashBoard

![Book Page](onlinebookstore/src/main/webapp/images/admindashboard.png)

#### AddBooks

![Book Page](onlinebookstore/src/main/webapp/images/adminaddbooks.png)

#### RemoveBooks

![Book Page](onlinebookstore/src/main/webapp/images/adminremovebooks.png)

#### Admin Available Books 

![Book Page](onlinebookstore/src/main/webapp/images/adminABdashboard.png)


# Future Enhancements
1.  Payment integration (Razorpay/Stripe)

2.  Email confirmation on registration

3.  JWT-based authentication
 
4.  Wishlist and Order history
 
5.  Mobile responsiveness

6.  Admin analytics panel



# Author
## Tarun Naik
 B.Tech – CSE (IoT) | Aspiring Software Engineer
 
 tarunnaikcloud@gmail.com


# License

This project is open-source and free to use.





