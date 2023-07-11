DROP SCHEMA IF EXISTS payment CASCADE;

CREATE SCHEMA payment;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS "payment".payments CASCADE;

CREATE TABLE "payment".payments
(
    id uuid NOT NULL,
    customer_id uuid NOT NULL,
    order_id uuid NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    status string NOT NULL,
    CONSTRAINT payments_pkey PRIMARY KEY (id)
);

DROP TABLE IF EXISTS "payment".credit_entry CASCADE;

CREATE TABLE "payment".credit_entry
(
    id uuid NOT NULL,
    customer_id uuid NOT NULL,
    total_credit_amount numeric(10,2) NOT NULL,
    CONSTRAINT credit_entry_pkey PRIMARY KEY (id)
);

DROP TABLE IF EXISTS "payment".credit_history CASCADE;

CREATE TABLE "payment".credit_history
(
    id uuid NOT NULL,
    customer_id uuid NOT NULL,
    amount numeric(10,2) NOT NULL,
    type string NOT NULL,
    CONSTRAINT credit_history_pkey PRIMARY KEY (id)
);