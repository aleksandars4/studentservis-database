-- Privilegije i korisnici
-- korisnik1
CREATE USER 'korisnik1'@'localhost' IDENTIFIED BY 'lozinka1';

-- dodeljivanje privilegija za korisnik1
GRANT SELECT, INSERT, UPDATE, DELETE ON student_servis.* TO 'korisnik1'@'localhost';

-- korisnik2 - korisnik sesije
CREATE USER 'korisnik2'@'%' IDENTIFIED BY 'lozinka2';

-- dodeljivanje privilegija za korisnik2(korisniku sesije)
GRANT SELECT, INSERT, UPDATE, DELETE ON student_servis.* TO 'korisnik2'@'%';

-- dodeljivanje pristupa pogledu
GRANT SELECT ON student_servis.BrojStudenataPoFakultetu TO 'korisnik2'@'%';

-- kreiranje i dodeljivanje privilegija za ostala 3 korisnika
CREATE USER 'korisnik3'@'localhost' IDENTIFIED BY 'lozinka3';
GRANT SELECT ON student_servis.BrojStudenataPoFakultetu TO 'korisnik3'@'%';

CREATE USER 'korisnik4'@'localhost' IDENTIFIED BY 'lozinka4';
GRANT SELECT, INSERT, UPDATE, DELETE ON student_servis.* TO 'korisnik4'@'localhost';

CREATE USER 'korisnik5'@'localhost' IDENTIFIED BY 'lozinka5';
GRANT SELECT ON student_servis.BrojStudenataPoFakultetu TO 'korisnik5'@'%';

/*logovanje korisnik1
username: korisnik1
password: lozinka1*/

/*logovanje korisnik2
username: korisnik2
password: lozinka2*/

-- upit za test korisnik 1
SELECT * FROM student_servis.Studenti;

-- upit za test korisnik2
SELECT * FROM student_servis.BrojStudenataPoFakultetu;