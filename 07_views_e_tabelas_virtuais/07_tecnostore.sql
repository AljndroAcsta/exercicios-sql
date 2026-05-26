CREATE DATABASE TecnoStore;
USE TecnoStore;

create table clientes (
    id_cliente int primary key auto_increment,
    nome varchar(255) not null,
    cidade varchar(50) not null ,
    estado varchar(2) not null
);

create table produtos (
    id_produto int primary key auto_increment,
    nome_produto varchar(255) not null,
    categoria varchar(50) not null,
    preco decimal(10,2) not null
);

create table pedidos (
    id_pedido int primary key,
    id_cliente int,
    valor_total decimal(10,2) not null,
    data_pedido date not null,
    foreign key (id_cliente) references clientes(id_cliente)
);

create table itens_pedido (
    id_pedido int,
    id_produto int,
    quantidade int not null,
    foreign key (id_pedido) references pedidos(id_pedido),
    foreign key (id_produto) references produtos(id_produto)
);

insert into clientes (nome, cidade, estado) values
('João Silva', 'São Paulo', 'SP'),
('Maria Oliveira', 'Rio de Janeiro', 'RJ'),
('Carlos Santos', 'Belo Horizonte', 'MG'),
('Ana Costa', 'Curitiba', 'PR');

insert into produtos (id_produto, nome_produto, categoria, preco) values
(1,'Notebook Lenovo', 'Informatica', 3500.99),
(2,'Mouse Logitech', 'Perifericos', 150.00),
(3,'Teclado mecanico', 'Perifericos', 450.00),
(4,'Monitor Samsung', 'Monitores', 1200.00);

insert into pedidos (id_pedido, id_cliente, data_pedido, valor_total) values
(100, 1,  '2025-01-15', 3500.99),
(101, 2,  '2025-02-20', 1650.00),
(102, 4,  '2025-05-10', 1200.00),
(103, 3, '2025-06-05', 450.00);

insert into itens_pedido (id_pedido, id_produto, quantidade) values
(100, 1, 1 ),
(100, 2, 1 ),
(101, 1, 1 ),
(101, 3, 2 ),
(102, 4, 1 ),
(103, 3, 1 );

create view vw_clientes_SP as
select id_cliente, nome, cidade
from clientes
where estado = 'SP';
select * from vw_clientes_SP;

create view vw_vendas_resumo AS
select
    c.nome,
    p.nome_produto,
    i.quantidade
from clientes c
inner join pedidos ped on c.id_cliente = ped.id_cliente
inner join itens_pedido i on ped.id_pedido = i.id_pedido
inner join produtos p on i.id_produto = p.id_produto;
select * from vw_vendas_resumo;

create view vw_produtos_reduzidos AS
select
    id_produto as 'codigo',
    nome_produto AS 'produto',
    preco as 'preço'
from produtos;
select * from vw_produtos_reduzidos;

create view vw_top_vendas AS
select
    nome_produto,
    sum(quantidade) as total_vendido
from vw_vendas_resumo
group by nome_produto
having sum(quantidade) > 50;
select * from vw_top_vendas order by nome_produto;

--não é possível atualizar diretamente a view