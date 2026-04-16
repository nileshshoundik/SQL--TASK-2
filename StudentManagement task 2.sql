create database StudentManagement;
use StudentManagement;

create table Students (
StudentID int primary key auto_increment,
Name varchar(100),
Gender char(1),
Age int,
Grade varchar(2),
MathScore int,
ScienceScore int,
EnglishScore int );

insert into Students ( Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
values ('Nil','M', 25, 'A', 99,98,85),
('Preety', 'F',24, 'A', 98,96,89),
('Honey', 'F',22,'B', 70,65,88),
('Nilesh', 'M', 24, 'A', 88,95,69),
('Sweta', 'F', 23, 'C', 69,63,59),
('Karan', 'M', 22, 'B', 75,69,86),
('Sneha', 'F', 21, 'C', 81,61,45),
('Ankit', 'M', 24, 'B', 74,71,49),
('Anisha', 'F', 22, 'A', 85,88,83),
('Chiku', 'F', 23, 'C', 78,62,67);

-- show all students details.
select * from Students;

-- average score in each subject
select avg(MathScore) as avgMath from Students;
select avg(ScienceScore) as avgScience from Students;
select avg(EnglishScore) as avgEnglish from Students;

select avg(MathScore) as avgMath, avg(ScienceScore) as avgScience, avg(EnglishScore) as avgEnglish from Students;

-- Top Performer (highest total score)
select *, (MathScore + ScienceScore + EnglishScore) as Total from Students 
order by total desc 
limit 1;

-- Count Students per Grade
select Grade, count(*) as TotalStudents from Students 
group by Grade order by TotalStudents desc;

-- Average score by gender
select gender , avg(MathScore + ScienceScore + EnglishScore) from Students
group by gender;

-- students with math > 80
select * from Students 
where MathScore > 80;

-- update a students grade
update Students set Grade ='A' where StudentID = 7;

select * from Students;

create table courses( 
id int primary key,
name varchar(50)
);
-- show tables;
-- DESC students;
-- DESC courses;
create table enrollments( 
student_id int,
course_id int,
grade int,
foreign key (student_id) references students(StudentID),
foreign key (course_id) references courses(id)
);
insert into courses values
(1,'Math'),
(2,'Science'),
(3,'English');
insert into enrollments values
(1,1,99),
(1,2,98),
(1,3,85),

(2,1,98),
(2,2,96),
(2,3,89),

(3,1,70),
(3,2,65),
(3,3,88),

(4,1,88),
(4,2,95),
(4,3,69),

(5,1,69),
(5,2,63),
(5,3,59),

(6,1,75),
(6,2,69),
(6,3,86),

(7,1,81),
(7,2,61),
(7,3,45),

(8,1,74),
(8,2,71),
(8,3,49),

(9,1,85),
(9,2,88),
(9,3,83),

(10,1,78),
(10,2,62),
(10,3,67);

-- Task-2
-- querry1.- List all students enrolled in each course.
select s.name, c.name
from enrollments e
join students s on e.student_id=s.StudentID
join courses c on e.course_id=c.id;

-- querry2.- Find average grade per course.
select c.name ,avg(e.grade) as avg_grade
from enrollments e
join courses c on e.course_id = c.id
group by c.name;


-- querry3.- Find top 3 students overall.
select s.name,avg(e.grade) as avg_grade
from enrollments e
join students s on e.student_id=s.StudentID
group by s.name
order by avg_grade desc
limit 3;

-- querry4.- Count students who failed (grade < 40).
select count(*) as failed_students
from enrollments
where grade<40;