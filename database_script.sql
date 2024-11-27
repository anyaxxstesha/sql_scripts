-- Скрипт создания всех таблиц базы данных
CREATE TABLE IF NOT EXISTS categories
(
	category_id BIGSERIAL,
	parent_category_id BIGINT,
	name VARCHAR(255) NOT NULL,
	PRIMARY KEY(category_id),
	FOREIGN KEY(parent_category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS products
(
	product_id BIGSERIAL,
	category_id BIGINT NULL,
	title VARCHAR(255) NOT NULL,
	amount INT NOT NULL CHECK(amount >= 0),
	price INT NOT NULL CHECK(price > 0),
	PRIMARY KEY(product_id),
	FOREIGN KEY(category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS clients
(
	client_id BIGSERIAL,
	name VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	PRIMARY KEY(client_id)
);

CREATE TABLE IF NOT EXISTS orders
(
	order_id BIGSERIAL,
	client_id BIGINT NOT NULL,
	date DATE NOT NULL,
	PRIMARY KEY(order_id),
	FOREIGN KEY(client_id) REFERENCES clients(client_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS products_orders
(
	product_id BIGINT,
	order_id BIGINT,
	quantity INT NOT NULL CHECK(quantity > 0),
	PRIMARY KEY(product_id, order_id),
	FOREIGN KEY(product_id) REFERENCES products(product_id) ON DELETE CASCADE,
	FOREIGN KEY(order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);
