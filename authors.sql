create table Authors (
authorid int auto_increment primary key,
firstname varchar(50),
lastname varchar(50),
birthdate date
);
create table Books (
Bookid int auto_increment primary key,
Title VARCHAR(100),
Authorid int,
ISBN varchar(20),
Publishedyear int,
copiesavailable int,
foreign key (authorid) references authors(authorid)
);
create table members (
memberid int auto_increment primary key,
firstname varchar(50),
lastname varchar(50),
membershipDate DATE,
Email varchar(100)
);
create table Loans (
loanid int auto_increment primary key,
Bookid int,
memberid int,
loanDate date,
dueDate date,
FOREIGN KEY (bookid) references books(bookid),
FOREIGN KEY (memberid) references members(memberid)
);
create table returns (
returnid int auto_increment primary key,
loanid int,
returnDate date,
FOREIGN KEY (loanid) references loans(loanid)
);

INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES 
('George', 'Orwell', '1903-06-25'),
('J.K.', 'Rowling', '1965-07-31'),
('Harper', 'Lee', '1926-04-28'),
('F. Scott', 'Fitzgerald', '1896-09-24');

INSERT INTO Books (Title, AuthorID, ISBN, PublishedYear, CopiesAvailable) VALUES 
('1984', 1, '978-0451524935', 1949, 5),
('Harry Potter and the Sorcerer\'s Stone', 2, '978-0439708180', 1997, 10),
('To Kill a Mockingbird', 3, '978-0060935467', 1960, 3),
('The Great Gatsby', 4, '978-0743273565', 1925, 4);

INSERT INTO Members (FirstName, LastName, MembershipDate, Email) VALUES 
('Alice', 'Johnson', '2023-01-15', 'alice@example.com'),
('Bob', 'Smith', '2023-02-20', 'bob@example.com'),
('Charlie', 'Brown', '2023-03-10', 'charlie@example.com');

INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate) VALUES 
(1, 1, '2023-09-01', '2023-09-15'),
(2, 2, '2023-09-05', '2023-09-20'),
(3, 1, '2023-09-10', '2023-09-25');

INSERT INTO Returns (LoanID, ReturnDate) VALUES 
(1, '2023-09-14'),
(2, '2023-09-19');
	
SELECT l.loanid , b.title, concat(m.firstname , ' ' , m.lastname) as Membername , l.loandate, l.duedate
from loans l
join books b on l.bookid = b.bookid
join members m on l.memberid = m.memberid;

SELECT CONCAT(a.firstname , ' ' , a.lastname) as Authorname, count(b.bookid) as BookCount
from authors a
left join books b on a.authorid = b.authorid
group by a.authorid;

select r.returnid , b.title, concat(m.firstname, ' ' , m.lastname) as Membername, r.returndate
from returns r
join loans l on r.loanid = l.loanid
join books b on l.bookid = b.bookid
join members m on l.memberid = m.memberid;

SELECT b.title, count(l.loanid) as BorrowCount
From books b
left join loans l on b.bookid = l.bookid
group by b.bookid
order by borrowcount desc
limit 1;
