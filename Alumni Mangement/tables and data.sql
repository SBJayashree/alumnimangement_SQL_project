CREATE DATABASE ALUMNI_MANAGEMENT;

USE ALUMNI_MANAGEMENT;


-- USERS TABLE

CREATE TABLE USERS (
    USER_ID INT PRIMARY KEY AUTO_INCREMENT,
    USERNAME VARCHAR(20) UNIQUE,
    EMAIL VARCHAR(50) UNIQUE,
    PASSWORD VARCHAR(20),
    ROLE ENUM('ADMIN', 'ALUMNI') NOT NULL,
    CREATED_AT DATE
)  AUTO_INCREMENT=101;


INSERT INTO USERS(USERNAME,EMAIL,PASSWORD,ROLE,CREATED_AT)
VALUES
('admin','admin@gmail.com','admin123','ADMIN','2026-01-01'),
('arun','arun@gmail.com','arun123','ALUMNI','2026-01-02'),
('priya','priya@gmail.com','priya123','ALUMNI','2026-01-03'),
('karthik','karthik@gmail.com','karthik123','ALUMNI','2026-01-04'),
('divya','divya@gmail.com','divya123','ALUMNI','2026-01-05'),
('rahul','rahul@gmail.com','rahul123','ALUMNI','2026-01-06'),
('meena','meena@gmail.com','meena123','ALUMNI','2026-01-07'),
('vijay','vijay@gmail.com','vijay123','ALUMNI','2026-01-08'),
('sanjay','sanjay@gmail.com','sanjay123','ALUMNI','2026-01-09'),
('anitha','anitha@gmail.com','anitha123','ALUMNI','2026-01-10');


-- DEPARTMENT TABLE
CREATE TABLE DEPARTMENT (
    DEPT_ID INT PRIMARY KEY AUTO_INCREMENT,
    DEPT_NAME VARCHAR(50),
    DEPT_HOD VARCHAR(50)
);


INSERT INTO DEPARTMENT(DEPT_NAME,DEPT_HOD)
VALUES
('Computer Science Engineering','Dr Kumar'),
('Information Technology','Dr Raj'),
('Electronics Engineering','Dr Anand'),
('Electrical Engineering','Dr Ravi'),
('Mechanical Engineering','Dr Suresh'),
('Artificial Intelligence','Dr Mohan');

-- ALUMNI TABLE

CREATE TABLE ALUMNI (
    ALUMNI_ID INT PRIMARY KEY AUTO_INCREMENT,
    REGISTER_NO INT UNIQUE NOT NULL,
    FIRST_NAME VARCHAR(20),
    LAST_NAME VARCHAR(20),
    GENDER VARCHAR(10),
    DOB DATE,
    PHONE VARCHAR(15),
    LOCATION VARCHAR(50),
    LINKEDIN VARCHAR(100),
    DEGREE VARCHAR(50),
    BATCH INT,
    USER_ID INT,
    DEPT_ID INT,
    FOREIGN KEY (USER_ID)
        REFERENCES USERS (USER_ID),
    FOREIGN KEY (DEPT_ID)
        REFERENCES DEPARTMENT (DEPT_ID)
)  AUTO_INCREMENT=1;

INSERT INTO ALUMNI
(REGISTER_NO,FIRST_NAME,LAST_NAME,GENDER,DOB,PHONE,LOCATION,LINKEDIN,DEGREE,BATCH,USER_ID,DEPT_ID)
VALUES

(22001,'Arun','Kumar','Male','2002-01-10',
'9876543210','Chennai','linkedin.com/arun','BE CSE',2026,102,1),

(22002,'Priya','S','Female','2002-02-15',
'9876543211','Bangalore','linkedin.com/priya','BE CSE',2026,103,1),

(22003,'Karthik','R','Male','2002-03-20',
'9876543212','Hyderabad',NULL,'BE IT',2026,104,2),

(22004,'Divya','M','Female','2002-04-25',
NULL,'Chennai','linkedin.com/divya','BE CSE',2026,105,1),

(22005,'Rahul','K','Male','2002-05-12',
'9876543214',NULL,NULL,'BE ECE',2026,106,3),

(22006,'Sneha','P','Female','2002-06-18',
'9876543215','Coimbatore','linkedin.com/sneha','BE CSE',2026,107,1),

