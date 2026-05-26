CREATE DATABASE empresa2;
USE empresa2;

create table funcionarios (
    id int primary key auto_increment,
    nome varchar(255) not null,
    cargo varchar(255) not null,
    salario decimal(10,2) not null
);

CREATE TABLE projetos (
    id int primary key auto_increment,
    nomeProjeto varchar(255) not null,
    responsavel varchar(255) not null
);

INSERT INTO funcionarios (nome, cargo, salario) VALUES
('Jon Snow', 'Desenvolvedor', 4500.00),
('Daenerys Targaryen', 'Analista', 3800.00),
('Arya Stark', 'Desenvolvedor', 4800.00),
('Tyrion Lannister', 'DBA', 5200.00),
('Euron Greyjoy', 'Suporte', 3100.00);

INSERT INTO projetos (nomeProjeto, responsavel) VALUES
('Site Institucional', 'Jon Snow'),
('App Mobile', 'Daenerys Targaryen'),
('ERP Interno', 'Tyrion Lannister'),
('Dashboard', 'Arya Stark');

SELECT nome FROM funcionarios
UNION ALL 
select responsavel from projetos;

SELECT nome FROM funcionarios
union
select responsavel from projetos;

SELECT * FROM funcionarios
WHERE nome like '%a%';
    
SELECT * FROM funcionarios
WHERE salario BETWEEN 4000 AND 5000;

select min(salario) as salario_minimo,
max(salario) as salario_maximo from funcionarios;

select * from funcionarios
ORDER BY salario DESC
LIMIT 3;

select 
    cargo,
    count(*) as quantidade_funcionarios,
    avg(salario) as salario_medio
from funcionarios
group by cargo
HAVING avg(salario) > 4000;