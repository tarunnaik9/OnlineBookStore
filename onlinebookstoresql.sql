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

SELECT COUNT(*) FROM users;
SELECT * FROM users;