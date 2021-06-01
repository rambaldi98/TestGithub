create database school;
use school;
create table giaoVien(
                         id_giaoVien int primary key ,
                         name nvarchar(50) not null ,
                         dateOfBirth date not null ,
                         address nvarchar(50) not null,
                         phoneNumber nvarchar(50) not null ,
                         description nvarchar(50)
);


create table class (
                       id_class nvarchar(10) not null primary key ,
                       name_class nvarchar(20) not null ,
                       giaoVien_id int , foreign key (giaoVien_id) references giaoVien(id_giaoVien)
);

create table Student (
                         id_student nvarchar(10) not null primary key ,
                         name_student nvarchar(50) not null ,
                         email_student nvarchar(50) not null ,
                         identity_student int  not null ,
                         dateOfBirth_student date,
                         address_student nvarchar(50) not null ,
                         phoneNumber_student nvarchar(10) not null ,
                         status_student nvarchar(50) not null ,
                         class_id nvarchar(10), foreign key (class_id) references class(id_class)
);

create table description(
                            id_class nvarchar(10) not null  ,foreign key (id_class) references class(id_class),
                            iD_giaoVien int not null  ,foreign key (iD_giaoVien) references giaoVien(id_giaoVien),
                            date_descripton date not null ,
                            description nvarchar(255) not null,
                            primary key (id_class,iD_giaoVien)
);

create table Subject(
                        id_subject nvarchar(10)  not null primary key,
                        name_subject nvarchar(20) not null
);


create table point(
                      subject_id nvarchar(10) not null ,
                      giaoVien_id int ,foreign key (giaoVien_id) references giaoVien(id_giaoVien),
                      student_id nvarchar(10) ,foreign key (subject_id) references student(id_student),
                      point int ,check ( point>=0 and point<=10),
                      foreign key (subject_id) references Subject(id_subject),
                      primary key (giaoVien_id)
);

