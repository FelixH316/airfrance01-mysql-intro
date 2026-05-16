# MENTORIA 1

USE tienda;

DROP TABLE detalle_pedido; # WE DELETED detalle_pedido BECAUSE WE MADE A MISTAKE

CREATE TABLE detalle_pedido(
detalle_pedido_id INT,
producto_id INT,
cantidad INT NOT NULL,
PRIMARY KEY (detalle_pedido_id, producto_id),
FOREIGN KEY (detalle_pedido_id) REFERENCES pedidos (pedido_id),
FOREIGN KEY (producto_id) REFERENCES productos (producto_id)
);

INSERT INTO detalle_pedido(detalle_pedido_id, producto_id, cantidad) VALUES (1, 1, 1), (1, 2, 2), (2, 3, 1);
SELECT * FROM detalle_pedido;

SELECT * FROM detalle_pedido WHERE detalle_pedido_id = 1;

# PRODUCTOS ARRIBA DE 50 PESOS
SELECT * FROM productos WHERE precio > 50;

# CLIENTES REGISTRADOS TENEMOS
SELECT COUNT(*) FROM CLIENTES;
SELECT COUNT(*) AS total_clientes FROM CLIENTES;

# SUMA
SELECT SUM(precio) as total_precio FROM productos;
SELECT SUM(precio) FROM productos;

# CLIENTES POR CIUDAD
SELECT ciudad, COUNT(*) AS total FROM clientes GROUP BY ciudad;

# Actualizar datos de cliente
UPDATE clientes SET ciudad = 'Queretaro' WHERE cliente_id = 1;
# UPDATE clientes SET ciudad = 'Querétaro' WHERE nombre = 'Ana Elena' AND apellido = 'Cisneros';

# 
INSERT INTO clientes(cliente_id, nombre, ciudad) VALUES (3, "Omar", 'Guanajuato');
SELECT * FROM clientes;

DELETE FROM clientes WHERE cliente_id = 3;

SELECT pedidos.pedido_id, clientes.nombre, productos.nombre, detalle_pedido.cantidad FROM
pedidos JOIN clientes ON pedidos.cliente_id = clientes.cliente_id
JOIN detalle_pedido ON pedidos.pedido_id = detalle_pedido.detalle_pedido_id
JOIN productos ON detalle_pedido.producto_id = productos.producto_id;

SELECT pedidos.pedido_id, clientes.nombre, productos.nombre, detalle_pedido.cantidad FROM
pedidos JOIN clientes ON pedidos.cliente_id = clientes.cliente_id
JOIN detalle_pedido ON pedidos.pedido_id = detalle_pedido.detalle_pedido_id
JOIN productos ON detalle_pedido.producto_id = productos.producto_id WHERE pedidos.pedido_id = 1;

SELECT p.pedido_id, clientes.nombre, productos.nombre, detalle_pedido.cantidad FROM
pedidos p JOIN clientes ON p.cliente_id = clientes.cliente_id
JOIN detalle_pedido ON p.pedido_id = detalle_pedido.detalle_pedido_id
JOIN productos ON detalle_pedido.producto_id = productos.producto_id WHERE p.pedido_id = 1;