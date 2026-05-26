CREATE DATABASE supermercado;
USE supermercado;

create table clientes (
    id_cliente int primary key auto_increment,
    nome varchar(255) not null,
    cidade varchar(255) not null
);
INSERT INTO clientes (nome, cidade) VALUES
('Anakin Skywalker', 'Tatooine'),
('Leia Organa', 'Alderaan'),
('Yoda', 'Dagobah'),
('Han Solo', 'Corellia');

create table pedidos (
    id_pedido int primary key auto_increment,
    id_cliente int not null,
    valor decimal(10, 2) not null check (valor > 0),
    data_pedido date not null,
    foreign key (id_cliente) references clientes(id_cliente)
);
INSERT INTO pedidos (id_cliente, valor, data_pedido) VALUES
(1, 500.00, '2024-01-15'),
(1, 750.00, '2024-02-20'),
(2, 1200.00, '2024-03-10'),
(2, 300.00, '2024-04-05'), 
(4, 1500.00, '2024-05-12'),
(4, 200.00, '2024-06-18'),
(4, 800.00, '2024-07-22');

SELECT id_cliente, nome, cidade FROM clientes;

SELECT id_pedido, id_cliente, valor as valor_total, data_pedido FROM pedidos;

SELECT
    clientes.id_cliente,
    clientes.nome,
    pedidos.id_pedido,
    pedidos.valor as valor_total,
from pedidos
inner join clientes on pedidos.id_cliente = clientes.id_cliente
ORDER BY clientes.nome;

SELECT
    clientes.id_cliente,
    clientes.nome,
    pedidos.id_pedido,
    pedidos.valor as valor_total,
from pedidos
inner join clientes on pedidos.id_cliente = clientes.id_cliente
WHERE pedidos.id_pedidos is NOT NULL
ORDER BY clientes.nome;

SELECT
    c.cidade,
    avg(p.valor) AS valor_medio_pedidos
FROM clientes c 
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.cidade
HAVING avg(p.valor) > 300.00;