Disciplina: Manipulação de Dados / Banco de Dados II
Professor: Aguinaldo Neto

DL (Data Definition Language): Crie o esquema do banco de dados contendo as tabelas profissao, cidade, paciente, medico, especializacao, convenio, medEsp, consulta, medicamento e cons_medicame, respeitando as restrições de integridade.

DML (Data Manipulation Language): Insira os registros fornecidos no dicionário para todas as tabelas, garantindo que os relacionamentos entre pacientes, médicos, consultas e convênios sejam mantidos.

Estrutura (Dicionário de Dados)
profissao (codigo, area, nome)
cidade (codigo, nome, UF)
paciente (codigo, nome, email, idade, fone, codProf, codCid)
codProf REFERENCIA profissao (codigo)
codCid REFERENCIA cidade (codigo)
medico (codigo, nome, email, CRM, codCid)
codCid REFERENCIA cidade (codigo)
especializacao (codigo, nome, area)
convenio (codigo, nome)
medEsp (codEsp, codMed)
codEsp REFERENCIA especializacao (codigo)
codMed REFERENCIA medico (codigo)
consulta (data, hora, codPac, codMed, valor, codconv)
codPac REFERENCIA paciente (codigo)
codMed REFERENCIA medico (codigo)
codConv REFERENCIA convenio (codigo)
medicamento (codigo, descricao)
cons_medicame (data, hora, codPac, codMedica)
codMedica REFERENCIA medicamento (codigo)
(data, hora, codPac) REFERENCIA consulta (data, hora, codPac)

Parte 2: Desenvolvimento de Camadas de Consulta (Views)
Desenvolva as seguintes consultas/views no SQL para extrair informações do sistema:
View 1: Identificar a data que representa o dia com o maior valor total arrecadado com consultas (o valor total não deve aparecer no resultado final).

View 2: Retornar apenas o nome do paciente mais jovem cadastrado na clínica.

View 3: Recuperar a data e o horário da consulta que possui o maior valor unitário (o valor da consulta não deve ser exibido).

View 4: Listar a data e hora de todas as consultas realizadas, juntamente com o nome do convênio utilizado. Devem ser listadas todas as consultas, mesmo as que não possuem convênio associado.

View 5: Exibir a data das consultas e a descrição dos medicamentos prescritos. A listagem deve incluir consultas sem prescrição e os resultados devem estar em ordem alfabética pela descrição do medicamento.

View 6: Listar o nome dos pacientes e as datas de suas consultas realizadas antes do ano de 2026. Pacientes sem consultas nesse período também devem constar no relatório.

View 7: Apresentar o nome, email e idade dos pacientes, acompanhados da quantidade total de consultas realizadas por cada um. Incluir pacientes com zero consultas e ordenar pela quantidade.

View 8: Gerar um relatório com o nome e telefone dos pacientes e o valor total acumulado gasto em consultas. Pacientes sem gastos devem aparecer com valor zero, e o resultado deve ser ordenado pelo montante total.