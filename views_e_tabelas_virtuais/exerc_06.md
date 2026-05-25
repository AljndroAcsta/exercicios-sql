Disciplina: Manipulação de Dados / Banco de Dados II
Professor: Aguinaldo Neto

Você foi contratado por uma empresa de e-commerce chamada TecnoStore,
que possui as seguintes tabelas em seu banco de dados:

CRIAR Banco de dados TecnoStoreDB;
CRIAR TABELA Clientes
id_cliente INT PRIMARY KEY,
nome VARCHAR(100),
cidade VARCHAR(50),
estado CHAR(2);

CRIAR TABELA Produtos
id_produto INT PRIMARY KEY,
nome_produto VARCHAR(100),
categoria VARCHAR(50),
preco DECIMAL(10,2);

CRIAR TABELA Pedidos
id_pedido INT PRIMARY KEY,
id_cliente INT,
data_pedido DATE,
valor_total DECIMAL(10,2),
FOREIGN KEY (id_cliente) REFERENCES Clientes id_cliente;

CRIAR TABELA Itens_Pedido
id_pedido INT,
id_produto INT,
quantidade INT,
FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
FOREIGN KEY (id_produto) REFERENCES Produtos id_produto;

INSERÇÃO DE DADOS
TABELA Clientes
(1, 'João Silva', 'São Paulo', 'SP'),
(2, 'Maria Souza', 'Campinas', 'SP'),
(3, 'Carlos Pereira', 'Rio de Janeiro', 'RJ'),
(4, 'Ana Lima', 'Belo Horizonte', 'MG');

INSERÇÃO DE DADOS
TABELA Produtos
(1, 'Notebook Lenovo', 'Informática', 3500.00),
(2, 'Mouse Logitech', 'Periféricos', 150.00),
(3, 'Teclado Mecânico', 'Periféricos', 450.00),
(4, 'Monitor Samsung', 'Monitores', 1200.00);

INSERÇÃO DE DADOS
TABELA Pedidos
(100, 1, '2025-10-01', 3650.00),
(101, 2, '2025-10-02', 1650.00),
(102, 1, '2025-10-05', 1200.00),
(103, 3, '2025-10-06', 450.00);

INSERÇÃO DE DADOS
TABELA Itens_Pedido
(100, 1, 1),
(100, 2, 1),
(101, 1, 1),
(101, 3, 2),
(102, 4, 1),
(103, 3, 1);

Criação de uma View Simples
Crie uma view chamada VW_CLIENTES_SP que mostre apenas os clientes do
estado de São Paulo (SP), exibindo id_cliente, nome e cidade.

Criação de uma View Complexa
Crie uma view chamada VW_VENDAS_RESUMO que traga o nome do cliente,
o nome do produto e a quantidade vendida, juntando as tabelas Clientes,
Pedidos, Itens_Pedido e Produtos.

Alterando Nomes de Campos na View
Crie uma view chamada VW_PRODUTOS_REDUZIDOS que exiba os campos
id_produto como Código, nome_produto como Produto e preco como Preço.

View Baseada em Outra View
Crie uma view chamada VW_TOP_VENDAS que mostre apenas os produtos
com quantidade total vendida maior que 50, baseada na view
VW_VENDAS_RESUMO.

Consulta Utilizando Views
Escreva um comando SELECT para exibir todos os registros da view
VW_TOP_VENDAS, ordenados pelo nome do produto.

Atualização em View (Discussão)
Explique se é possível atualizar diretamente a view VW_VENDAS_RESUMO.
Justifique sua resposta com base no tipo da view (simples ou complexa).