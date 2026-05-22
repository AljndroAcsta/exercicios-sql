CREATE DATABASE idade_media;
USE idade_media;

CREATE TABLE pessoas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf INT UNIQUE,
    rg VARCHAR(20) UNIQUE
);

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    saldo_devedor DECIMAL(10, 2),
    pessoa_id INT,
    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id)
);

create table funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT,    
    matricula VARCHAR(20) UNIQUE,
    salario DECIMAL(10, 2),
    pessoa_id INT,
    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id)
);

INSERT INTO pessoas (nome, cpf, rg) VALUES 
('Frogo Bolseiro', 111, 'RG1'),
('Aragonn', 222, 'RG2'),
('Legolas', 333, 'RG3'),
('Gimli', 444, 'RG5'),
('Gandalf', 555, 'RG4'),
('Sanwise Gamgee', 666, 'RG6');

INSERT INTO clientes (saldo_devedor, pessoa_id) VALUES 
( 100.00, 2),
( 200.00, 3),
( 300.00, 4),
( 400.00, 6);

INSERT INTO funcionarios (matricula, salario, pessoa_id) VALUES 
( 'MAGG01', 9000.00, 5),
( 'REI01', 8000.00, 2),
( 'ELF01', 7000.00, 3),
( 'ANAO01', 7000.00, 4),
( 'JAR01', 6000.00, 6);

select 
    p.nome, 
    c.saldo_devedor, 
    f.salario
from pessoas p
inner join clientes c on p.id = c.pessoa_id
inner join funcionarios f on p.id = f.pessoa_id;

select
    funcionarios,
    avg(salario) as Media_salarial
    from funcionarios
    group by funcionarios
    having avg(salario) > 5000.00;

select
    f.*,
    p.nome
from  funcionarios f
inner join pessoas p on f.pessoa_id = p.id
where p.nome like 'G%';