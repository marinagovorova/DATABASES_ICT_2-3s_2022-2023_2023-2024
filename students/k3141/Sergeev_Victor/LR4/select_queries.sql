-- Найти вкладчика, имеющего на текущий день несколько вкладов. 
select cl."PassportNumber", cl."FullName"
from "bankDB"."Client" cl, "bankDB"."DepositAgreement" da
where cl."PassportNumber" = da."PassportNumber"
and da."Status" = 'Open'
group by cl."PassportNumber"
having count(*) > 1;


-- Найти вкладчика, имеющего вклады во всех видах валюты на текущий день
select da."PassportNumber"
from "bankDB"."DepositAgreement" da
group by da."PassportNumber"
having count(distinct da."IdCurrency") =
(select count(*) from "bankDB"."Currency");


-- Вывести данные вкладчика, имеющего максимальный вклад в английский фунтах
select cl.*
from "bankDB"."Client" cl, "bankDB"."DepositAgreement" da
where cl."PassportNumber" = da."PassportNumber"
and da."IdCurrency" =
(select "IdCurrency" from "bankDB"."Currency" where "Name"='Фунт стерлингов')
and da."StartSum" = 
(select max(da."StartSum")
 from "bankDB"."DepositAgreement" da
 where da."IdCurrency" =
 (select "IdCurrency" from "bankDB"."Currency" where "Name"='Фунт стерлингов'));

-- Какой из вкладов пользовался наибольшей популярностью за истекший год
select dt.*
from "bankDB"."DepositType" dt
join "bankDB"."DepositAgreement" da
on dt."Id" = da."IdType"
group by dt."Id"
having count(da.*) =
(select max(tbl.counter) from 
(select count(da.*) as counter
from "bankDB"."DepositAgreement" da
where da."DepositDate" > (current_date - interval '1 YEAR')
group by da."IdType") tbl)
 
 
--Кто из сотрудников заключил максимальное число договоров по кредитам за последний месяц.
select em."TabelNumber", em."FullName"
from "bankDB"."Employee" em
join "bankDB"."LoanAgreement" la
on em."TabelNumber" = la."TabelNumber"
group by em."TabelNumber"
having count(la.*) =
(select max(tbl.counter) from
(select count(la.*) as counter
 from "bankDB"."LoanAgreement" la
 where la."LoanDate" > (current_date - interval '1 MONTH') -- not enough data
 group by la."TabelNumber"
 union  -- cus null
 select(0)) tbl)


--Вывести список вкладчиков, у которых срок вклада истекает завтра и суммы начислений, 
--которые могут быть ими востребованы. 
select cl."PassportNumber", cl."FullName", da."StartSum" + sum(dps."Payment") as "TotalSum"
from "bankDB"."Client" cl, "bankDB"."DepositAgreement" da, "bankDB"."DepositPaySchedule" dps
where cl."PassportNumber" = da."PassportNumber"
and da."AgreementNumber" = dps."AgreementNumber"
and da."PlanCloseDate" = (current_date + interval '1 DAY') -- not enough data
group by cl."PassportNumber", da."StartSum";

-- Вывести список сотрудников, заключивших договоры по вкладам на максимальную сумму за последний месяц.
select em."TabelNumber", em."FullName", da."StartSum" as "AgreementStartSum"
from "bankDB"."Employee" em
join "bankDB"."DepositAgreement" da
on em."TabelNumber" = da."TabelNumber"
where da."StartSum" =
(select max(da."StartSum")
 from "bankDB"."DepositAgreement" da
 where da."DepositDate" > (current_date - interval '1 MONTH') -- not enough data
)
