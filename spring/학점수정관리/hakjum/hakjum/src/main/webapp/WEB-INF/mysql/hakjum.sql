use webdb;

drop table if exists hakjum;

create table hakjum(
    studentId bigint primary key auto_increment,
    studentName varchar(20),
    kScore int,
    eScore int,
    mScore int
);

select*from hakjum;