create database assignment7;
use assignment7;

create table ord_master(
	ord_no int(4),
	cust_cd varchar(3),
	status varchar(4)
	);

insert into ord_master values(1,'c1','p');

create table Ord_dtl(
	ord_no int(2),
	Prod_cd varchar(10),
	qty int(3)
	-- constraint pk_key primary key (Prod_cd)
       );

insert into ord_dtl values(1,'p1',100);
insert into ord_dtl values(1,'p2',200);

create table prod_cd(
	prod_cd varchar(20),
	prod_name varchar(20),
	qty_in_stock int(6),
	Booked_qty int(5)
        );

insert into prod_cd values('p1','Floppies',10000,1000);
insert into prod_cd values('p2','Printers',5000,600);
insert into prod_cd values('p3','Modems',3000,200);

/********************************* Que_1*************************************/
Delimiter $$

create trigger que1
before insert on ord_dtl
for each row
begin 
	update prod_cd 
	set Booked_qty=Booked_qty+new.qty 
	where prod_cd=new.prod_cd;
 end$$
  -- drop trigger que1;
  -- SET SQL_SAFE_UPDATES=0;
 insert into ord_dtl values(1,'p3',300);
 select * from ord_dtl;
 
/********************************* Que_2*************************************/
Delimiter $$
create trigger Que_2
Before Delete on Ord_dtl
for each row
begin 
 update prod_cd
 set booked_qty=booked_qty + old.qty
 where prod_cd=old.prod_cd;
 end$$
 delete from Ord_dtl where prod_cd='p3';
 
 /********************************* Que_3*************************************/

CREATE TABLE dept_sal (dept_no INT , total_salary INT4); 

INSERT INTO DEPT_SAL VALUES(30,1950),(10,12000);

Delimiter $$
Create trigger Que_3
After insert
on dept_sal
for each row
begin
update dept_sal
set total_salrary=total_salary + new.total_salary
where  dept_no=new.dept_no;
end $$

delimiter $$
CREATE TRIGGER QUE_4 AFTER DELETE ON DEPT_SAL
FOR EACH ROW
BEGIN
UPDATE DEPT_SAL 
SET total_salary=total_salary - OLD.total_salary 
WHERE DEPT_NO=OLD.DEPT_NO;
END$$
 
 





