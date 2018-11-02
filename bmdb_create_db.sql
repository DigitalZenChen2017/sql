-- create and select the database
DROP DATABASE IF EXISTS bmdb;
CREATE DATABASE bmdb;
USE bmdb;

-- create movie table
CREATE TABLE movie (
id						INT 						NOT NULL			PRIMARY KEY	AUTO_INCREMENT,
title					VARCHAR(100)	NOT NULL			UNIQUE,
rating				VARCHAR(5)		NOT NULL,			
year 				INT						NOT NULL,			
Director			VARCHAR(50)	
);

-- create genre table
CREATE TABLE genre (
id						INT 						NOT NULL			PRIMARY KEY	AUTO_INCREMENT,
name 				VARCHAR(30)    NOT NULL			UNIQUE
);

-- create actor table
CREATE TABLE actor (
id						INT 						NOT NULL			PRIMARY KEY 	 AUTO_INCREMENT,
firstName			VARCHAR(30)    NOT NULL			UNIQUE,
lastName			VARCHAR(30)    NOT NULL			UNIQUE,
gender				VARCHAR(1)		NOT NULL,
birthDate			date						NOT NULL									
);

-- create movieGenre Table
CREATE TABLE movieGenre (
id						INT 						NOT NULL			PRIMARY KEY	AUTO_INCREMENT,
movieID 			INT    					NOT NULL,
genreID 			INT	  					NOT NULL,
FOREIGN KEY (movieID) 	REFERENCES genre (id),			
FOREIGN KEY (genreID ) 	REFERENCES movie (id)
);

-- create credits Table
CREATE TABLE credits (
id						INT 						NOT NULL			PRIMARY KEY	AUTO_INCREMENT,
movieID 			INT    					NOT NULL,
actorID 			INT	  					NOT NULL,
charname		VARCHAR(30)	NOT NULL,	
FOREIGN KEY (movieID) 	REFERENCES movie	(id),			
FOREIGN KEY (actorID ) 	REFERENCES actor 	(id)
);

-- Insert Values into movie table
Insert movie (id, title, rating, year, Director) Values (1, 'Rocky IV', 'PG', 1985, 'Sylvester Stallone'); -- Sport
Insert movie (id, title, rating, year, Director) Values (2, 'Into The Wild', 'R', 2007, 'Sean Penn'); -- Biography
Insert movie (id, title, rating, year, Director) Values (3, 'The Graduate', 'PG',1967, 'Mike Nichols'); -- Comedy
Insert movie (id, title, rating, year, Director) Values (4, 'Toy Story', 'G', 1995, 'John Lasseter'); -- Animation
Insert movie (id, title, rating, year, Director) Values (5, 'Clockwork Orange', 'R', 1971, 'Stanley Kubrick'); -- Crime

 -- Insert Values into genre table
 Insert genre (id, name) Values (1, 'Animation');
 Insert genre (id, name) Values (2, 'Biography');
 Insert genre (id, name) Values (3, 'Comedy');
 Insert genre (id, name) Values (4, 'Crime');
 Insert genre (id, name) Values (5, 'Sport');
 
 -- Insert Values into actor table
Insert actor(id, firstName, lastName, gender, birthDate) Values (1,'Sylvester', 'Stallone', 'M','1946-07-06');
Insert actor(id, firstName, lastName, gender, birthDate) Values (2,'Dolph', 'Lundgren', 'M','1957-11-03');
Insert actor(id, firstName, lastName, gender, birthDate) Values (3,'Emile', 'Hirsch', 'M','1985-03-13');
Insert actor(id, firstName, lastName, gender, birthDate) Values (4,'Dustin', 'Hoffman', 'M','1937-08-08');
Insert actor(id, firstName, lastName, gender, birthDate) Values (5,'Tom', 'Hanks', 'M','1956-07-09');
Insert actor(id, firstName, lastName, gender, birthDate) Values (6,'Tim', 'Allen', 'M','1953-06-13');
Insert actor(id, firstName, lastName, gender, birthDate) Values (7,'Malcolm', 'McDowell', 'M','1943-06-13');
Insert actor(id, firstName, lastName, gender, birthDate) Values (8,'Patrick','Magee', 'M', '1922-03-31');

-- Insert Values into movieGenre Table
Insert movieGenre (id, movieID, genreID) Values (1, 1, 5); 
Insert movieGenre (id, movieID, genreID) Values (2, 2, 2);
Insert movieGenre (id, movieID, genreID) Values (3, 3, 3); 
Insert movieGenre (id, movieID, genreID) Values (4, 4, 1); 
Insert movieGenre (id, movieID, genreID) Values (5, 5, 4);

-- Insert Values into credits Table
Insert credits (id, movieID, actorID, charname) Values (1, 1, 1, 'Rocky Balboa');
Insert credits (id, movieID, actorID, charname) Values (2, 1, 2, 'Drago');
Insert credits (id, movieID, actorID, charname) Values (3, 2, 3, 'Chris McCandless');
Insert credits (id, movieID, actorID, charname) Values (4, 3, 4, 'Ben Braddock');
Insert credits (id, movieID, actorID, charname) Values (5, 4, 5, 'Woody');
Insert credits (id, movieID, actorID, charname) Values (6, 4, 6, 'Buzz Lightyear');
Insert credits (id, movieID, actorID, charname) Values (7, 5, 7, 'Alex');
Insert credits (id, movieID, actorID, charname) Values (8, 5, 8, 'Mr. Alexander');

-- Define User Privileges 
GRANT SELECT, INSERT, DELETE, UPDATE
ON bmdb.*
TO bmdb_user@localhost
IDENTIFIED BY 'user1';
  
    
  
  
  
  
  
  