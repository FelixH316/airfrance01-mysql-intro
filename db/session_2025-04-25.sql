CREATE DATABASE tienda;
USE tienda;

CREATE TABLE clientes(
cliente_id INT NOT NULL PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
ciudad VARCHAR(30) NOT NULL
);

CREATE TABLE pedidos(
pedido_id INT NOT NULL PRIMARY KEY,
cliente_id INT,
FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE productos(
producto_id INT NOT NULL PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE detalle_pedido(
detalle_pedido_id INT NOT NULL PRIMARY KEY, -- AUTO_INCREMENT puede ir aquí
pedido_id INT NOT NULL,
producto_id INT NOT NULL,
cantidad INT,
FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

INSERT INTO clientes(cliente_id, nombre, ciudad) VALUES (1, "Ana", "CDMX"), (2, "Luis", "Puebla");
SELECT * FROM clientes;

INSERT INTO productos(producto_id, nombre, precio) VALUES (1, "Laptop", 1000), (2, "Mouse", 20), (3, "Teclado", 50);
SELECT * FROM productos;

INSERT INTO pedidos(pedido_id, cliente_id) VALUES (1, 1), (2, 2);
SELECT * FROM pedidos;

INSERT INTO detalle_pedido(detalle_pedido_id, pedido_id, producto_id, cantidad) VALUES (1, 1, 1, 1), (2, 1, 2, 2), (3, 2, 3, 1);
SELECT * FROM detalle_pedido;

SELECT nombre FROM clientes;

# Busquedas
SELECT * FROM clientes WHERE nombre="Ana";
SELECT * FROM clientes WHERE ciudad="CDMX";

# Todos los productos de más de 20 pesos
SELECT * FROM productos WHERE precio > 20;

SELECT * FROM productos;
# Ordenar de forma descendente
SELECT * FROM productos ORDER BY precio DESC;
# Ordenar de forma ascendente
SELECT * FROM productos ORDER BY precio ASC;
