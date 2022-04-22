#Task 2.2
drop database if exists networking_portal;
create database networking_portal;
use networking_portal;
drop table if exists Person;

#Strong entities
create table Person(
PersonID int unsigned primary key,
Fname varchar(40) not null,
Lname varchar(40),
Age tinyint unsigned,
Gender char(1), /* 'M', 'F' */
check(gender='M' or gender='F')
);

create table  ITSpecialist(
SpecialistID int unsigned ,
Specialist_email varchar(50),
Specialist_password varchar(30),
ITCategory varchar(40) primary key,
Bio varchar(200),
foreign key (SpecialistID) references Person(personID) on update cascade on delete restrict
);

create table Customer(
CustomerID int unsigned primary key,
Customer_email varchar(50),
Customer_password varchar(20),
foreign key (CustomerID) references
Person(personID) on update cascade on delete restrict
);


create table Administrator(
AdministratorID int unsigned primary key,
Administrator_email varchar(50),
Administrator_password varchar(30),
foreign key (AdministratorID) references 
Person(personID) on update cascade on delete restrict
);

create table Portfolio(
Portfolio_name varchar(30) primary key,
SpecialistID int unsigned,
ITCategory varchar(40),
email varchar (50),
contactNo varchar(50),
LinkedInUrl varchar(60),
objective varchar(50),
skills varchar(80),
job_experience varchar(300),
education varchar(300),
volunteer varchar(300),
foreign key (ITCategory) references ITSpecialist(ITCategory) on update cascade on delete restrict,
foreign key (SpecialistID) references ITSpecialist(SpecialistID) on update cascade on delete restrict
);

create table Feedback(
CustomerID int unsigned not null,
Feedbackcomment varchar(100) primary key,
DateWritten date,
foreign key (CustomerID) references Customer(CustomerID)
);


#Inserting values into database

insert into Person (PersonID,Fname,Lname,Age, Gender) values (0001,"Caleb","Mensah",23,'F');
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0002,"Matthew","Roberts",27,'M' );
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0003,"Bradley","Owusu",24,'M' );
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0004,"Ama","Tiah",25,'F' );
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0005,"Lisa","Blunt",23,'M');
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0006,"Kwame","Williams",25,'M');
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0007,"Rachel","Afari",21,'F');
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0008,"Mike","Cooper",22,'M');
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0009,"Richard","Furler",25,'M');
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0010,"Katie","Gibson",23,'F');
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0011,"Isabelle","Ampong",23,'F' );
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0012,"Ama","Ocloo",27,'M');
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0013,"Edem","Mensah",24,'M');
insert into Person (PersonID,Fname,Lname,Age, Gender) values (0014,"Jasmine","Owusu",27,'F' );


insert into Customer (CustomerID,Customer_email,Customer_password) values (0002,"matthew.roberts@gmail.com ","earlybird" );
insert into Customer (CustomerID,Customer_email,Customer_password) values (0004,"ama.tiah@gmail.com","fishfood2 " );
insert into Customer (CustomerID,Customer_email,Customer_password) values (0006,"kwame.williams@gmail.com ","dreaming33 " );
insert into Customer (CustomerID,Customer_email,Customer_password) values (0008,"mike.cooper@gmail.com ","boldandstrong" );
insert into Customer (CustomerID,Customer_email,Customer_password) values (0010,"katie.gibson@gmail.com","fastttt " );
insert into Customer (CustomerID,Customer_email,Customer_password) values (0012,"ama.ocloo@gmail.com","zoooom " );
insert into Customer (CustomerID,Customer_email,Customer_password) values (0013,"edem.mensah@gmail.com","runstill" );
insert into Customer (CustomerID,Customer_email,Customer_password) values (0014,"jasmine.owusu@gmail.com","wowfactor " );


