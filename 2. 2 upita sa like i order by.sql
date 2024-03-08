--  upita sa like i order by

/*ucenici atvss gde je odsek u opadajucem redosledu*/
select *  
from fakulteti 
where naziv like 'A%'
order by odsek desc;

/*predmeti koji se zavrsavaju na "e", sortirani po profesorima u rastucem redosledu*/
select *  
from predmeti
where naziv like '%e'
order by profesor asc;