Disciplina: Manipulação de Dados / Banco de Dados II
Professor: Aguinaldo Neto

Atividade Prática: Gestão de Cafeteria e Estoque Cenário.

Você foi contratado para organizar o banco de dados da cafeteria "Grão de Ouro". O sistema precisa controlar as vendas diárias, os pedidos feitos aos
fornecedores e a entrada de insumos (café, leite, doces). Parte 1: Criação do Banco de Dados Os alunos devem criar as tabelas abaixo. Note que alguns campos possuem tipos de dados específicos que devem ser respeitados.

1. Tabela fornecedores
Coluna Tipo Restrição
id_fornecedor INT Primary Key
nome_empresa VARCHAR(100) NOT NULL
contato VARCHAR(50)

2. Tabela produtos
Coluna Tipo Restrição
id_produto INT Primary Key
nome_produto VARCHAR(100) NOT NULL
preco_custo DECIMAL(10,2)
preco_venda DECIMAL(10,2)
estoque_atual INT Default 0
id_fornecedor INT Foreign Key

3. Tabela vendas
Coluna Tipo Restrição
id_venda INT Primary Key
data_venda DATE NOT NULL
id_produto INT Foreign Key
quantidade INT
valor_total DECIMAL(10,2)

4. Tabela pedidos_compra
(Representa o que você pediu ao fornecedor, mas ainda não chegou)
Coluna Tipo Restrição
id_pedido INT Primary Key
id_produto INT Foreign Key
id_fornecedor INT Foreign Key
qtd_pedida INT
status VARCHAR(20) 'Pendente' ou 'Recebido'

Parte 2: Inserção de Dados (População)
Peça aos alunos para inserirem pelo menos:
• 3 Fornecedores (ex: Distribuidora de Grãos, Laticínios Silva).
• 5 Produtos (ex: Café Espresso, Cappuccino, Croissant).
• 5 Vendas ocorridas em Fevereiro de 2026.
• 2 Pedidos de Compra (um 'Recebido' e um 'Pendente').

Parte 3: Consultas SQL (O Desafio)
1. Relatório de Faturamento:
Monte uma consulta que mostre o nome do produto, a quantidade total vendida
e o valor total arrecadado por esse produto no mês de Fevereiro de 2026.
2. Gestão de Estoque Crítico:
Crie uma consulta que liste todos os produtos cujo estoque_atual seja menor que 10 unidades, mostrando também o nome e o telefone do fornecedor para contato.

3. Pedidos em Aberto:
Liste os produtos que possuem pedidos de compra com status 'Pendente', mostrando o nome do produto e a quantidade que deve chegar.

Parte 4: Transformação e Lógica
1. Ajuste de Preços (Update):
A cafeteria decidiu dar um aumento de 10% em todos os produtos fornecidos pela "Distribuidora de Grãos". Escreva o comando SQL para essa atualização.

2. Desafio de Trigger:
Crie uma trigger que, ao inserir uma nova venda na tabela vendas, subtraia automaticamente a quantidade vendida do estoque_atual na tabela produtos.