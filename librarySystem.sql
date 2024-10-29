CREATE TABLE Authors (
Authorid int auto_increment primary key,
Firstname VARCHAR(50),
Lastname varchar(50),
UNIQUE (firstname , lastname)
);

CREATE TABLE Books (
Bookid int auto_increment primary key,
Title varchar(100) NOT NULL,
Authorid int,
PublicationYear YEAR,
Pages INT CHECK (Pages > 0),
FOREIGN KEY (Authorid) REFERENCES authors(authorid) on delete cascade
);
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE, 
    RegistrationDate DATE NOT NULL
  
);

CREATE TABLE Loans (
loanid int auto_increment primary key,
bookid int,
memberid int,
loandate date not null,
returndate date,
FOREIGN KEY (Bookid) references books(bookid)on delete cascade,
FOREIGN KEY (memberid) references members(memberid) on delete cascade,
check (returndate is null or returndate > loandate)
);


INSERT INTO Authors (FirstName, LastName) VALUES ('Yumna', 'ahmed');
INSERT INTO Authors (FirstName, LastName) VALUES ('Saleh', 'khalid');


INSERT INTO Books (Title, AuthorID, PublicationYear, Pages) VALUES ('LOVE', 1, 2022, 200);
INSERT INTO Books (Title, AuthorID, PublicationYear, Pages) VALUES ('HATE', 2, 2024, 180);


INSERT INTO Members (Name, Email, RegistrationDate) VALUES ('Lama fahad', 'lama2030@gmail.com', '2024-01-15');


INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate) VALUES (1, 1, '2024-03-10', NULL);
