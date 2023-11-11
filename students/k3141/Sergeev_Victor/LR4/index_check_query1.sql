-- w/o index

select cl."PassportNumber", cl."FullName", em."TabelNumber", da."AgreementNumber", 'Deposit' as type
from "bankDB"."Client" cl, "bankDB"."Employee" em, "bankDB"."DepositAgreement" da
where cl."PassportNumber" = da."PassportNumber"
and em."TabelNumber" = da."TabelNumber"
union
select cl."PassportNumber", cl."FullName", em."TabelNumber", la."AgreementNumber", 'Loan' as type
from "bankDB"."Client" cl, "bankDB"."Employee" em, "bankDB"."LoanAgreement" la
where cl."PassportNumber" = la."PassportNumber"
and em."TabelNumber" = la."TabelNumber"

order by type