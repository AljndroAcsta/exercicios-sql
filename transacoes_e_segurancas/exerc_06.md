Disciplina: Manipulação de Dados / Banco de Dados II
Professor: Aguinaldo Neto

Atividade 06 – Consultas Avançadas com Duas Tabelas
1 - Crie uma tabela chamada Contas com as seguintes colunas:
• Id (INT, chave primária, autoincremento)
• Nome (VARCHAR(100))
• Saldo (DECIMAL(10,2))

Insira os seguintes registros na tabela:
Nome Saldo
Lady Gaga 1000.00
Bob Marley 500.00
Katy Perry 1500.00

2 - Atualização de saldo:
• A cliente Lady Gaga depositou R$ 250. Atualize o saldo dela.

3 - Transferência entre contas (fazer start da transação e executar)
• O cliente Katy Perry transferiu R$ 300 para Bob Marley. Faça essa operação usando uma transação.

4 - Cancelar uma operação (fazer start da transação e recuperar)
• Durante a transferência, se a atualização do saldo de Bob Marley falhar, cancele toda a transação.

5 - Remoção de cliente
• O cliente Bob Marley cancelou sua conta. Remova-o da tabela.

6 - Listar clientes com saldo acima de R$ 1000
• Faça uma consulta para listar todos os clientes que possuem saldo acima de R$ 1000.

7 - Gerar um relatório de saldo:
• Após a operação (se tudo tivesse dado certo), liste os clientes e seus respectivos saldos, ordenando do maior para o menor saldo.