-- index

select cl."PassportNumber", cl."FullName", em."TabelNumber", la."AgreementNumber",
lps."DebtPayment", lps."InterestPayment"
from "bankDB"."LoanAgreement" la
join "bankDB"."Employee" em
on em."TabelNumber" = la."TabelNumber"
join "bankDB"."Client" cl
on cl."PassportNumber" = la."PassportNumber"
join "bankDB"."LoanPaySchedule" lps
on lps."AgreementNumber" = la."AgreementNumber"
where lps."FactPaymentDay" is null

order by "AgreementNumber", "InterestPayment"
