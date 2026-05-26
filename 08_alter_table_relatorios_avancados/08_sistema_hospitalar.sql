CREATE DATABASE SistemaHospitalar;
USE SistemaHospitalar;

CREATE table pessoa (
    id_pessoa int primary key auto_increment,
    nome varchar(255) not null,
    cpf varchar(14) not null unique,
    telefone varchar(15) not null
);

create table unidade (
    id_unidade int primary key auto_increment,
    nome_unidade varchar(255) not null
);

create table paciente (
    id_paciente int primary key auto_increment,
    debito_exames decimal(10,2),
    id_pessoa int not null, 
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

create table profissional_saude (
    id_profissional int primary key auto_increment,
    crm_coren varchar(20) not null,
    salario decimal(10,2),
    id_unidade int,
     FOREIGN KEY (id_unidade) REFERENCES unidade(id_unidade),
    id_pessoa int, 
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

insert into unidade(nome_unidade) values
('cardiologia'),
('pronto atendimento'),
('oncologia');

insert into pessoa(nome, cpf, telefone) values
('Dr goku', '123.456.789-00', '(11) 98765-4321'),
('enf. Bulma', '987.654.321-00', '(21) 91234-5678'),
('Vegeta', '456.789.123-00', '(31) 99876-5432'),
('Piccolo', '111.222.333-44', '(41) 98765-4321'),
('Dra. Videl', '555.666.777-88', '(51) 91234-5678'),
('Dr. gohan', '999.888.777-66', '(61) 99876-5432'),
('Trunks', '222.333.444-55', '(71) 98765-4321'),
('Majin Boo', '333.444.555-66', '(81) 91234-5678'),
('Broly', '444.555.666-77', '(91) 99876-5432');

insert into profissional_saude(crm_coren, salario, id_unidade, id_pessoa) values
('md123', 15000.00, 1, 1),
('enf456', 6000.00, 2, 2),
('tec789', 4500.00, 3, 2),
('md321', 12000.00, 1, 1),
('md666', 20000.00, 3, 3),
('md888', 18000.00, 2, 3);

insert into paciente(debito_exames, id_pessoa) values
(500.00, 3),
(1500.00, 4),
(200.00, 7),
(800.00, 9);

alter TABLE profissional_saude
add column status_platao varchar(20) default 'indisponivel';

update profissional_saude
set status_platao = 'disponivel'
where salario > 10000.00;

select
    u.nome_unidade,
    count(ps.id_profissional) as total_profissionais,
    sum(ps.salario) as custo_total,
    avg(ps.salario) as salario_medio
from unidade u
inner join profissional_saude ps on u.id_unidade = ps.id_unidade
group by u.nome_unidade
having avg(ps.salario) > 8000.00;

select
    p.nome,
    prof.salario,
    prof.status_platao
from pessoa p
inner join profissional_saude prof on p.id_pessoa = prof.id_pessoa
where p.nome like 'g%'
ORDER BY prof.salario DESC;

select
    sum(debito_exames) as total_debitos
FROM paciente;