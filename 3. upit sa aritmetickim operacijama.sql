-- 1 upit sa aritmetickim operacijama

/*ucenici koji su polozili sa visokim ocenama*/
select *  
from prijave
where (kol_1 + kol_2)/2 between 80 and 100