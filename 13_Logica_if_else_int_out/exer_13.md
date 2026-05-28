Disciplina: Manipulação de Dados / Banco de Dados II
Professor: Aguinaldo Neto

parte 1. Criar o banco de dados e tabela (SP e cliente).
Execute os comandos abaixo para criar o banco de dados e a tabela cliente:

id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
nome VARCHAR(50)
data_nasc DATE

Inserir dados:
Aguinaldo Neto, 1986-08-02,
Nicolas Padilha, 2018-07-31,
Anderson Silva, 2005-03-15,
João Felix, 1990-11-22

parte 2. Crie uma procedure chamada idade que:
1. Receba como parâmetro de entrada o ID de um cliente (IN)
2. Retorne como parâmetro de saída a idade atual do cliente em anos (OUT).
3. Calcule a idade subtraindo o ano atual do ano de nascimento

parte 3. Crie uma procedure chamada menormaior que:
1. Receba o ID do cliente como entrada (IN).
2. Retorne dois parâmetros de saída: A idade do cliente (OUT).
Uma classificação textual "Maior" ou "Menor" baseada na idade (OUT).
3. Considere maioridade a partir de 18 anos.

parte 4. Execute as procedures criadas:
1. Para o cliente com ID 1.
2. Para o cliente com ID 2.
3. Para o cliente com ID 3.
4. Para o cliente com ID 4.
5. Verifique se os resultados estão corretos.