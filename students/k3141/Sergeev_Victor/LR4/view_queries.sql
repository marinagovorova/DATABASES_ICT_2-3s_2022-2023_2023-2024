-- содержащее сведения обо всех сотрудниках банка и заключенных ими договорах по кредитам за прошедший месяц;
drop view if exists "bankDB"."SignLoansEmployees";
create view "bankDB"."SignLoansEmployees" as
select em."TabelNumber", em."FullName", em."PassportNumber" as "EmployeePassport",
em."Age", em."Phone", em."Address", em."IdCategory", la."AgreementNumber",
la."LoanDate", la."PaymentDay", la."FactCloseDate", la."PlanCloseDate",
la."Status", la."StartSum", la."Debt", la."IdCurrency", la."TypeId"
from "bankDB"."Employee" em
join "bankDB"."LoanAgreement" la
on em."TabelNumber" = la."TabelNumber" 
where la."LoanDate" > (current_date - interval '1 MONTH') -- not enough data
order by la."LoanDate" desc;

-- найти клиентов банка, имеющих задолженности по кредитам.
drop view if exists "bankDB"."NotPaidClients";
create view "bankDB"."NotPaidClients" as
select distinct cl.*
from "bankDB"."Client" cl
join "bankDB"."LoanAgreement" la
on cl."PassportNumber"=la."PassportNumber"
join "bankDB"."LoanPaySchedule" lps
on la."AgreementNumber"=lps."AgreementNumber"
where (lps."FactPaymentDay" is null and lps."PlanPaymentDate" < current_date);