(22007,'Vijay','R','Male','2002-07-22',
NULL,'Madurai',NULL,'BE MECH',2026,108,5),

(22008,'Meena','S','Female','2002-08-30',
'9876543217','Chennai','linkedin.com/meena','BE IT',2026,109,2),

(22009,'Akash','V','Male','2002-09-11',
'9876543218',NULL,NULL,'BE CSE',2026,110,1),

(22010,'Harini','K','Female','2002-10-05',
'9876543219','Salem','linkedin.com/harini','BE ECE',2026,110,3);


-- SKILL TABLE
CREATE TABLE SKILL (
    SKILL_ID INT PRIMARY KEY AUTO_INCREMENT,
    SKILL_NAME VARCHAR(50)
);


INSERT INTO SKILL(SKILL_NAME)
VALUES
('Java'),
('SQL'),
('Python'),
('React'),
('Angular'),
('Spring Boot'),
('HTML'),
('CSS'),
('JavaScript'),
('AWS');


-- ALUMNI_SKILLS TABLE
CREATE TABLE ALUMNI_SKILLS (
    ASKILL_ID INT PRIMARY KEY AUTO_INCREMENT,
    ALUMNI_ID INT,
    SKILL_ID INT,
    FOREIGN KEY (ALUMNI_ID)
        REFERENCES ALUMNI (ALUMNI_ID),
    FOREIGN KEY (SKILL_ID)
        REFERENCES SKILL (SKILL_ID)
);


INSERT INTO ALUMNI_SKILLS(ALUMNI_ID,SKILL_ID)
VALUES

(1,1),
(1,2),
(1,6),

(2,3),
(2,4),
(2,7),

(3,1),
(3,2),
(3,5),

(4,1),
(4,8),

(5,5),
(5,9),

(6,1),
(6,6),
(6,10),

(7,2),
(7,8),

(8,3),
(8,7),

(9,1),
(10,5);



-- COMPANY TABLE
CREATE TABLE COMPANY (
    COMPANY_ID INT PRIMARY KEY AUTO_INCREMENT,
    COMPANY_NAME VARCHAR(100)
);


INSERT INTO COMPANY(COMPANY_NAME)
VALUES
('Zoho'),
('TCS'),
('Infosys'),
('Accenture'),
('Wipro'),
('Cognizant'),
('Amazon'),
('Microsoft'),
('Google'),
('HCL');

-- EMPLOYMENT TABLE

CREATE TABLE EMPLOYMENT (
    EMPLOYMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
    ALUMNI_ID INT,
    COMPANY_ID INT,
    JOB_ROLE VARCHAR(50),
    JOINED_DATE DATE,
    FOREIGN KEY (ALUMNI_ID)
        REFERENCES ALUMNI (ALUMNI_ID),
    FOREIGN KEY (COMPANY_ID)
        REFERENCES COMPANY (COMPANY_ID)
);


INSERT INTO EMPLOYMENT
(ALUMNI_ID,COMPANY_ID,JOB_ROLE,JOINED_DATE)
VALUES

(1,1,'Java Developer','2026-07-01'),

(2,2,'Software Engineer','2026-06-15'),

(3,3,'Data Analyst','2026-05-10'),

(4,4,'Frontend Developer','2026-07-20'),

(5,5,'Cloud Engineer','2026-08-01'),

(6,6,'Backend Developer','2026-07-15'),

(7,7,'Software Tester','2026-06-25'),

(8,8,'Full Stack Developer','2026-05-30'),

(9,9,'Software Engineer','2026-08-05'),

(10,10,'AI Engineer','2026-07-10');

 
-- EVENT TABLE
CREATE TABLE EVENT (
    EVENT_ID INT PRIMARY KEY AUTO_INCREMENT,
    EVENT_NAME VARCHAR(100) NOT NULL,
    EVENT_DESCRIPTION VARCHAR(255),
    EVENT_DATE DATE,
    EVENT_LOCATION VARCHAR(100)
);

INSERT INTO EVENT
(EVENT_NAME,EVENT_DESCRIPTION,EVENT_DATE,EVENT_LOCATION)
VALUES

('Alumni Meet 2026','Annual gathering','2026-08-10','Auditorium'),

