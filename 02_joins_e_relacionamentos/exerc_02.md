Disciplina: Manipulação de Dados / Banco de Dados II  
Professor: Aguinaldo Neto 

Exercício 1: Criação de Tabela e Inserção de Dados 
Crie uma tabela chamada Funcionarios com as seguintes colunas: 
• Id (INT, chave primária, autoincremento) 
• Nome (VARCHAR(50)) 
• Cargo (VARCHAR(50)) 
• Salario (DECIMAL(10,2))

Insira os seguintes registros na tabela: 
Nome 
Cargo
Salario

Fernando Henrique 
Desenvolvedor 
4500.00 

Carlos Chagas 
Analista 
3800.00 

Paula Fernandes 
DBA 
5200.00 

Ludmila Anita 
Desenvolvedor 
4700.00 

Exercício 2: Consulta com Filtro e Ordenação 
Ulizando a tabela Funcionarios, escreva uma consulta que retorne todos os funcionários com o 
cargo de "Desenvolvedor" e ordene o resultado pelo campo Salario em ordem decrescente. 
Obje vo: Demonstre que você pode aplicar filtros e ordenar os dados corretamente. 

Exercício 3: Atualização de Dados 
Atualize o salário do funcionário "Carlos Chagas" para 4000.00. 
Obje vo: Escreva o comando SQL necessário para atualizar um registro específico na tabela. 

Exercício 4: Uso de Funções Agregadas 
Escreva uma consulta que retorne o salário médio dos funcionários e o número total de 
funcionários cadastrados na tabela Funcionarios. 
Obje vo: Demonstre conhecimento sobre funções agregadas (AVG, COUNT). 

Exercício 5: Exclusão de Registros 
Exclua todos os funcionários que possuem um salário inferior a 4000.00. 
Obje vo: Mostre que você sabe usar comandos SQL para excluir registros com base em uma 
condição. 

Exercício 6: Consulta com Join 
Crie uma nova tabela chamada Departamentos com as seguintes colunas: 
• Id (INT, chave primária, autoincremento) 
• Nome (VARCHAR(50)) 

Insira os seguintes registros na tabela: 
Nome 
TI 
RH 
Financeiro 

Em seguida, adicione uma nova coluna chamada DepartamentoId à tabela Funcionarios, que 
será uma chave estrangeira referenciando o campo Id da tabela Departamentos. 
Atualize os dados na tabela Funcionarios para que: 
• "Fernando Henrique" e "Carlos Chagas" estejam no departamento de "TI". 
• "Ludmila Anita" esteja no departamento de "RH". 
• "Paula Fernandes" esteja no departamento de "Financeiro".