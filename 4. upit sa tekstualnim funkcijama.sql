-- 1 upit sa tekstualnim funkcijama


/*Prikazivanje imena i prezimena studenata koji su polozili predmet sa ocenom vecom od 8, u redosledu ime, nadimak, prezime(malim slovima)*/
SELECT CONCAT(ime, ' ', substring(upper(ime), 1, 4), ' ', lower(prezime)) AS ime_prezime FROM Studenti
INNER JOIN Prijave ON Studenti.id = Prijave.student_id
WHERE ocena > 8;