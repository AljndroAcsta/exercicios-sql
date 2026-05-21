CREATE DATABASE faculdade_db;
use faculdade_db;

CREATE TABLE alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    curso VARCHAR(50) NOT NULL
);

CREATE TABLE disciplinas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    carga_horaria INT NOT NULL
);

INSERT INTO alunos (nome, email, data_nascimento, curso) VALUES
('João Silva', 'joao.silva@email.com', '2004-01-01', 'Engenharia de Software'),
('Huan Oliveira', 'huan.oliveira@email.com', '2006-05-15', 'Ciência da Computação'),
('Franco Tales', 'franco.tales@email.com', '2005-12-10', 'Administração'),
('Victor Hugo', 'victor.hugo@email.com', '2001-03-20', 'Automação Industrial');

INSERT INTO disciplinas (nome, codigo, carga_horaria) VALUES
('Engenharia de Software', 'AED101', 60),
('Ciência da Computação', 'BD102', 45),
('Administração', 'RC103', 50),
('Automação Industrial', 'SO104', 55);

SELECT * FROM alunos;
SELECT nome, curso FROM alunos;
SELECT * FROM disciplinas WHERE carga_horaria > 60;

UPDATE alunos 
SET curso = 'Engenharia de Software' 
WHERE nome = 'Franco Tales';

UPDATE disciplinas
SET carga_horaria = 65 
WHERE nome = 'Engenharia de Software';

DELETE FROM alunos 
WHERE nome = 'Victor Hugo';