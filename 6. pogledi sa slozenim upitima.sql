-- POGLEDI sa slozenim upitima

-- br studenata po odseku
CREATE VIEW BrojStudenataPoOdseku AS
SELECT f.id AS fakultet_id, f.odsek AS fakultet_odsek, COUNT(*) AS broj_studenata
FROM Fakulteti f
INNER JOIN Studenti s ON f.id = s.fakultet_id
GROUP BY f.id, f.odsek;

-- prosecna ocena po predmetu
CREATE VIEW ProsečnaOcenaPoPredmetu AS
SELECT p.id AS predmet_id, p.naziv AS predmet_naziv, round(AVG(pr.ocena),2) AS prosečna_ocena
FROM Predmeti p
INNER JOIN Prijave pr ON p.id = pr.predmet_id
where pr.ocena is not null
GROUP BY p.id, p.naziv;

-- br prijava po ispitu
CREATE VIEW BrojPrijavaPoStudentu AS
SELECT s.id, CONCAT(s.ime, ' ', s.prezime) AS student_ime_prezime, COUNT(*) AS broj_prijava
FROM Studenti s
INNER JOIN Prijave pr ON s.id = pr.student_id
GROUP BY s.id, student_ime_prezime;