CREATE DATABASE empresa_db;
USE empresa_db;

create table funcionarios (
    id_funcionarios INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL
);

INSERT INTO funcionarios (nome, email, data_nascimento, cargo, salario) VALUES
('Joao Victor ', 'joao.victor@email.com', '1990-05-15', 'Desenvolvedor', 4500.00),
('Victor Hugo', 'victor.hugo@email.com', '1985-12-10', 'Analista', 3800.00),
('Huan Silva', 'huan.silva@email.com', '1992-08-20', 'DBA', 5200.00), 
('Franco Tales', 'franco.tales@email.com', '1988-03-25', 'Desenvolvedor', 4700.00);

select * from funcionarios 
where cargo = 'Desenvolvedor'
order by salario desc;

update funcionarios 
set salario = 6200.00 
where nome = 'Franco Tales';

select avg(salario), count(*) from funcionarios 
where cargo = 'Desenvolvedor';

delete from funcionarios 
where salqario < 4000.00;

create table departamentos (
    id_departamentos INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    foreign key (id_departamentos) references funcionarios(id_funcionarios)
);

insert into departamentos (nome) values
('TI'),
('Recursos Humanos'),
('Financeiro');

insert into departamentos (nome, departamentos, id_funcionarios) values ('victor hugo', 'Analista', 2);

insert into departamentos (nome, departamentos, id_funcionarios) values ('huan silva', 'DBA', 1);