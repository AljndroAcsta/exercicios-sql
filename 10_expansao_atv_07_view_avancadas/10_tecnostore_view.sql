USE TecnoStore;

create table fornecedores (
    id_fornecedor int primary key auto_increment,
    nome_empresa varchar(255) not null,
    cidade varchar(50) not null,
    pais varchar(50) not null
);

alter table produtos add column id_fornecedor int;

alter table produtos add foreign key (id_fornecedor)
references fornecedores(id_fornecedor);

create table estoque (
    id_produto int primary key,
    quantidade_atual int not null,
    ponto_minimo int not null,
    foreign key (id_produto) references produtos(id_produto)
);

INSERT INTO clientes (id_cliente, nome, cidade, estado) VALUES
(5, 'Lucas Mendes', 'Curitiba', 'PR'),
(6, 'Fernanda Costa', 'Porto Alegre', 'RS'),
(7, 'Roberto Carlos', 'Vitória', 'ES'),
(8, 'Sofia Almeida', 'Recife', 'PE'),
(9, 'Gustavo Lima', 'Salvador', 'BA'),
(10, 'Isabela Fernandes', 'Fortaleza', 'CE'),
(11, 'Rafael Oliveira', 'Manaus', 'CE'),
(12, 'Camila Santos', 'Belém', 'PA'),
(13, 'Bruno Souza', 'Goiânia', 'GO'),
(14, 'Mariana Ribeiro', 'Florianópolis', 'SC'),
(15, 'Thiago Silva', 'Brasília', 'DF'),
(16, 'Larissa Costa', 'Campo Grande', 'MS'),
(17, 'Eduardo Pereira', 'Maceió', 'AL'),
(18, 'Amanda Rodrigues', 'Natal', 'RN'),
(19, 'Felipe Gomes', 'João Pessoa', 'PB'),
(20, 'Juliana Martins', 'Aracaju', 'SE'),
(21, 'Bruna Carvalho', 'Cuiabá', 'MT'),
(22, 'Gustavo Almeida', 'Teresina', 'PI'),
(23, 'Larissa Silva', 'São Luís', 'MA'),
(24, 'Rafael Costa', 'Porto Velho', 'RO'),
(25, 'Camila Oliveira', 'Boa Vista', 'PI');

INSERT INTO fornecedores (id_fornecedor, nome_empresa, cidade, pais) VALUES
(1, 'Tech Distribuidora', 'São Paulo', 'Brasil'),
(2, 'Global Hardware', 'Miami', 'EUA'),
(3, 'Informatica Solutions', 'Londres', 'Reino Unido'),
(4, 'Eletrônicos Brasil', 'Rio de Janeiro', 'Brasil'),
(5, 'Tech World', 'Tóquio', 'Japão');

INSERT INTO produtos (id_produto, nome_produto, categoria, preco, id_fornecedor) VALUES
(5, 'Placa de Vídeo RTX 4060', 'Hardware', 2500.00, 2),
(6, 'Headset Gamer 7.1', 'Periféricos', 350.00, 1),
(7, 'Console PlayStation 5', 'Games', 4200.00, 2),
(8, 'SSD NVMe 1TB', 'Hardware', 800.00, 3),
(9, 'Cadeira Gamer', 'Móveis', 1200.00, 4),
(10, 'Monitor Curvo 27"', 'Monitores', 1500.00, 5),
(11, 'Teclado RGB Mecânico', 'Periféricos', 600.00, 1),
(12, 'Mouse Gamer Wireless', 'Periféricos', 200.00, 2),
(13, 'Webcam Full HD', 'Periféricos', 150.00, 3),
(14, 'Microfone USB', 'Periféricos', 300.00, 4),
(15, 'Cabo HDMI 2.1', 'Acessórios', 100.00, 5),
(16, 'Fonte de Alimentação 750W', 'Hardware', 400.00, 1),
(17, 'Placa-Mãe Z690', 'Hardware', 1200.00, 2),
(18, 'Memória RAM 16GB DDR4', 'Hardware', 350.00, 3),
(19, 'Gabinete Gamer', 'Móveis', 800.00, 4),
(20, 'Monitor LED 24"', 'Monitores', 900.00, 5);

