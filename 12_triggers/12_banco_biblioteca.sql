create database Biblioteca;
use Biblioteca;

create table Livro (
    id int primary key auto_increment,
    titulo varchar(255) not null,
    autor varchar(255) not null,
    isbn varchar(255) not null,
    quantidade int not null,
    data_cadastro datetime 
);

create table emprestimo (
    id int primary key auto_increment,
    id_livro int,
    nome_usuario varchar(255) not null,
    data_emprestimo datetime,
    data_devolucao datetime,
    foreign key (id_livro) references Livro(id)
);

create table historico (
    id int,
    titulo varchar(255) not null,
    autor varchar(255) not null,
    isbn varchar(255) not null,
    data_remocao datetime,
    motivo varchar(255) not null
);

delimiter //
create trigger trg_data_cadastro before insert on Livro
for each row
begin
    set new.data_cadastro = now();
end;    
delimiter ;

delimiter //
create trigger trg_baixa_estoque before insert on emprestimo
for each row
begin
    set New.data_emprestimo = now();
    update Livro set quantidade = quantidade - 1 where id = New.id_livro;
end//
delimiter ;

delimiter //
create trigger trg_historico_remocao before delete on Livro
for each row
begin
    insert into historico (id, titulo, autor, isbn, data_remocao, motivo)
    values (old.id, old.titulo, old.autor, old.isbn, now(), 'Descartado');
end//
delimiter ;

insert into Livro (titulo, autor, isbn, quantidade) values ('O Senhor dos Anéis', 'J.R.R. Tolkien', '978-0544003415', 5),
('A Guerra dos Tronos', 'George R.R. Martin', '978-0553593716', 4);

insert into emprestimo (id_livro, nome_usuario) values 
(1, 'João Silva'), 
(2, 'Maria Oliveira');

delete from Livro where id = 1;

select * from Livro;

select * from emprestimo;

select * from historico;