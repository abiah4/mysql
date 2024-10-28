CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    EnrollmentDate DATE
);

CREATE TABLE Teachers (
    TeacherID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE,
    Subject VARCHAR(100)
);
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
CREATE TABLE Classrooms (
    ClassroomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomNumber VARCHAR(10),
    Capacity INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Grades (
    GradeID INT AUTO_INCREMENT PRIMARY KEY,
    EnrollmentID INT,
    Grade CHAR(2),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);
INSERT INTO Students (firstName, lastname, birthdate, enrollmentdate) values
('Salma' , 'ahmed', '2000-01-25', '2023-08-20'),
('Thamer' , 'noah', '1999-04-22', '2023-08-20'),
('Yousef' , 'saleh', '2001-07-30', '2023-08-21'),
('Nora' , 'mohammed', '2000-12-11', '2023-08-22'),
('Muna' , 'Bader', '2002-05-05', '2023-08-22');
INSERT INTO Teachers (firstname, lastname, hiredate,subject) values
('Ahmed' , 'abduallah' , '2018-03-15', 'Mathematics'),
('Sara' , 'Noor' , '2020-01-10', 'English'),
('Dalal' , 'Mohammed' , '2019-06-05', 'Science'),
('Aemn' , 'Fahad' , '2021-09-12', 'History');
INSERT INTO Courses (CourseName , Credits,TeacherID) values
('Calculus', 3 , 1),
('Literature', 2 , 2),
('Biology', 4 , 3),
('World History', 3 , 4);

INSERT INTO Classrooms (roomnumber, capacity) values
('A101',30),
('B202',25),
('C303',30),
('D404',15);

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES 
(1, 1, '2023-09-01'), 
(1, 2, '2023-09-01'), 
(2, 1, '2023-09-02'),
 (3, 3, '2023-09-03'), 
(4, 4, '2023-09-04'),
 (5, 2, '2023-09-05');

INSERT INTO Grades (EnrollmentID , grade) values
(1,'A'),
(2,'B'),
(3,'C'),
(4,'A'),
(5,'B');

SELECT c.CourseName, CONCAT(t.FirstName, ' ', t.LastName) AS TeacherName
FROM Courses c
JOIN Teachers t ON c.TeacherID = t.TeacherID;
SELECT s.FirstName, s.LastName 
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Calculus';

SELECT COUNT(*) AS TotalStudents FROM Students;

SELECT s.FirstName, s.LastName, c.CourseName, g.Grade
FROM Grades g
JOIN Enrollments e ON g.EnrollmentID = e.EnrollmentID
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

UPDATE students SET lastname = 'Khaild' WHERE studentid = 1;
UPDATE Teachers SET subject = 'Mathematics & Physics' WHERE Teacherid = 1;
SELECT * FROM students where Birthdate < '2000-01-01';

SELECT s.Firstname , s.lastname , g.grade
from students s
join enrollments e on s.studentid = e.studentid
join grades g on e.enrollmentid = g.enrollmentid
order by s.lastname , s.firstname;

select c.coursename, avg(case
when g.grade = 'A' then 4.0
when g.grade = 'B' then 3.0
when g.grade = 'C' then 2.0
when g.grade = 'D' then 1.0
else 0
end) as AverageGrade
from Courses c
left join enrollments e on c.courseid = e.courseid
left join grades g on e.enrollmentid = g.enrollmentid
group by c.courseid;


SELECT c.coursename
from courses c
left join enrollments e on c.courseid = e.courseid
where e.studentid is null;
