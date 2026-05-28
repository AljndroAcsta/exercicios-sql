create database cafeteriaGraoOuro;
use cafeteriaGraoOuro;

create table fornecedores (
    id_fornecedor int auto_increment primary key,
    nome_empresa varchar(255) not null,
    contato varchar(50) not null
);

create table produtos (
    id_productos int auto_increment primary key,
    nome_produto varchar(255) not null,
    preco_custo decimal(10, 2) not null,
    preco_venda decimal(10, 2) not null,
    estoque_actual int default 0,
    id_fornecedor int,
    foreign key (id_fornecedor) references fornecedores(id_fornecedor)
);

create table vendas (
    id int auto_increment primary key,
    id_produto int,
    data_venda date not null,
    quantidade int not null,
    valor_total decimal(10, 2) not null,
    foreign key (id_produto) references produtos(id_productos)
); 

create table pedidos_compra (
    id_pedido int auto_increment primary key,
    id_produto int,
    id_fornecedor int,
    qtd_pedida int not null default 0,
    status varchar(20) default 'pendente',
    foreign key (id_produto) references produtos(id_productos),
    foreign key (id_fornecedor) references fornecedores(id_fornecedor)
);

insert into fornecedores (nome_empresa, contato) values
('Cafe do Brasil', '(11) 1234-5678'),
('Grãos do Mundo', '(21) 9876-5432'),
('Café Premium', '(31) 5555-5555'),
('Café do Sul', '(41) 4444-4444');

insert into produtos (nome_produto, preco_custo, preco_venda, estoque_actual, id_fornecedor) values
('Café Arábica', 10.00, 15.00, 100, 1),
('Café Robusta', 8.00, 12.00, 150, 2),
('Café Liberado', 12.00, 18.00, 80, 3),
('Café Kona', 20.00, 30.00, 50, 4),
('Café Mocha', 15.00, 22.00, 60, 1);

insert into pedidos_compra (id_produto, id_fornecedor, qtd_pedida) values
(1, 1, 20),
(2, 2, 30),
(3, 3, 25),
(4, 4, 15),
(5, 1, 20);

select 
    p.nome_produto,
    sum(v.quantidade) as total_vendido,
    sum(v.valor_total) as faturamento_total
from vendas v
join produtos p on v.id_produto = p.id_productos
where v.data_venda between '2026-01-01' and '2026-12-31'
group by p.nome_produto;

select 
    p.nome_produto,
    p.estoque_actual,
    f.nome_empresa as fornecedor,
    f.contato
from produtos p
join fornecedores f on p.id_fornecedor = f.id_fornecedor
where p.estoque_actual < 10;

select 
    p.nome_produto,
    pc.qtd_pedida
from pedidos_compra pc
join produtos p on pc.id_produto = p.id_productos
where pc.status = 'pendente';

update produtos
set preco_venda = preco_custo * 1.5
where id_fornecedor = (
    select id_fornecedor
    from fornecedores
    where nome_empresa = 'Café do Sul'
);

delimiter $$ 
create trigger trg_baixa_estoque_venda
after insert on vendas
for each row
begin
    update produtos
    set estoque_actual = estoque_actual - new.quantidade
    where id_productos = new.id_produto;
end $$
delimiter ;

insert into vendas (id_produto, data_venda, quantidade, valor_total) values
(1, curdate(), 5, 75.00),
(2, curdate(), 10, 125.00);