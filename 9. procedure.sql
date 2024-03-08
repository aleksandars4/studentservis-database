							-- PROCEDURE

-- procedura br1 bez parametara
DELIMITER $$

CREATE PROCEDURE prikazi_sve_fakultete()
BEGIN
    SELECT * FROM Fakulteti;
END $$

DELIMITER ;

-- pozivanje procedure br1
CALL prikazi_sve_fakultete();

-- procedura br2 sa in i out param
CREATE PROCEDURE broj_studenata_na_fakultetu(IN fakultet_id INT, OUT broj_studenata INT)
BEGIN
    SELECT COUNT(*) INTO broj_studenata
    FROM Studenti
    WHERE fakultet_id = fakultet_id;
END;

-- pozivanje procedure br2
CALL broj_studenata_na_fakultetu(1, @broj_studenata);
SELECT @broj_studenata AS BrojStudenata;

-- procedura br3 sa in, out i inout param
CREATE PROCEDURE prikazi_ocene_studenta(IN student_id INT, OUT prosecna_ocena DECIMAL(4,2), INOUT ukupan_broj_ocena INT)
BEGIN
    SELECT AVG(ocena) INTO prosecna_ocena
    FROM Prijave
    WHERE student_id = student_id AND ocena IS NOT NULL;
    
    SELECT COUNT(*) INTO ukupan_broj_ocena
    FROM Prijave
    WHERE student_id = student_id;
END $$

DELIMITER ;

-- pozivanje procedure br3
SET @ukupan_broj_ocena = 0;
CALL prikazi_ocene_studenta(1, @prosecna_ocena, @ukupan_broj_ocena);
SELECT @prosecna_ocena AS ProsecnaOcena, @ukupan_broj_ocena AS UkupanBrojOcena;