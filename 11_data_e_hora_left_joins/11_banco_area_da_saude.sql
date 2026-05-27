create database areaDaSaude;
use areaDaSaude;

create table profissao (
    id_profissao int primary key auto_increment,
    nome varchar(255) not null,
    area varchar(255) not null
);

create table cidade (
    id_cidade int primary key auto_increment,
    nome varchar(255) not null,
    uf varchar(2) not null
);

create table paciente (
    id_paciente int primary key auto_increment,
    nome varchar(255) not null,
    idade int(3) not null,
    codProf int,
    codCid int,
    foreign key (codProf) references profissao(id_profissao),
    foreign key (codCid) references cidade(id_cidade)
);

create table medico (
    id_medico int primary key auto_increment,
    nome varchar(255) not null,
    crm varchar(20) not null,
    codCid int,
    foreign key (codCid) references cidade(id_cidade)
);

create table especialidade (
    id_especialidade int primary key auto_increment,
    nome varchar(255) not null,
    area varchar(255) not null
);

create table convenio (
    id_convenio int primary key auto_increment,
    nome varchar(255) not null
);

create table medEspecialidade (
    id_medEspecialidade int primary key auto_increment,
    codMed int,
    codEspe int,
    foreign key (codMed) references medico(id_medico),
    foreign key (codEspe) references especialidade(id_especialidade)
);

create table consulta (
    data_consulta date not null,
    hora_consulta time not null,
    valor decimal(10,2) not null,
    codConv int,
    codProf int,
    codPac int,
    primary key (data_consulta, hora_consulta, codProf, codPac),
    foreign key (codConv) references convenio(id_convenio),
    foreign key (codProf) references profissao(id_profissao),
    foreign key (codPac) references paciente(id_paciente)
);

create table medicamento (
    id_medicamento int primary key auto_increment,
    descricao text
);

create table cons_medicamento (
    data date not null,
    hora time not null,
    codPac int,
    codMed int,
    primary key (data, hora, codPac, codMed),
    foreign key (codPac) references paciente(id_paciente),
    foreign key (codMed) references medicamento(id_medicamento)
);

insert into profissao (nome, area) values 
('Medcina', 'Medico'),
('Odontologia', 'Dentista'),
('Psicologia', 'Psicologo'),
('Enfermagem', 'Enfermeiro'),
('Fisioterapia', 'Fisioterapeuta');

insert into cidade (nome, uf) values 
('Manaus', 'Am'),
('Boa vista', 'RR'),
('Cruzeiro do Sul', 'AC'),
('Coari', 'AM'),
('Rio Branco', 'AC');

insert into paciente (nome, idade, codProf, codCid) values 
('Joao Gomez', 21, 1, 1),
('Maria Silva', 35, 2, 2),
('Carlos Santos', 28, 3, 3),
('Ana Oliveira', 42, 4, 4),
('Pedro Costa', 30, 5, 5);

insert into medico (nome, crm, codCid) values 
('Dr. Lucas', '12345', 1),
('Dra. Fernanda', '67890', 2),
('Dr. Rafael', '54321', 3),
('Dra. Camila', '98765', 4),
('Dr. Bruno', '11223', 5);

insert into especialidade (nome, area) values 
('Pediatria', 'Saude Infantil'),
('Urologia', 'Saude Masculina'),
('Psicologia', 'Saude Mental'),
('Cardiologia', 'Saude do Coracao');

insert into convenio (nome) values 
('Unimed'),
('Bradesco Saude'),
('Amil'),
('Hapvida'),
('Sulamerica');

insert into medEspecialidade (codMed, codEspe) values 
(1, 3),
(2, 1),
(3, 1),
(3, 2),
(4, 2),
(4, 4);

insert into consulta (data_consulta, hora_consulta, valor, codConv, codProf, codPac) values 
('2024-01-15', '10:00:00', 150.00, 1, 1, 1),
('2024-01-16', '14:30:00', 200.00, 2, 2, 2),
('2024-01-17', '09:00:00', 250.00, 3, 3, 3),
('2024-01-18', '11:15:00', 300.00, 4, 4, 4),
('2024-01-19', '16:45:00', 350.00, 5, 5, 5);

insert into medicamento (descricao) values 
('Paracetamol 500mg'),
('Ibuprofeno 200mg'),
('Amoxicilina 250mg'),
('Dipirona 500mg'),
('Captopril 25mg'),
('Losartana 50mg'),
('Metformina 850mg'),
('Omeprazol 20mg'),
('Simvastatina 20mg'),
('Aspirina 100mg');

insert into cons_medicamento (data, hora, codPac, codMed) values 
('2024-01-15', '10:30:00', 1, 1),
('2024-01-16', '15:00:00', 2, 2),
('2024-01-17', '09:30:00', 3, 3),
('2024-01-18', '11:45:00', 4, 4),
('2024-01-19', '17:00:00', 5, 5);

select data_consulta
from consulta
group by data_consulta
order by sum(valor) desc
limit 1;

select nome
from paciente
order by idade asc
limit 1;

select data_consulta, hora_consulta
from consulta
order by valor desc
limit 1;

select c.data_consulta, c.hora_consulta, conv.nome as nome_convenio
from consulta c
left join convenio conv on c.codConv = conv.id_convenio;

select c.data_consulta, m.descricao as medicamento
from consulta c
left join cons_medicamento cm on c.data_consulta = cm.data and c.hora_consulta = cm.hora and c.codPac = cm.codPac
left join medicamento m on cm.codMed = m.id_medicamento
order by m.descricao asc;

select p.nome, c.data_consulta
from paciente p
left join consulta c on p.id_paciente = c.codPac and year (c.data_consulta) < 2026;

select p.nome, p.idade, count(c.codPac) as total_consultas
from paciente p
left join consulta c on p.id_paciente = c.codPac
group by p.id_paciente, p.idade;

select 
    p.nome, 
    p.idade, 
    c.data_consulta,
    c.hora_consulta,
    m.descricao as medicamento
from paciente p
left join consulta c on p.id_paciente = c.codPac
left join cons_medicamento cm on c.data_consulta = cm.data and c.hora_consulta = cm.hora and c.codPac = cm.codPac
left join medicamento m on cm.codMed = m.id_medicamento;