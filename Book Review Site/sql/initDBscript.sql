drop database if exists assignment2;
create database assignment2 default char set utf8mb4;

use assignment2;

drop table if exists users;
create table users (
  uID int NOT NULL AUTO_INCREMENT,
  username varchar(32) NOT NULL DEFAULT '',
  pass varchar(32) NOT NULL DEFAULT '',
  primary key (uID)
);


insert into users values (1, 'defaultUser', 'defaultPass');
insert into users values (2, 'Abhinav', 'myPassword');
insert into users values (3, 'anotherUser', 'anotherPass');

drop table if exists reviews;
create table reviews (
	rID int NOT NULL AUTO_INCREMENT,
    writtenby int,
    bookname varchar(50) NOT NULL DEFAULT '',
    author varchar(50) NOT NULL DEFAULT '',
    rating int NOT NULL DEFAULT 1,
    review text(500) NOT NULL,
    primary key (rID),
    foreign key (writtenby) references users(uID)
);

insert into reviews values (1, 2, 'To Kill a Mockingbird', 'Harper Lee', 8, 'This book was very good. Would read again.');
insert into reviews values (2, 2, 'The Road', 'Cormac McCarthy', 7, 'This book was very good. Would read again.');
insert into reviews values (3, 2, 'Oryx and Crake', 'Margaret Atwood', 9, 'This book was very good. Would read again.');
insert into reviews values (4, 3, 'To Kill a Mockingbird', 'Harper Lee', 8, 'This book was very good. Would read again.');
insert into reviews values (5, 3, 'The Road', 'Cormac McCarthy', 7, 'This book was very good. Would read again.');
insert into reviews values (6, 3, 'Oryx and Crake', 'Margaret Atwood', 9, 'This book was very good. Would read again.');