insert into ITSpecialist(SpecialistID,Specialist_email,Specialist_password,ITCategory,Bio) values ("0003","bradley.owusu@gmail.com","easygo","Software Engineer ","Hi there, I'm Bradley. I've worked with many compnaies from Tullow Oil to Apple.");
insert into ITSpecialist(SpecialistID,Specialist_email,Specialist_password,ITCategory,Bio) values ("0005 ","lisa.blunt@gmail.com ","rabbitbird ","Security Systems ","Hello I'm Lisa and I have expertise in CSS and HTML and JAVA.");
insert into ITSpecialist(SpecialistID,Specialist_email,Specialist_password,ITCategory,Bio) values ("0007 ","lisa.blunt@gmail.com","foodandtrail ","UI/UX Developer ","My name is Rachel and I am very commited and always ready to face challenges.");
insert into ITSpecialist(SpecialistID,Specialist_email,Specialist_password,ITCategory,Bio) values ("0009","richard.furler@gmail.com","cartoons ","Software Engineer","I'm Richard and I am good at innovating software and have interned at 8 different companies across Ghana");
insert into ITSpecialist(SpecialistID,Specialist_email,Specialist_password,ITCategory,Bio) values ("0011 ","isabelle.ampomg@gmail.com ","kw33 ","Full Stack Developer ","My name is Isabelle and I specialise in UX design.");


insert into  Administrator(AdministratorID,Administrator_email,Administrator_password) values ("0001 ","caleb.mensah@gmail.com","growingpains");

insert into Portfolio (Portfolio_name,email,contactNo,LinkedInUrl,objective,skills,job_experience,education,volunteer) values ("About Bradley","bradley.owusu@gmail.com ","0553002345 ","https//:www.likedin.combradley ","Skills development ","graphic design","Interned at Google","Bachelor's at Ashesi ","Wrote code for my university's finance system");
insert into Portfolio (Portfolio_name,email,contactNo,LinkedInUrl,objective,skills,job_experience,education,volunteer) values ("About Lisa ","lisa.blunt@gmail.com ","0554673212 ","https//:www.likedin.comlisa ","Growth","gaming,machine learning ","Volunteered with Leti Arts","High school graduate ","Designed a database system for a primary school");
insert into Portfolio (Portfolio_name,email,contactNo,LinkedInUrl,objective,skills,job_experience,education,volunteer) values ("About Rachel ","rachel.afari@gmail.com ","0202367841 ","https//:www.likedin.comrachel ","Skills development ","hardware design ","Led a project for Tullow Oil","Masters at Harvard ","Fixed a hospital electronic records system");
insert into Portfolio (Portfolio_name,email,contactNo,LinkedInUrl,objective,skills,job_experience,education,volunteer) values ("About Richard ","richard.furler@gmail.com ","0203900867 ","https//:www.likedin.comrichard","Larger customer base ","graphic design","Worked with Apple ","Majored in CS at Legon","Designed a database for a nursery school");
insert into Portfolio (Portfolio_name,email,contactNo,LinkedInUrl,objective,skills,job_experience,education,volunteer) values ("About Isabelle ","isabelle.ampomg@gmail.com  ","0509874325 ","https//:www.likedin.comisabelle","Networking ","AI,cloud computing ","Volunteered for FOA","Bachelor's at Tech ","Did research for an NGO");


insert into Feedback(CustomerID,Feedbackcomment,DateWritten) values ("0006","Good app overall.","2022-04-12");
insert into Feedback(CustomerID,Feedbackcomment,DateWritten) values ("0008","Very easy to use,thanks so much ","2022-01-09");
insert into Feedback(CustomerID,Feedbackcomment,DateWritten) values ("0012","Great interface, very user friendly","2022-02-23");









#Queries code
#Do writers with a lower certification (Bachelors) tend to have a higher plagiarism percentage? *order percen by descending with corresponding degree
#select Essay_title from Essay order by Plag_percentage ASC limit 3,2;
#select Essay_title from Writer where Highest_qualification="Bachelors";

#How many IT Specialists have a the skill of graphic design ?
select * from Portfolio where skills="graphic design";

#What is the time period between the earliest feedback comment and the latest?
select DateWritten from Feedback order by DateWritten DESC limit 3,1;
select DateWritten from Feedback order by DateWritten ASC limit 3,1;

#For which IT category is most common?*arrange in descending order
select ITCategory from ITSpecialist group by ITCategory order by count(*) desc limit 1;