('Career Guidance','Industry session','2026-08-15','Seminar Hall'),

('Tech Workshop','Java workshop','2026-09-01','Lab 1'),

('Startup Talk','Entrepreneur session','2026-09-05','Hall A'),

('Placement Training','Career preparation','2026-09-10','Hall B'),

('AI Workshop','AI discussion','2026-10-01','Lab 2'),

('Cloud Seminar','AWS training','2026-10-10','Auditorium'),

('Hackathon','Coding event','2026-10-20','Lab 3'),

('Networking Meet','Alumni networking','2026-11-01','Auditorium'),

('Farewell Meet','Batch reunion','2026-11-15','College Ground');

-- EVENT_REGISTRATION TABLE

CREATE TABLE EVENT_REGISTRATION (
    REGISTRATION_ID INT PRIMARY KEY AUTO_INCREMENT,
    EVENT_ID INT,
    ALUMNI_ID INT,
    REGISTRATION_DATE DATE,
    ATTENDANCE_STATUS ENUM('REGISTERED', 'ATTENDED', 'ABSENT'),
    FOREIGN KEY (EVENT_ID)
        REFERENCES EVENT (EVENT_ID),
    FOREIGN KEY (ALUMNI_ID)
        REFERENCES ALUMNI (ALUMNI_ID)
);

INSERT INTO EVENT_REGISTRATION
(EVENT_ID,ALUMNI_ID,REGISTRATION_DATE,ATTENDANCE_STATUS)
VALUES

(1,1,'2026-08-01','ATTENDED'),

(1,2,'2026-08-02','ATTENDED'),

(1,3,'2026-08-03','REGISTERED'),

(2,4,'2026-08-20','ATTENDED'),

(2,5,'2026-08-22','ABSENT'),

(3,6,'2026-09-01','ATTENDED'),

(3,7,'2026-09-02','REGISTERED'),

(4,8,'2026-09-20','ATTENDED'),

(5,9,'2026-10-01','REGISTERED'),

(6,10,'2026-10-05','ATTENDED');



-- FEEDBACK TABLE-- 
CREATE TABLE FEEDBACK (
    FEEDBACK_ID INT PRIMARY KEY AUTO_INCREMENT,
    ALUMNI_ID INT,
    EVENT_ID INT,
    RATING INT CHECK (RATING BETWEEN 1 AND 5),
    COMMENTS VARCHAR(255),
    FEEDBACK_DATE DATE,
    FOREIGN KEY (ALUMNI_ID)
        REFERENCES ALUMNI (ALUMNI_ID),
    FOREIGN KEY (EVENT_ID)
        REFERENCES EVENT (EVENT_ID)
);


INSERT INTO FEEDBACK
(ALUMNI_ID,EVENT_ID,RATING,COMMENTS,FEEDBACK_DATE)
VALUES

(1,1,5,'Excellent alumni interaction','2026-08-21'),

(2,1,4,'Good networking opportunity','2026-08-21'),

(3,1,3,NULL,'2026-08-21'),

(4,2,5,'Very useful career guidance','2026-09-06'),

(5,2,4,'Helpful session','2026-09-06'),

(6,3,5,'Great technical workshop',NULL),

(7,3,3,'Average experience','2026-09-16'),

(8,4,4,NULL,'2026-10-02'),

(9,5,5,'Placement tips were useful','2026-10-11'),

(10,6,4,'Good AI introduction','2026-10-21');


-- JOB_POSTING TABLE

CREATE TABLE JOB_POSTING (
    JOB_ID INT PRIMARY KEY AUTO_INCREMENT,
    ALUMNI_ID INT,
    COMPANY_ID INT,
    JOB_TITLE VARCHAR(100),
    JOB_LOCATION VARCHAR(100),
    JOB_TYPE VARCHAR(50),
    FOREIGN KEY (ALUMNI_ID)
        REFERENCES ALUMNI (ALUMNI_ID),
    FOREIGN KEY (COMPANY_ID)
        REFERENCES COMPANY (COMPANY_ID)
);

INSERT INTO JOB_POSTING
(ALUMNI_ID,COMPANY_ID,JOB_TITLE,JOB_LOCATION,JOB_TYPE)
VALUES

