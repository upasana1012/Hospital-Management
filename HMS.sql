CREATE DATABASE HMS;
USE HMS;

CREATE TABLE Patient(
email nvarchar(50) PRIMARY KEY,
password nvarchar(30) NOT NULL,
name nvarchar(50) NOT NULL,
address nvarchar(60) NOT NULL,
gender nvarchar(20) NOT NULL
);

CREATE TABLE MedicalHistory(
id int PRIMARY KEY,
date DATE NOT NULL,
conditions nvarchar(100) NOT NULL, 
surgeries nvarchar(100) NOT NULL, 
medication nvarchar(100) NOT NULL
);

CREATE TABLE Doctor(
email varchar(50) PRIMARY KEY,
gender varchar(20) NOT NULL,
password varchar(30) NOT NULL,
name varchar(50) NOT NULL
);

CREATE TABLE Appointment(
id int PRIMARY KEY,
date varchar(50) NOT NULL,
starttime TIME NOT NULL,
endtime TIME NOT NULL,
status nvarchar(15) NOT NULL
);

CREATE TABLE PatientsAttendAppointments(
[patient name] nvarchar(50) NOT NULL,
appt int NOT NULL,
concerns nvarchar(40) NOT NULL,
symptoms nvarchar(40) NOT NULL,
FOREIGN KEY ([patient name]) REFERENCES Patient (email) ON DELETE CASCADE,
FOREIGN KEY (appt) REFERENCES Appointment (id) ON DELETE CASCADE,
PRIMARY KEY ([patient name], appt)
);

CREATE TABLE Schedule(
id int NOT NULL,
starttime TIME NOT NULL,
endtime TIME NOT NULL,
breaktime TIME NOT NULL,
day nvarchar(20) NOT NULL,
PRIMARY KEY (id, starttime, endtime, breaktime, day)
);

CREATE TABLE PatientsFillHistory(
[patient name] nvarchar(50) NOT NULL,
history int NOT NULL,
FOREIGN KEY ([patient name]) REFERENCES Patient (email) ON DELETE CASCADE,
FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
PRIMARY KEY (history)
);

CREATE TABLE Diagnose(
appt int NOT NULL,
doctor nvarchar(50) NOT NULL,
diagnosis nvarchar(40) NOT NULL,
prescription nvarchar(50) NOT NULL,
FOREIGN KEY (appt) REFERENCES Appointment (id) ON DELETE CASCADE,
FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
PRIMARY KEY (appt, doctor)
);

CREATE TABLE DoctorViewsHistory(
history int NOT NULL,
doctor nvarchar(50) NOT NULL,
FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
PRIMARY KEY (history, doctor)
);

INSERT INTO Patient(email,password,name,address,gender)
VALUES
('ramesh@gmail.com','upasana12','Ramesh','Tamil Nadu', 'male'),
('suresh@gmail.com','upasana12','Suresh','Karnataka', 'male'),
('rakesh@gmail.com','upasana12','Rakesh','Gujarat', 'male')
;

INSERT INTO MedicalHistory(id,date,conditions,surgeries,medication)
VALUES
(1,'19/07/22','Pain in abdomen','Heart Surgery','Crocin'),
(2,'19/07/22','Frequent Indigestion','none','none'),
(3,'19/07/22','Body Pain','none','Painkiller')
;

INSERT INTO Doctor(email, gender, password, name)
VALUES
('sharma7@gmail.com', 'female', 'upasana12', 'Deeksha Sharma'),
('gupta8@gmail.com', 'male', 'upasana12', 'Rohan Gupta')
;

INSERT INTO Appointment(id,date,starttime,endtime,status)
VALUES
(1, '22/07/15', '09:00', '10:00', 'Done'),
(2, '22/07/16', '10:00', '11:00', 'Done'),
(3, '22/07/18', '14:00', '15:00', 'Done')
;

INSERT INTO PatientsAttendAppointments([patient name],appt,concerns,symptoms)
VALUES
('ramesh@gmail.com',1, 'none', 'itchy throat'),
('suresh@gmail.com',2, 'infection', 'fever'),
('rakesh@gmail.com',3, 'nausea', 'fever')
;

INSERT INTO Schedule(id,starttime,endtime,breaktime,day)
VALUES
(001,'09:00','17:00','12:00','Tuesday'),
(001,'09:00','17:00','12:00','Friday'),
(001,'09:00','17:00','12:00','Saturday'),
(001,'09:00','17:00','12:00','Sunday'),
(002,'09:00','17:00','12:00','Wednesday'),
(002,'09:00','17:00','12:00','Friday')
;

INSERT INTO PatientsFillHistory([patient name],history)
VALUES
('ramesh@gmail.com', 1),
('suresh@gmail.com', 2),
('rakesh@gmail.com', 3)
;
