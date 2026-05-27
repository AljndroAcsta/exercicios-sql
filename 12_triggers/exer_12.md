Disciplina: Manipulação de Dados / Banco de Dados II
Professor: Aguinaldo Neto

Exercício Prático: Triggers no MySQL
Objetivo:
Criar um sistema de gerenciamento de biblioteca com triggers para automatizar
tarefas comuns.
Cenário:
Você precisa implementar um banco de dados para uma biblioteca que:
1. Registra automaticamente a data de cadastro de livros
2. Controla o estoque quando livros são emprestados/devolvidos
3. Mantém um histórico de movimentações
Parte 1: Criação do Banco de Dados
-- Criar o banco de dados biblioteca

-- Criar tabela de livros
id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
autor VARCHAR(100) NOT NULL,
isbn VARCHAR(20),
quantidade INT NOT NULL DEFAULT 1,
data_cadastro DATETIME

-- Criar tabela de empréstimos
id INT AUTO_INCREMENT PRIMARY KEY,
livro_id INT NOT NULL,
usuario VARCHAR(100) NOT NULL,
data_emprestimo DATETIME,
data_devolucao DATETIME,
FOREIGN KEY (livro_id) REFERENCES livros(id)

-- Criar tabela de histórico (para livros removidos)
id INT,
titulo VARCHAR(100) NOT NULL,
autor VARCHAR(100) NOT NULL,
isbn VARCHAR(20),
data_remocao DATETIME,
motivo VARCHAR(255)

Parte 2: Criar Triggers
Exercício 1: Crie um trigger que automaticamente defina a data de cadastro quando um novo livro é inserido.

Exercício 2: Crie um trigger que, ao registrar um empréstimo:
• Diminua a quantidade disponível do livro
• Defina a data do empréstimo como a data atual

Exercício 3: Crie um trigger que, ao deletar um livro:
• Salve os dados na tabela de histórico
• Registre a data de remoção e o motivo "Descartado"

Parte 3: Testar os Triggers
-- Inserir livros (deve acionar o trigger do Exercício 1)
Dom Casmurro, Machado de Assis, 9788544001823, 5 e
1984, George Orwell, 9788522106169, 3;
-- Registrar empréstimo (deve acionar o trigger do Exercício 2)
1, João Silva;
-- Deletar livro do id = 2(deve acionar o trigger do Exercício 3)
Fazer um select antes e depois;
Parte 4: Consultas para Verificação
-- Verificar livros
-- Verificar empréstimos
-- Verificar histórico