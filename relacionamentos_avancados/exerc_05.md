Disciplina: Manipulação de Dados / Banco de Dados II
Professor: Aguinaldo Neto

Atividade Prática: Manipulação de Dados e Relacionamentos
Objetivo: Praticar comandos DDL, DML e consultas complexas envolvendo
Joins, Agregação e Filtros de Grupo.
1. Criação do Esquema (DDL)
Crie as tabelas respeitando as chaves primárias e as restrições de chave
estrangeira apresentadas no diagrama:

2. Povoamento de Dados (DML)
Insira os personagens da Terra Média seguindo a ordem de dependência
(primeiro a pessoa, depois o vínculo):
Tabela: pessoa
1. 'Frodo Bolseiro', '111', 'RG1'
2. 'Aragorn', '222', 'RG2'
3. 'Legolas', '333', 'RG3'
4. 'Gimli', '444', 'RG4'
5. 'Gandalf', '555', 'RG5'
6. 'Samwise Gamgee', '666', 'RG6'
Tabela: cliente
• Frodo: Saldo 150.00

• Aragorn: Saldo 0.00
• Legolas: Saldo 50.00
• Gimli: Saldo 500.00
• Samwise: Saldo 10.00
Tabela: funcionario
• Gandalf: Matrícula 'MAG01', Salário 9000.00
• Aragorn: Matrícula 'REI01', Salário 8500.00
• Legolas: Matrícula 'ELF01', Salário 7000.00
• Gimli: Matrícula 'ANAO01', Salário 7000.00
• Samwise: Matrícula 'JAR01', Salário 3000.00

3. Desafios de Consulta (SQL)
3.1 Consulta com Múltiplos Joins
Escreva uma consulta que exiba o nome da pessoa, o seu saldo devedor
(como cliente) e o seu salário (como funcionário), unindo as três tabelas. (Dica:
Use INNER JOIN para retornar apenas quem é cliente e funcionário ao mesmo
tempo).

3.2 Agregação, Group By e Having
Escreva uma consulta que agrupe os funcionários pelo valor do salário e
calcule a média salarial, mas exiba apenas os grupos de salários onde a média
seja superior a 5000.00.
3.3 Filtros de Texto
Liste todos os funcionários cujo nome da pessoa vinculada comece com a letra
"G".