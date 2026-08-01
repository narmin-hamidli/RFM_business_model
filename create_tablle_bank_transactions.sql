CREATE TABLE bank_transactions (
    customer_id       NUMBER NOT NULL,
    transaction_id     NUMBER PRIMARY KEY,
    amount             NUMBER(12,2) NOT NULL,
    operation          VARCHAR2(20) NOT NULL,
    reverse_amount     NUMBER(12,2) DEFAULT 0.00 NOT NULL,
    transaction_date   DATE NOT NULL,
    CONSTRAINT chk_reverse_amount CHECK (reverse_amount <= amount)
);