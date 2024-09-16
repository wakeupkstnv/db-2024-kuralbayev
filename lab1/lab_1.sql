CREATE DATABASE lab_1;

CREATE TABLE IF NOT EXISTS clients(
    client_id   SERIAL,
    first_name  VARCHAR(60),
    last_name   VARCHAR(60),
    email       VARCHAR(100),
    data_joined TIMESTAMP(2) WITH TIME ZONE default current_date
);


ALTER TABLE clients
    ADD COLUMN status INTEGER
        CHECK(status = 1 or status = 0);


ALTER TABLE clients DROP CONSTRAINT clients_status_check;
ALTER TABLE clients ALTER COLUMN status TYPE boolean
USING CASE
    WHEN status = 1 THEN TRUE
    WHEN status = 0 THEN FALSE
    ELSE NULL
END;


ALTER TABLE clients
    ALTER COLUMN status SET default TRUE;


ALTER TABLE clients
    ADD CONSTRAINT pk_id PRIMARY KEY (client_id);


CREATE TABLE orders(
    order_id    SERIAL,
    order_name  VARCHAR(100),
client_id SERIAL REFERENCES clients(client_id)
);


DROP TABLE orders;

DROP DATABASE IF EXISTS lab_1;


-- for me
DROP TABLE clients;

ALTER TABLE clients
    DROP COLUMN status;
