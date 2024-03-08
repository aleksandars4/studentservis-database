/*ucenici rodjeni posle 2000 godine*/
select *  
from studenti
where year(datumRodj) > 2000;

/*prikazivanje svih eksperimentalnih odseka(nemaju adrese)*/
select *
from fakulteti
where adresa is null;

/*ucenici koji su polozili*/
select *  
from prijave
where ocena between 6 and 10;

/*ucenici koji su radili ovaj projekat*/
select *  
from studenti
where brInd in ('REK07/20','REK31/20');