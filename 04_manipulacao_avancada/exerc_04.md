Disciplina: Manipulação de Dados / Banco de Dados II
Professor: Aguinaldo Neto

1. Crie uma tabela chamada Colaboradores com as seguintes colunas:
• Id (INT, chave primária, autoincremento)
• Nome (VARCHAR(50))
• Cargo (VARCHAR(50))
• Salario (DECIMAL(10,2))
Insira os seguintes registros na tabela:
Nome Cargo Salario
Peter Parker Desenvolvedor 4600.00
Tony Stark Arquiteto de Software 7200.00
Natasha Romanoff Analista 3900.00
Bruce Banner DBA 5100.00
Steve Rogers Suporte 3200.00

2. Crie outra tabela chamada ProjetosTI com as seguintes colunas:
• Id (INT, chave primária, autoincremento)
• NomeProjeto (VARCHAR(100))
• Responsavel (VARCHAR(50))
Insira os seguintes registros na tabela:
NomeProjeto Responsavel
Sistema de Vendas Peter Parker
Aplicativo Corporativo Tony Stark
BI Analytics Natasha Romanoff
Segurança Interna Clint Barton

3. Escreva uma consulta que retorne todos os nomes dos colaboradores
da tabela Colaboradores e todos os responsáveis da tabela ProjetosTI.
Permita nomes repetidos no resultado.
📝 Dica: Use UNION ALL.

4. Escreva uma nova consulta que retorne apenas os nomes distintos entre
colaboradores e responsáveis de projetos (sem repetição).
📝 Dica: DISTINCT.

5. Liste todos os colaboradores cujo nome contenha a letra “e” (maiúscula
ou minúscula), em qualquer parte do nome.
📝 Dica: Use LIKE com %.

6. Liste os colaboradores cujo salário esteja entre 4000.00 e 6000.00,
inclusive.
📝 Dica: Use BETWEEN.

7. Escreva uma consulta que traga o menor e o maior salário da tabela
Colaboradores.
📝 Dica: Use MIN(Salario) e MAX(Salario).

8. Escreva uma consulta que retorne os 3 colaboradores com os maiores
salários.
📝 Dica: Use ORDER BY combinado com LIMIT.

9. Escreva uma consulta que agrupe os colaboradores por cargo e mostre:
• O nome do cargo
• A quantidade de colaboradores em cada cargo (COUNT)
• A média salarial de cada grupo (AVG)
Mostre apenas os cargos com média salarial superior a 4500.00.
📝 Dica: Use GROUP BY e HAVING.