INSERT INTO estoque (id_produto, quantidade_atual, ponto_minimo) VALUES
(5, 10, 5),
(6, 3, 10),
(7, 20, 5),
(8, 15, 5),
(9, 5, 2),
(10, 8, 3),
(11, 12, 4),
(12, 25, 10),
(13, 30, 15),
(14, 18, 5),
(15, 50, 20),
(16, 7, 3),
(17, 9, 4),
(18, 20, 10),
(19, 6, 2),
(20, 14, 5);

INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, valor_total) VALUES
(104, 5, '2026-05-10', 2500.00),
(105, 5, '2026-05-12', 350.00),
(106, 5, '2026-05-15', 4200.00),
(107, 5, '2026-05-18', 150.00),
(108, 5, '2026-05-20', 450.00),
(109, 5, '2026-05-22', 1200.00),
(110, 5, '2026-05-25', 1500.00),
(111, 5, '2026-05-28', 600.00),
(112, 5, '2026-05-30', 200.00),
(113, 5, '2026-06-02', 300.00),
(114, 5, '2026-06-05', 100.00),
(115, 5, '2026-06-10', 400.00),
(116, 5, '2026-06-15', 1200.00),
(117, 5, '2026-06-20', 350.00),
(118, 5, '2026-06-25', 800.00),
(119, 5, '2026-06-30', 900.00),
(120, 5, '2026-07-05', 1500.00),
(121, 5, '2026-07-10', 1200.00),
(122, 5, '2026-07-15', 1500.00),
(123, 5, '2026-07-20', 900.00),
(124, 5, '2026-07-25', 800.00),
(125, 5, '2026-07-30', 350.00);

INSERT INTO itens_Pedido (id_pedido, id_produto, quantidade) VALUES
(104, 5, 1),
(105, 6, 1),
(106, 7, 1),
(107, 8, 1),
(108, 9, 1),
(109, 10, 1),
(110, 11, 1),
(111, 12, 1),
(112, 13, 1),
(113, 14, 1),
(114, 15, 1),
(115, 16, 1),
(116, 17, 1),
(117, 18, 1),
(118, 19, 1),
(119, 20, 1),
(120, 5, 1),
(121, 6, 1),
(122, 7, 1),
(123, 8, 1),
(124, 9, 1),
(125, 10, 1);

create view vw_alerta_estoque as
select p.nome_produto, e.quantidade_atual
from produtos p
inner join estoque e on p.id_produto = e.id_produto
where e.quantidade_atual < e.ponto_minimo;
select * from vw_alerta_estoque;

create view vw_desempenho_fornecedores as
select f.nome_empresa, count(p.id_produto) as quantidade_produtos
from fornecedores f
inner join produtos p on f.id_fornecedor = p.id_fornecedor
group by f.nome_empresa;
select * from vw_desempenho_fornecedores;

create view vw_faturamento_por_cliente as
select c.nome, sum(p.valor_total) as total_gasto
from clientes c
inner join pedidos p on c.id_cliente = p.id_cliente
group by c.nome;
select * from vw_faturamento_por_cliente;

create view vw_productos_nunca_vendidos as
select p.nome_produto
from produtos p
left join itens_Pedido i on p.id_produto = i.id_produto
where i.id_produto is null;
select * from vw_productos_nunca_vendidos;

select 
    v.nome_produto,
    v.quantidade_atual,
    f.nome_empresa as fornecedor
from vw_alerta_estoque v
inner join produtos p on v.nome_produto = p.nome_produto
inner join fornecedores f on p.id_fornecedor = f.id_fornecedor
order by v.quantidade_atual asc;

/*
O comando abaixo gera um erro proposital. 
*/
-- update vw_faturamento_por_cliente
-- set total_gasto = 50000.00
-- where nome = 'Lucas Mendes';