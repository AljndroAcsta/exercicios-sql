# Portfólio de Banco de Dados e SQL

Este repositório documenta a minha evolução e os exercícios práticos desenvolvidos na disciplina de **Manipulação de Dados / Banco de Dados II**.

## O que Elaboramos e Implementamos

Ao longo de diversas atividades, elaboramos estruturas completas de bancos de dados relacionais a partir do zero, evoluindo desde a modelagem lógica até a extração de inteligência de negócios. Implementamos sistemas baseados em cenários reais e fictícios, incluindo:

* **Gestão de E-commerce (TecnoStore):** Criação de views gerenciais para controle de estoque, desempenho de fornecedores e faturamento.
* **Sistema Hospitalar / Clínica:** Múltiplos joins e relatórios complexos mapeando unidades, profissionais e pacientes.
* **Sistema Bancário:** Implementação de segurança transacional para transferências financeiras.
* **Universos Fictícios (Terra Média e Game of Thrones):** Carga massiva de dados e agrupamentos complexos.

## Resumo de Funções e Operadores Utilizados

### Fundamentos (DDL e DML)
* `CREATE TABLE` / `ALTER TABLE`
* Restrições: `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `UNIQUE`
* `INSERT INTO`, `UPDATE`, `DELETE`

### Consultas e Filtros (DQL)
* `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`
* Filtros avançados: `LIKE`, `BETWEEN`
* Operações de Conjunto: `UNION`, `UNION ALL`

### Relacionamentos e Agrupamentos
* Junções: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
* Agrupamentos: `GROUP BY` com filtro matemático `HAVING`
* Funções Agregadas: `SUM()`, `AVG()`, `COUNT()`, `MIN()`, `MAX()`

### Objetos Avançados e Segurança
* **Views:** Criação de relatórios virtuais dinâmicos.
* **Stored Procedures:** Automação com parâmetros `IN`/`OUT` e lógica condicional `IF/ELSE`.
* **Transações (TCL):** Controle financeiro seguro com `START TRANSACTION`, `COMMIT` e `ROLLBACK`.
