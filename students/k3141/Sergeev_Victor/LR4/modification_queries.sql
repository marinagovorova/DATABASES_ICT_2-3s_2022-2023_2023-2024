insert into "bankDB"."DepositAgreement"
("DepositDate", "PaymentDay", "PlanCloseDate", "StartSum", "TabelNumber", "PassportNumber", "IdCurrency", "IdType")
values (current_date, extract(day from current_date), 
		case
			when (select "Term" from "bankDB"."DepositType" where "Name"='Умный') =
			12 then current_date + INTERVAL '1 YEAR'
			when (select "Term" from "bankDB"."DepositType" where "Name"='Умный') =
			24 then current_date + INTERVAL '2 YEAR'
		 end,
	    300000, 100020, 324629513,
	   	(select "IdCurrency" from "bankDB"."Currency" where "Name"='Евро'),
	    (select "Id" from "bankDB"."DepositType" where "Name"='Умный'));

update "bankDB"."DepositAgreement" da
set "SummaryPayment" = 
(select coalesce(sum("Payment"), 0)
 from "bankDB"."DepositPaySchedule" dps
 where not ("FactPaymentDate" is null)
 and da."AgreementNumber" = dps."AgreementNumber"
 order by 1 desc
 limit 1)
 
delete from "bankDB"."DepositPaySchedule" dps
where 'Close' = (
select "Status" 
from "bankDB"."DepositAgreement" da
where dps."AgreementNumber" = da."AgreementNumber");
	
