create database petopt;
use petopt;

create table user(
id int not null,
fname varchar(20) not null,
lname varchar(20) not null,
email varchar(20) not null,
phone int not null,
gender varchar(20) not null,
password varchar(20) not null);

alter table user  
add constraint pk 
primary key(id);

describe user;

drop table user;

create table dog(
id int primary key auto_increment,
name varchar(20) not null,
age int not null,
owner_id int not null,
gender varchar(20) not null,
breed varchar(20) not null);

alter table dog ADD FOREIGN KEY (owner_id) REFERENCES user(id);
drop table dog;

describe dog;

insert into user values(1,'Kavita','Hegde','kavi@gmail.com',123467890,'Female','password1');

insert into user(id,fname,lname,email,phone,gender,password)
values (2,'Navami','B G','navami@gmail.com',123467891,'Female','password2'),
		(3,'Sheetal','Prasad','sheetal@gmail.com',123467892,'Female','password3'),
        (4,'Suhas','T S','suhas@gmail.com',123467893,'Male','password4'),
        (5,'xyz','abc','xyz@mail.com',1234567,'Male','password');
 
insert into user(id,fname,lname,email,phone,gender,password)
values (6,'Luffy','Monkey D','luffy@gmail.com',123467891,'Male','password2'),
		(7,'Kakashi','Hatake','kakashi@gmail.com',123467892,'Male','password3'),
        (8,'Kiba','Inuzuka','kiba@gmail.com',123467893,'Male','password4');

create table cat(
id int primary key auto_increment,
name varchar(20) not null,
age int not null,
owner_id int not null,
gender varchar(20) not null,
breed varchar(20) not null);

alter table cat ADD FOREIGN KEY (owner_id) REFERENCES user(id);

create table rabbit(
id int primary key auto_increment,
name varchar(20) not null,
age int not null,
owner_id int not null,
gender varchar(20) not null,
breed varchar(20) not null);

alter table rabbit ADD FOREIGN KEY (owner_id) REFERENCES user(id);

create table tortoise(
id int primary key auto_increment,
name varchar(20) not null,
age int not null,
owner_id int not null,
gender varchar(20) not null,
breed varchar(20) not null);

alter table tortoise  ADD FOREIGN KEY (owner_id) REFERENCES user(id);

show tables;

drop table dog;

insert into dog(name,age,owner_id,gender,breed)
VALUES ('Chopper',5,6,'Male','racoon dog'),
('Akamaru',8,7,'Male','great pyrenees'),
('Pakun',10,8,'Male','pug');

select * from dog;

update dog set breed = 'Sheep dog' WHERE id=1;
select * from dog where id=1;

select * from dog;

insert into dog(name,age,owner_id,gender,breed)
VALUES ('Bailey',5,2,'Female','racoon dog'),
('Lucy',8,4,'Female','great pyrenees'),
('Buddy',6,8,'Male','great pyrenees'),
('Bella',10,7,'Female','pug');

select * from dog;

select * from dog
where gender = 'Female' order by name desc;

select breed,count(*) from dog group by breed;


select breed,count(*) from dog group by breed having breed='pug';

#view
create view dogOwners as
select owner_id,user.fname,count(user.fname) as dogs 
from dog,user where dog.owner_id = user.id group by owner_id ;

select * from dogOwners;
drop view dogOwners;

#procedure
DELIMITER &&
CREATE PROCEDURE dog_count()
BEGIN
SELECT breed,count(*) as total_dog_count from dog group by breed;
END &&

call dog_count();
drop procedure IF EXISTS dog_count ;

#INNER JOIN
select user.id as user_id , dog.id as dog_id, 
user.fname as owner_name,dog.name as dog_name , dog.breed 
from dog INNER JOIN user on user.id = dog.owner_id;

#LEFT JOIN
select user.id as user_id , dog.id as dog_id, 
user.fname as owner_name,dog.name as dog_name , dog.breed 
from dog LEFT JOIN user on user.id = dog.owner_id;

#RIGHT JOIN
select user.id as user_id , dog.id as dog_id, 
user.fname as owner_name,dog.name as dog_name , dog.breed 
from dog RIGHT JOIN user on user.id = dog.owner_id;

