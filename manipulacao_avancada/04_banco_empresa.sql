CREATE DATABASE empresa;
USE empresa;

CREATE TABLE colaboradores (
    id_colaborador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL CHECK (salario > 0)
);

INSERT INTO colaboradores (nome, cargo, salario) VALUES
('Peter Parker', 'Desenvolvedor', 4600.00),
('Tony Stark', 'Arquiteto de Software', 7200.00),
('Natasaha Romanoff', 'Analista', 3900.00),
('Bruce Banner', 'DBA', 5100.00),
('Steve Rogers', 'Suporte', 3200.00);

CREATE TABLE projetos (
    id_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nome_projeto VARCHAR(255) NOT NULL,
    responsavel INT NOT NULL,
    FOREIGN KEY (responsavel) REFERENCES colaboradores(id_colaborador)
);

INSERT INTO projetos (nome_projeto, responsavel) VALUES
('Sistema de Vendas', 1),
('Aplicativo Corporativo', 2),
('BI Analytics', 3),
('Segurança Interna', 4);

SELECT nome FROM colaboradores 
UNION ALL SELECT nome_projeto FROM projetos;

SELECT nome FROM colaboradores 
UNION SELECT nome_projeto FROM projetos;

SELECT * FROM  colaboradores 
WHERE nome like '%e%';

SELECT * FROM  colaboradores 
WHERE salario BETWEEN 4000 AND 6000;

SELECT min(salario), max(salario) FROM colaboradores;

SELECT * FROM colaboradores ORDER BY salario DESC LIMIT 3;

SELECT cargo, count(*), avg(salario) FROM colaboradores
GROUP BY cargo HAVING avg(salario) > 4500.00;