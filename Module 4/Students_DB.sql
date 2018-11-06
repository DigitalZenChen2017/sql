DROP DATABASE IF EXISTS students;
CREATE DATABASE students;

USE students;

CREATE TABLE `user` (
	`ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
	`Name` varchar(30) NOT NULL,
	`CourseID` smallint(5) unsigned DEFAULT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `course` (
	`ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
	`Name` varchar(50) NOT NULL UNIQUE,
	PRIMARY KEY (`ID`)
);

ALTER TABLE `user`
ADD CONSTRAINT `FK_course`
FOREIGN KEY (`CourseID`) REFERENCES `course` (`ID`) 
ON UPDATE CASCADE;

insert into course values (1, 'HTML5');
insert into course values (2, 'CSS3');
insert into course values (3, 'JavaScript');
insert into course values (4, 'PHP');
insert into course values (5, 'MySQL');

insert into user values (1, 'Alice', 1);
insert into user values (2, 'Bob', 1);
insert into user values (3, 'Caroline', 2);
insert into user values (4, 'David', 5);
insert into user values (5, 'Emma', null);



