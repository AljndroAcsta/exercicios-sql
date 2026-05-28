create database Sp;
use Sp;

create table clientes (
    id int auto_increment primary key,
    nome varchar(255) not null,
    data_nascimento date not null
);

insert into clientes (nome, data_nascimento) values
('Aguinaldo Neto', '1986-08-02'),
('Nicolas Padilha', '2018-07-31'),
('Anderson Silva', '2005-03-15'),
('Joao Felix', '1990-11-22');


delimiter $$
create  procedure idade (in p_id int, out p_idade int)
    begin
    select (year(curdate()) - year(data_nascimento)) 
    into p_idade
    from clientes
    where id = p_id;
end $$
delimiter ;

delimiter $$
create procedure menormaior (
    in p_id int,
    out p_idade int,
    out p_classificacao varchar(20)
)
begin
    select (year(curdate()) - year(data_nascimento)) into p_idade
    from clientes
    where id = p_id;
    if p_idade >= 18 then 
        set p_classificacao = 'maior';
    else 
        set p_classificacao = 'menor';
    end if;
end $$
delimiter ;

call menormaior(1, @idade, @classificacao);
select 1 as id, 'aguinaldo neto' as nome, @idade as idade, @classificacao as classificacao;

call menormaior(2, @idade, @classificacao);
select 2 as id, 'nicolas padilha' as nome, @idade as idade, @classificacao as classificacao;

call menormaior(3, @idade, @classificacao);
select 3 as id, 'anderson silva' as nome, @idade as idade, @classificacao as classificacao;

call menormaior(4, @idade, @classificacao);
select 4 as id, 'joao felix' as nome, @idade as idade, @classificacao as classificacao; 


--percebi que poderia ter eros na hora de calcular a idade
--por conta dos meses, entao fiz uma correçao para calcular
--a idade de forma mais precisa.COMMENT

delimiter $$ 
create procedure menormaior_pr(
    in p_id int,
    out p_idade int,
    out p_classificacao varchar(20)
)
begin
    select timestampdiff(year, data_nascimento, curdate()) into p_idade
    from clientes
    where id = p_id;
    if p_idade >= 18 then 
        set p_classificacao = 'maior';
    else 
        set p_classificacao = 'menor';
    end if;
end $$
delimiter ;

call menormaior_pr(1, @idade, @classificacao);
select 1 as id, 'aguinaldo neto' as nome, @idade 
as idade, @classificacao as classificacao; 