Disciplina: Manipulação de Dados / Banco de Dados II
Professor: Aguinaldo Neto

Atividade Prática: Gestão de Clínica 
1. Preparação do Ambiente (DDL)
Crie as tabelas base para suportar o ecossistema da clínica.

1.1. Carga Inicial de Dados (DML)
Insira os registros para que o banco tenha informações antes da alteração estrutural.

Tabela unidade: Valores ('Cardiologia'), ('Pronto Atendimento'), ('Oncologia');

Tabela pessoa: Valores ('Dr. Goku, '111', '9999-0001'), -- Profissional 
('Enf. Buma, '222', '9999-0002'), -- Profissional 
('Vegeta, '333', '9999-0003'), -- Profissional e Paciente 
('Piccolo, '444', '9999-0004'), -- Paciente 
('Dra. Videl, '555', '9999-0005'), -- Profissional 
('Dr. Gohan', '666', '9999-0006'),-- Profissional 
('Trunks, '777', '9999-0007'), -- Paciente 
('Majin Boo, '888', '9999-0008'), -- Profissional 
(Broly, '999', '9999-0009'); -- Paciente


Tabela profissional: Valores ('MD123', 15000.00, 1, 1), -- Goku (Cardio) 
('ENF456', 6000.00, 2, 2), -- Buma (PA) 
('TEC789', 4500.00, 3, 2), -- Vegeta (PA) 
('MD555', 12000.00, 5, 1), -- Videl (Cardio) 
('MD666', 20000.00, 6, 3), -- Gohan (Onco) 
('MD888', 18000.00, 8, 3); -- Majin Boo (Onco)

Tabela paciente: Valores (250.00, 3), -- Vegeta 
(1200.00, 4), -- Piccolo 
(3500.00, 7), -- Trunks
(50.00, 9); -- Broly

2. Manutenção Pós-Carga (ALTER & UPDATE)
Com os dados no sistema, aplicamos a nova regra de negócio:-- Adicionando a coluna de status_plantao com o padrão 'Indisponível';-- Atualizando status baseado no salário (Regra de Negócio) status_plantao = 
'Disponível', se o  salario for maior que 10000.00;

3. Desafios de Consulta (SQL Avançado)
Agora que temos mais volume de dados, execute estes desafios:
3.1 Relatório de Custos por Unidade (Agregação Completa)
Exiba o nome da unidade, quantos profissionais trabalham nela, a soma dos 
salários e a média salarial. Filtre apenas unidades com média acima de 
8000.00.

3.2 O "Mapa de Dívidas" dos Profissionais
A clínica quer saber quais profissionais também devem exames como 
pacientes.
Escreva uma consulta SQL que identifique todos os indivíduos que possuem 
vínculos ativos tanto na tabela de profissionais quanto na tabela de 
pacientes. O relatório final deve exibir:
 O nome completo do colaborador (oriundo da tabela de pessoas);
 O seu registro profissional (CRM/COREN);
 O valor total do seu débito atual com exames.

3.3 Filtro de Texto Especializado 
 Liste todos os profissionais cujo nome comece com a letra "G", 
mostrando seus salários e status de plantão, ordenados do maior para o 
menor salário.

3.4. Visão Geral de Arrecadação
 Calcule o valor total que a clínica tem para receber de todos os 
pacientes