-- Zad 7
-- 1
select concat(Imie,' ',Nazwisko) as zawodnik from zawodnicy where Wzrost>180 order by Dataur;
-- 2
select nazwisko from zawodnicy left join udzial on zawodnicy.Idzaw = udzial.Idzaw
where odMinuty is NULL;
-- 3
select Nazwa,Miasto, count(Idzaw) from kluby left join zawodnicy on zawodnicy.IdKlubu = kluby.IdKlubu
group by kluby.Nazwa;
-- 4
select Imie, Nazwisko from zawodnicy left join udzial on zawodnicy.Idzaw = udzial.Idzaw
group by zawodnicy.Nazwisko order by count(udzial.IdMeczu) desc limit 1;
-- 5
select Imie,Nazwisko,kluby.Nazwa,sum(udzial.doMinuty - udzial.odMinuty) as ilosc_minut from zawodnicy
natural join udzial,kluby where kluby.Nazwa='Tecza' group by udzial.Idzaw;
-- 6
select Imie,Nazwisko, (Wzrost/100) as wzrost_w_metrach from zawodnicy natural join udzial
where zawodnicy.Imie like 'Ja%' group by zawodnicy.Nazwisko having count(IdMeczu)>=2;
-- 7
select kluby.Nazwa,sum(mecze.goleGosc) as gole from kluby left join mecze on kluby.IdKlubu = mecze.Idgosc
group by mecze.Idgosc order by sum(goleGosc) desc limit 1;
