DROP DATABASE IF EXISTS student_servis;
CREATE DATABASE student_servis;
USE student_servis;

CREATE TABLE Fakulteti (
  id INT PRIMARY KEY,
  naziv VARCHAR(50),
  odsek VARCHAR(50),
  adresa VARCHAR(50)
);

CREATE TABLE Studenti (
  id INT PRIMARY KEY,
  ime VARCHAR(25),
  prezime VARCHAR(25),
  brInd VARCHAR(25),
  datumRodj datetime NOT NULL,
  fakultet_id INT,
  FOREIGN KEY (fakultet_id) REFERENCES Fakulteti(id)
);

CREATE TABLE Predmeti (
  id INT PRIMARY KEY,
  naziv VARCHAR(50),
  profesor VARCHAR(50),
  fakultet_id INT,
  FOREIGN KEY (fakultet_id) REFERENCES Fakulteti(id)
);

CREATE TABLE Prijave (
  id INT PRIMARY KEY,
  student_id INT,
  predmet_id INT,
  ocena INT,
  labVezbe varchar(20),
  kol_1 int,
  kol_2 int,
  datumPrijave datetime NOT NULL,
  FOREIGN KEY (student_id) REFERENCES Studenti(id),
  FOREIGN KEY (predmet_id) REFERENCES Predmeti(id)
);

INSERT INTO Fakulteti (id, naziv, odsek, adresa)
VALUES (1, 'ATVSS','Komunikacione Tehnologije', 'Aleksandra Medvedeva 20, Niš 18000'),
       (2, 'ATVSS','Savremene Racunarske Tehnologije', 'Aleksandra Medvedeva 20, Niš 18000'),
       (3, 'ATVSS','Preduzetnicki Menadzment', 'Pirot'),
       (4, 'ATVSS','Vaspitac za rad sa decom', 'Pirot'),
       (5, 'ATVSS','Prehrambena Tehnologija', 'Vranje'),
       (6, 'ATVSS','Proizvodna Ekonomija', 'Vranje'),
       (7, 'ATVSS','Arhitektura', null),
       (8, 'ATVSS','Geodezija', null),
       (9, 'ATVSS','Elektroenergetika', null),
       (10, 'ATVSS','Upravljanje sistemima', null);

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO Studenti (id, ime, prezime, brInd, datumRodj, fakultet_id)
VALUES (1, 'Dimitrije', 'Kostadinovic','REK01/20','2000-03-21 11:12:32.574', 1),
       (2, 'Nikola', 'Jankovic','REK02/20','2001-05-29 11:12:32.574', 1),
       (3, 'Marijana', 'Nikolic','REK05/20','2000-06-21 11:12:32.574', 3),
	   (4, 'Ana', 'Milosavljevic','REK06/20','2000-07-21 11:12:32.574', 4),
       (5, 'Aleksandar', 'Savic','REK07/20','2001-03-27 11:12:32.574', 1),
       (6, 'Filip', 'Nikolic','REK08/20','2000-04-18 11:12:32.574', 2),
       (7, 'Kristina', 'Ciric','REK09/20','1998-07-17 11:12:32.574', 3),
	   (8, 'Milovan', 'Jovanovic','REK12/20','2000-05-13 11:12:32.574', 4),
       (9, 'Djordje', 'Ecim','REK12/20','2003-12-21 11:12:32.574', 5),
       (10, 'Uros', 'Radenkovic','REK15/20','2001-12-21 11:12:32.574', 5),
       (11, 'Milos', 'Jovanovic','REK16/20','2001-11-01 11:12:32.574', 6),
	   (12, 'Bratislav', 'Krkic','REK18/20','2000-03-31 11:12:32.574', 6),
       (13, 'Darko', 'Markovic','REK31/20','1999-01-28 11:12:32.574', 5),
       (14, 'Marko', 'Jeftic','REK35/20','2001-10-21 11:12:32.574', 5),
       (15, 'David', 'Lazarevic','SEK44/20','2001-06-21 11:12:32.574', 6),
	   (16, 'Pavle', 'Dencic','SEK60/20','2001-08-21 11:12:32.574', 6);

INSERT INTO Predmeti (id, naziv, profesor, fakultet_id)
VALUES (1, 'Digitalne Telekomunikacije', 'Nikola Sekulovic', 1),
       (2, 'Elektronska Merna Instrumentacija', 'Zoran Velickovic', 1),
       (3, 'Racunarske Mreze', 'Mirko Kosanovic', 1),
       (4, 'Baze podataka', 'Dusan Stefanovic', 2),
       (5, 'Algoritmi i strukture podataka', 'Slavimir Stosovic', 2),
       (6, 'Elektronika', 'Danijela Aleksic', 2),
       (7, 'Osnove Ekonomije', 'Dragan Vuckovic', 3),
       (8, 'Uvod u Menadzment', 'Vojislav Dragutinovic', 3),
       (9, 'Racunarstvo i Informatika', 'Dragutin Cekic', 3),
       (10, 'Opsta pedagogija', 'Aleksandra Vujadinovic', 4),
       (11, 'Filozofija vaspitanja', 'Milica Jovanovic', 4),
       (12, 'Pedagoške teorije', 'Violeta Nikolic', 4),
       (13, 'Opsta hemija', 'Miroslav Veljkovic', 5),
       (14, 'Analitička hemija', 'Nikola Stefanovic', 5),
       (15, 'Organska hemija', 'Vera Cvetkovic', 5),
       (16, 'Menadzment', 'Mila Aleksic', 6),
       (17, 'Ekonomika', 'Darko Lazarevic', 6),
       (18, 'Statistika', 'David Markovic', 6);

INSERT INTO Prijave (id, student_id, predmet_id, ocena, labVezbe, kol_1, kol_2, datumPrijave)
VALUES (1, 1, 1, null,'ima', null, null, '2023-06-06 11:12:32.574'),
       (2, 2, 2, 5, 'ima', 40, 40, '2023-06-05 11:12:32.574'),
       (3, 3, 3, 6, 'ima', 55, 50, '2023-06-07 11:12:32.574'),
       (4, 4, 4, 7, 'ima', 65, 67, '2023-06-08 11:12:32.574'),
       (5, 5, 5, 8, 'nema', 65, 68, '2023-06-08 11:12:32.574'),
       (6, 6, 6, 8, 'ima', 60, 65, '2023-06-07 11:12:32.574'),
       (7, 7, 7, 9,'nema', 85, 87, '2023-06-10 11:12:32.574'),
       (8, 8, 8, 10, 'ima',100, 95, '2023-06-9 11:12:32.574'),
       (9, 9, 9, 6, 'ima', 50, 55, '2023-06-09 11:12:32.574'),
       (10, 10, 10, null, 'ima', null, 60, '2023-06-08 11:12:32.574'),
       (11, 11, 11, null,'nema', 80, null, '2023-06-09 11:12:32.574'),
       (12, 12, 12, null,'nema', null, null, '2023-06-05 11:12:32.574'),
       (13, 13, 13, null, 'nema', 40, null, '2023-06-05 11:12:32.574'),
       (14, 14, 14, null, 'nema', null, null, '2023-06-07 11:12:32.574'),
       (15, 15, 15, 8, 'ima', 75, 78, '2023-06-08 11:12:32.574'),
       (16, 16, 16, 7, 'nema', 65, 60, '2023-06-08 11:12:32.574');