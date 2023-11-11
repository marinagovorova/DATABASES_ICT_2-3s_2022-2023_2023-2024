create index if not exists idx_client_passport on "bankDB"."Client" ("PassportNumber");

create index if not exists idx_employee_number on "bankDB"."Employee" ("TabelNumber");

create index if not exists idx_deposit_number on "bankDB"."DepositAgreement" ("AgreementNumber");

create index if not exists idx_loan_number on "bankDB"."LoanAgreement" ("AgreementNumber");

create index if not exists idx_loan_number_passport_tabel
on "bankDB"."LoanAgreement" ("AgreementNumber", "PassportNumber", "TabelNumber");

create index if not exists idx_loan_schedule_payment
on "bankDB"."LoanPaySchedule" ("AgreementNumber", "DebtPayment", "InterestPayment");
