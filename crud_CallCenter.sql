USE callcenter;

select * from client;
select * from department;
select * from employee;
select * from supervisor;
select * from team;

select department.depName, supervisor.name from department
join supervisor on department.depName = supervisor.departmentName;

update department set numEmployees = 8
where id = 1 ;

update team set numberOfEmployees = 4
where supervisor_id = 1;

insert into employee
values (9,'George Black', 1,1, 109, 0), (10,'Mary Johnson', 1,1, 110, 0), (11,'Betty White', 2,2,111, 0), (12,'Mark Philips', 2,2, 112, 0);

insert into client
values (3,2020, 8866, 'Nick Papadopoulos') , (4,2040, 3249, 'Helen Bright');

select name, qualityScore from employee
where qualityScore > 60;

insert into supervisor
values (3, 'Jack Love', 42, 8, 'Billing Department',1);

select department.depName, supervisor.name from supervisor
left join department on department.depName = supervisor.departmentName;

select department.depName, supervisor.name from department
inner join supervisor on department.depName = supervisor.departmentName;

select depName from department
union 
select name from supervisor;

select name, qualityScore from employee
where qualityScore > 60
order by qualityScore desc;

select name from employee
having length(name) > 12 ;

delete from supervisor
where id = 3 ;

insert into supervisor (name, age, yearsOfSeniority, departmentName, department_id)
values ('Jack Love', 42, 8, 'Billing Department',1);

/*Task 6 transaction is everything we do through read, upadate, delete commands. There is a way to control them, by executing these commands through a group.*/
/*Task 7*/
START TRANSACTION;
insert into client
values (5,2050, 3987, 'Maria H') , (6,2060, 5697, 'Bob T');

update  supervisor set age = 45
where id = 4;
COMMIT;

/*Task 9 */
select name, qualityScore from employee
where qualityScore= (select max(qualityScore) from employee);

select name, yearsOfSeniority from supervisor
where yearsOfSeniority= (select min(yearsOfSeniority) from supervisor);

/*Task 8 : There are many different types of databases, it depends on the type of data they are storing. Two big categories are relational and non-relational
databades. Relational databases are SQL structured for their operation, and they are table-oriented. Non-relational batabases don't need a relation model to store their data,
they can do this with different ways, unstructured or semistructured, they can use variety of formats. As I can understand non-relational seem to be more flexible.
About crud operations, for example to mongoDB for create : insertOne / insertMant, read: find, update: updateOne/ updateMany -there is an
option for replace, delete : deleteOne / deleteMany */
