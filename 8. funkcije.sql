							-- FUNKCIJE

-- fix for function working - SET GLOBAL log_bin_trust_function_creators = 1;

-- funk br1
DELIMITER $$
CREATE FUNCTION broj_studenata_na_fakultetu(fakultet_id INT) RETURNS INT
BEGIN

    DECLARE broj_studenata INT;
    
    SELECT COUNT(*) INTO broj_studenata
    FROM Studenti
    WHERE fakultet_id = fakultet_id;
    
    RETURN broj_studenata;
    
END $$
DELIMITER ;

-- pozivanje
SELECT broj_studenata_na_fakultetu(1);

-- funk br2
DELIMITER $$

CREATE FUNCTION prosecna_ocena_svih_studenata() RETURNS DECIMAL(4, 2)
BEGIN
    DECLARE prosecna_ocena DECIMAL(4, 2);
    
    SELECT round(AVG(ocena),2) INTO prosecna_ocena
    FROM Prijave;
    
    RETURN prosecna_ocena;
END $$

DELIMITER ;

-- pozivanje funk br2.
SELECT prosecna_ocena_svih_studenata();

DELIMITER ;

-- funkcija br3
DELIMITER $$

CREATE FUNCTION studenti_koji_su_polozili_predmet(naziv_predmeta VARCHAR(50)) RETURNS VARCHAR(255)
BEGIN
    DECLARE lista_studenata VARCHAR(255);
    
    SELECT GROUP_CONCAT(CONCAT(ime, ' ', prezime) SEPARATOR ', ') INTO lista_studenata
    FROM Studenti
    WHERE id IN (SELECT student_id FROM Prijave WHERE predmet_id IN (SELECT id FROM Predmeti WHERE naziv = naziv_predmeta) 
    AND ocena >5);
    
    RETURN lista_studenata;
END $$

DELIMITER ;


-- pozivanje funk br3
SELECT studenti_koji_su_polozili_predmet('Baze podataka');