(1,1,'Java Developer','Chennai','Full Time'),

(2,2,'Software Engineer','Bangalore','Full Time'),

(3,3,'Data Analyst','Hyderabad','Full Time'),

(4,4,'Frontend Developer','Pune','Internship'),

(5,5,'Cloud Engineer','Chennai','Full Time'),

(6,6,'Backend Developer','Bangalore','Full Time'),

(7,7,'Testing Engineer','Noida','Full Time'),

(8,8,'Full Stack Developer','Chennai','Internship'),

(9,9,'Software Engineer','Bangalore','Full Time'),

(10,10,'AI Engineer','Bangalore','Full Time');

-- MENTORSHIP TABLE

CREATE TABLE MENTORSHIP (
    MENTORSHIP_ID INT PRIMARY KEY AUTO_INCREMENT,
    MENTOR_ID INT,
    MENTEE_ID INT,
    START_DATE DATE,
    STATUS ENUM('ACTIVE', 'COMPLETED'),
    FOREIGN KEY (MENTOR_ID)
        REFERENCES ALUMNI (ALUMNI_ID),
    FOREIGN KEY (MENTEE_ID)
        REFERENCES ALUMNI (ALUMNI_ID)
);

INSERT INTO MENTORSHIP
(MENTOR_ID,MENTEE_ID,START_DATE,STATUS)
VALUES

(1,3,'2026-08-01','ACTIVE'),

(2,4,'2026-08-10','ACTIVE'),

(6,5,'2026-09-01','COMPLETED'),

(8,7,'2026-09-15','ACTIVE'),

(9,10,'2026-10-01','COMPLETED'),

(3,6,'2026-10-20','ACTIVE');


-- ANNOUNCEMENT TABLE

CREATE TABLE ANNOUNCEMENT (
    ANNOUNCEMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
    TITLE VARCHAR(100),
    CONTENT VARCHAR(500),
    CREATED_DATE DATE,
    CREATED_BY INT,
    FOREIGN KEY (CREATED_BY)
        REFERENCES USERS (USER_ID)
);

INSERT INTO ANNOUNCEMENT
(TITLE,CONTENT,CREATED_DATE,CREATED_BY)
VALUES

('Alumni Meet Registration',
'Registration opened for Alumni Meet 2026',
'2026-08-01',
101),

('Job Fair Announcement',
'Job opportunities available for alumni and students',
'2026-08-15',
101),

('Technical Workshop',
'Java Spring Boot workshop registration started',
'2026-09-01',
101),

('Career Guidance Program',
'Industry experts will conduct career guidance session',
'2026-09-10',
101),

('Project Expo Notice',
'Alumni are invited to showcase projects',
'2026-11-01',
101),

('Networking Event Update',
'Alumni networking event scheduled in December',
'2026-11-20',
101);


-- ACHIEVEMENT TABLE
CREATE TABLE ACHIEVEMENT (
    ACHIEVEMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
    ALUMNI_ID INT,
    TITLE VARCHAR(100),
    DESCRIPTION VARCHAR(255),
    ACHIEVEMENT_DATE DATE,
    FOREIGN KEY (ALUMNI_ID)
        REFERENCES ALUMNI (ALUMNI_ID)
);

INSERT INTO ACHIEVEMENT
(ALUMNI_ID,TITLE,DESCRIPTION,ACHIEVEMENT_DATE)
VALUES

(1,
'Best Employee Award',
'Received best performer award at Zoho',
'2027-01-15'),

(2,
'Technical Certification',
'Completed AWS Cloud Practitioner certification',
'2026-12-10'),

(3,
'Research Publication',
'Published paper on Data Analytics',
'2027-02-20'),

(6,
'Hackathon Winner',
'Won national level coding hackathon',
'2027-03-05'),

(8,
'Startup Founder',
'Started a technology-based startup',
'2027-04-01'),

(10,
'AI Project Recognition',
'Recognized for AI-based automation project',
'2027-05-10');

SELECT * FROM ALUMNI;
sELECT * FROM SKILL;
SELECT * FROM DEPARTMENT;
SELECT * FROM ALUMNI_SKILLS;
SELECT * FROM FEEDBACK;
SELECT * FROM COMPANY;
SELECT * FROM MENTORSHIP;
