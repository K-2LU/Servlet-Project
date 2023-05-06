CREATE DATABASE university;
USE university;

create table student(
	registration varchar(10) primary key,
	name varchar(64),
    email varchar(64),
    phone varchar(20),
    session varchar(20),
    dept varchar(20),
    password varchar(20)
    );
    
create table teacher(
	id varchar(10) primary key,
    name varchar(64),
    email varchar(64),
    phone varchar(20),
    dept varchar(20),
    password varchar(20)
);

create table admin(
	id varchar(10) primary key,
    name varchar(64),
    email varchar(64),
    phone varchar(20),
    password varchar(20)
);

create table course(
	course_id varchar(10) primary key,
    course_name varchar(64),
    dept varchar(64),
    credit int
);

create table takes(
	student_id varchar(10),
    course_id varchar(10),
    semester varchar(10),
    year varchar(10),
    primary key(student_id, course_id)
);

create table teaches(
	teacher_id varchar(10),
    course_id varchar(10),
    semester varchar(10),
    year varchar(10),
    primary key(teacher_id, course_id)
);

create table login(
	id varchar(10) primary key,
    password varchar(20),
    user_type varchar(10)
)
