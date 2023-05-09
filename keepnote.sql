Create Database KeepNote
use KeepNote

Create Table users
(
userid int primary key,
username varchar(20),
user_added_date date,
user_password varchar(20),
user_mobile bigint
)
insert into users values(112233,'Maya','2019-01-02','Maya1214',8012345679),(112244,'Nair','2019-01-11','Welcome',9023778467)


Create Table note
(
note_id int primary key,
note_title varchar(20),
note_content varchar(50),
note_status varchar(20),
note_creation_date date,
userid int references users(userid)
)

insert into note values(1,'Today Tasks','1.Check Emails and reply to them 2.Startthe pro','Inprogress','2019-01-21',112233),
(2,'Training to plan','1.Application related 2.Technical related','yet to start','2019-01-31',112244),
(3,'Things to have today','1.fruits 2.more water','inprogress','2019-01-25',112244)

Create Table category
(
category_id int primary key,
category_name varchar(20),
category_descr varchar(50),
category_creation_date date,
category_creator int
)
Insert into category values(1,'offical','office related notes','2019-01-21',112233),
(2,'diet','health related notes','2019-01-24',112244)

Create Table reminder
(
reminder_id int primary key,
reminder_name varchar(50),
reminder_descr varchar(50),
reminder_type varchar(50),
reminder_creation_date date,
reminder_creator int
)
Insert into reminder values(1,'kt reminder','session on technical queries','office reminders','2019-02-12',112233),
(2,'personal reminder','pick children','personal reminders','2019-02-14',112244)

Create Table notecategory
(
notecategory_id int primary key,
note_id int references note(note_id),
category_id int references category(category_id)
)
insert into notecategory values(1,1,1),(2,2,1),(3,3,2)

Create Table notereminder
(
notereminder_id int primary key,
note_id int references note(note_id),
reminder_id int references reminder(reminder_id)
)
insert into notereminder values(1,3,2),(2,2,1)

Alter table category add constraint fk1 foreign key(category_creator) references users(userid)

Alter table reminder add constraint fk2 foreign key(reminder_creator) references users(userid)

--Query 1
select * from users where userid=112233 and user_password='Maya1214'

--Query 2
select * from note where note_creation_date='2019-01-31'

--Query3
select * from category where category_creation_date>'2019-01-22'

--Query4
select * from category where category_creator = (select userid from note where note_id = 1)

--Query5
select * from note where userid=112244

--Query6
select * from note where userid = (select category_creator from category where category_id = 1)

--Query7
select * from reminder where reminder_creator = (select userid from note where note_id = 2)

--Query8
update note set note_status='Completed' where note_id=3
select * from note

--Query9
update reminder set reminder_type='personal reminders' where reminder_creator=(select userid from note where note_id=1)
select * from reminder

--Query10
delete from notereminder where note_id=2
select * from notereminder