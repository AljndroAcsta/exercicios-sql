Disciplina: Manipulação de Dados / Banco de Dados II
Professor: Aguinaldo Neto

ATIVIDADE PRÁTICA: Expansão de Banco de Dados (TecnoStore)
PARTE 1: Novos Relacionamentos.
A empresa TecnoStore agora precisa controlar quem fornece os produtos e onde eles estão guardados. Implemente os comandos SQL para:
1. Criação da Tabela Fornecedores:
o id_fornecedor, nome_empresa, cidade e pais.
2. Alteração na Tabela Produtos:
o Adicione uma coluna id_fornecedor na tabela Produtos e crie a
chave estrangeira correspondente.
3. Criação da Tabela Estoque:
o id_produto, quantidade_atual, ponto_minimo (estoque de
segurança).

PARTE 2: Inserção de Dados Massiva
Para que os relatórios façam sentido, o banco precisa de volume.
1. Novos Clientes: Insira pelo menos mais 15 clientes de estados fora do
eixo AM/RR.
2. Novos Produtos: Insira 16 novos produtos variando entre as
categorias 'Periféricos', 'Hardware' e 'Games'.
3. Simulação de Vendas: Insira 20 novos pedidos e seus respectivos
itens.
o Atenção: Pelo menos 6 pedidos devem ser do mesmo cliente
para testar agrupamentos.

PARTE 3: Inteligência de Negócio com VIEWS
Com os dados inseridos, crie as seguintes visões:
1. VW_ALERTA_ESTOQUE: Exiba o nome do produto e a quantidade
atual apenas para produtos onde a quantidade_atual seja menor que o
ponto_minimo.
2. VW_DESEMPENHO_FORNECEDOR: Uma view que mostre o nome do
fornecedor e quantos produtos diferentes ele fornece para a TecnoStore.
3. VW_FATURAMENTO_POR_CLIENTE: Utilize JOIN entre Clientes e
Pedidos para mostrar o Nome do Cliente e a Soma Total gasta por ele
na loja.
4. VW_PRODUTOS_NUNCA_VENDIDOS: Crie uma view que utilize LEFT
JOIN para identificar produtos que estão cadastrados mas nunca
apareceram em nenhum item de pedido.

PARTE 4: Desafio e Discussão
1. Relatório de Logística: Escreva um SELECT que retorne todos os
dados da VW_ALERTA_ESTOQUE ordenando pelos fornecedores que
precisam entregar mais urgente.
2. Questão Teórica: Durante a aula, discutimos a atualização de views.
Tente executar um comando UPDATE na sua view
VW_FATURAMENTO_POR_CLIENTE para mudar o valor total de um
pedido.