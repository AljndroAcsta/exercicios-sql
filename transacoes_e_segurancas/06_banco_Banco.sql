CREATE DATABASE Banco;
USE Banco;

create table contas (
    id int primary key auto_increment,
    nome varchar(255) not null,
    saldo decimal(10,2) not null
);

insert into contas (nome, saldo) values 
('Lady Gaga', 1000.00),
('Bob Marley', 500.00),
('Katy Perry', 1500.00);

update contas set saldo = saldo + 250 
where nome = 'Lady Gaga';

-- Pensei em buscar em como fazer uma logica ja 
-- que dois transtion nao me chamaram a atencao,
-- entao busquei em como criar disparadores com os,
-- delimiter que ja tinha visto conteudos usando eles.
DELIMITER $$
CREATE PROCEDURE TransferenciaKatyParaBob()
BEGIN
    DECLARE linhas_saque INT DEFAULT 0;
    DECLARE linhas_deposito INT DEFAULT 0;
    START TRANSACTION;

    UPDATE Contas SET Saldo = Saldo - 300.00 
    WHERE Nome = 'Katy Perry' AND Saldo >= 300.00;
    
    SET linhas_saque = ROW_COUNT();
    UPDATE Contas SET Saldo = Saldo + 300.00 
    WHERE Nome = 'Bob Marley';

    SET linhas_deposito = ROW_COUNT();
    IF (linhas_saque + linhas_deposito) = 2 THEN
        COMMIT;
        SELECT 'Sucesso: Transferência de 300.00 da Katy Perry para o Bob Marley realizada' AS Resultado;
    ELSE
        ROLLBACK;
        SELECT 'Erro: Transferência cancelada. Saldo insuficiente ou cliente não encontrado.' AS Resultado;
    END IF;
END $$
DELIMITER ;
CALL TransferenciaKatyParaBob();

delete from contas where nome = 'Bob Marley';

select * from contas where saldo >= 1000.00;

select * from contas order by saldo desc;