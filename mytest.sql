drop database MyTest

create database mytest


use database mytest

select * from plans
select *  from resale

insert into plans(customer,mdn1,sprint_plan,socs)
values('t','t','t','t')

UPDATE plans
SET mdn1 = REPLACE(mdn1, '"', '')

UPDATE plans
SET socs = REPLACE(socs, '"', '')

UPDATE plans
SET socs = REPLACE(socs, ';', '')

sp_rename 'plans.mdn','mdn1'

alter table plans add primary key (mdn1)


alter table resale add foreign key (mdn)
references plans(mdn1)

select FK_column from FK_table
WHERE FK_column NOT IN
(SELECT PK_column from PK_table)

select mdn1 from plans 
where mdn1 not in
(select mdn from resale)

select* from resale
select * from plans
where socs like '%DSMLTESOC%'

--1
select r.mdn,r.resale_plan,p.mdn1,
p.sprint_plan,p.socs
from plans p left join 
resale r on  r.mdn=p.mdn1



--2

select r.mdn,r.resale_plan,
p.sprint_plan, (CASE
WHEN (p.socs like '%DSMLTESOC%') then 'y'
else 'n'
end) as "ima li zadani string"
from plans p left join 
resale r on  r.mdn=p.mdn1


select * from plans
--3

select r.resale_plan, count(*) as "Number of Devices"
from plans p left join 
resale r on  r.mdn=p.mdn1 
group by r.resale_plan
