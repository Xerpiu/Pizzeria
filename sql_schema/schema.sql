CREATE DATABASE IF NOT EXISTS pizzeria;

CREATE SCHEMA pizzeria IF NOT EXISTS AUTHORIZATION pizzeria;

CREATE ROLE pizzeria SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN PASSWORD 'pizzeria';

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA pizzeria TO pizzeria;

-- pizzeria.dict_pizza_sizes definition

-- Drop table

-- DROP TABLE pizzeria.dict_pizza_sizes;

CREATE TABLE IF NOT EXISTS pizzeria.dict_pizza_sizes (
	pizza_diameter int2 NOT NULL,
	"size" varchar(100) NOT NULL,
	CONSTRAINT dict_pizza_sizes_pk PRIMARY KEY (size)
);


-- pizzeria.dict_pizza_types definition

-- Drop table

-- DROP TABLE pizzeria.dict_pizza_types;

CREATE TABLE IF NOT EXISTS pizzeria.dict_pizza_types (
	pizza_id uuid NOT NULL,
	pizza_type varchar(100) NOT NULL,
	price_per_cm numeric(15,2) NOT NULL,
	CONSTRAINT dict_pizza_types_pk PRIMARY KEY (pizza_id)
);


-- pizzeria."order" definition

-- Drop table

-- DROP TABLE pizzeria."order";

CREATE TABLE IF NOT EXISTS pizzeria."order" (
	customer_id uuid NOT NULL,
	order_id uuid NOT NULL,
	date_of_order timestamp NOT NULL,
	transaction_id uuid NOT NULL,
	CONSTRAINT order_pk PRIMARY KEY (order_id)
);


-- pizzeria.roles definition

-- Drop table

-- DROP TABLE pizzeria.roles;

CREATE TABLE IF NOT EXISTS pizzeria.roles (
	"role" varchar(100) NOT NULL,
	CONSTRAINT roles_pk PRIMARY KEY (role)
);


-- pizzeria."transaction" definition

-- Drop table

-- DROP TABLE pizzeria."transaction";

CREATE TABLE IF NOT EXISTS pizzeria."transaction" (
	transaction_id uuid NOT NULL,
	payment_received bool NOT NULL,
	CONSTRAINT transaction_pk PRIMARY KEY (transaction_id)
);


-- pizzeria.basket definition

-- Drop table

-- DROP TABLE pizzeria.basket;

CREATE TABLE IF NOT EXISTS pizzeria.basket (
	order_id uuid NOT NULL,
	quantity int2 NOT NULL,
	item_id uuid NOT NULL,
	price numeric(15,2) NULL,
	CONSTRAINT basket_fk FOREIGN KEY (order_id) REFERENCES pizzeria."order"(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT basket_item_fk FOREIGN KEY (item_id) REFERENCES pizzeria.dict_pizza_types(pizza_id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- pizzeria."user" definition

-- Drop table

-- DROP TABLE pizzeria."user";

CREATE TABLE IF NOT EXISTS pizzeria."user" (
	user_id uuid NOT NULL,
	login varchar(100) NOT NULL,
	active bool NOT NULL DEFAULT true,
	password_hash varchar(100) NOT NULL,
	"role" varchar(100) NOT NULL,
	CONSTRAINT user_pk PRIMARY KEY (user_id),
	CONSTRAINT user_fk FOREIGN KEY (role) REFERENCES pizzeria.roles(role) ON UPDATE CASCADE ON DELETE CASCADE
);


-- pizzeria.user_info definition

-- Drop table

-- DROP TABLE pizzeria.user_info;

CREATE TABLE IF NOT EXISTS pizzeria.user_info (
	user_id uuid NOT NULL,
	first_name varchar(100) NOT NULL,
	surname varchar(100) NOT NULL,
	email varchar(100) NOT NULL,
	address varchar(100) NOT NULL,
	phone_number varchar NOT NULL,
	CONSTRAINT user_info_pk PRIMARY KEY (user_id),
	CONSTRAINT user_info_fk FOREIGN KEY (user_id) REFERENCES pizzeria."user"(user_id)
);