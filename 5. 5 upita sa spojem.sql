/*5 upita koji sadrže spoj, od kojih:

- 1 korišćenjem INNER JOIN-a sa dve tabele, uz obavezno filtriranje
- 1 korišćenjem INNER JOIN-a sa tri tabele, uz obavezno filtriranje i grupisanje
- 2 korišćenjem LEFT JOIN-a sa dve tabele
- 1 po izboru uz obavezno grupisanje*/

-- upit koji prikazuje ime, prezime, predmet koji je student polagao, koriscenjem INNER JOIN-a sa dve tabele, uz obavezno filtriranje
SELECT s.ime, s.prezime, p.naziv
FROM Studenti s
INNER JOIN Prijave pr ON s.id = pr.student_id
INNER JOIN Predmeti p ON pr.predmet_id = p.id
WHERE p.naziv = 'Baze podataka';

- upit za selektovanje odseka koji imaju vise od 3 studenata, grupisano po id-u i odseku 
SELECT f.odsek, COUNT(*) AS broj_studenti
FROM Fakulteti f
INNER JOIN Studenti s ON f.id = s.fakultet_id
GROUP BY f.id, f.odsek
HAVING COUNT(*) > 3;

-- upit koji prikazuje studente bez ocena, koriscenjem left join-a
SELECT s.ime, s.prezime, pr.ocena
FROM Studenti s
LEFT JOIN Prijave pr ON s.id = pr.student_id
where ocena is null


-- upit koji prikazuje studente sa ocenom manjom od 7 i onih koji nemaju ocenu, koriscenjem left join-a
SELECT s.ime, s.prezime, pr.ocena
FROM Studenti s
LEFT JOIN Prijave pr ON s.id = pr.student_id AND pr.ocena <= 7;


-- upit po zelji, broj studenata na odseku komunikacione tehnologije
SELECT f.naziv, COUNT(*) AS broj_studenata, f.odsek
FROM Fakulteti f
INNER JOIN Studenti s ON f.id = s.fakultet_id
where f.odsek = 'Komunikacione Tehnologije'
GROUP BY f.naziv;