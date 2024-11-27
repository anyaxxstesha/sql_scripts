-- Подсчет суммы заказанных клиентами продуктов
SELECT
	clients.client_id,
	clients.name,
	clients.address,
	SUM(COALESCE(products.price * products_orders.quantity, 0)) as total
FROM
	clients
	LEFT JOIN orders
		ON clients.client_id = orders.client_id
	LEFT JOIN products_orders
		ON orders.order_id = products_orders.order_id
	LEFT JOIN products
		ON products_orders.product_id = products.product_id
GROUP BY
	clients.client_id,
	clients.name,
	clients.address;
