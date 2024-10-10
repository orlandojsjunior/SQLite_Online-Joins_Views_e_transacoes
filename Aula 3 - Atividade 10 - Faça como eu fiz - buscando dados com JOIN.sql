-- Buscando dados com JOIN
-- Durante esta aula conhecemos sobre os JOINs, que combinam colunas de uma ou mais tabelas em um banco de dados relacional.


-- INNER JOIN - Combina linhas de duas tabelas quando há uma correspondência entre as colunas especificadas.

SELECT p.ID, c.Nome
FROM pedidos p
INNER JOIN clientes c
ON p.IDCliente = c.ID;

/*Com esta consulta, estamos combinando duas tabelas, no caso, "pedidos" e "clientes", para recuperar informações sobre os pedidos e os 
clientes associados a esses pedidos.*/


-- RIGHT JOIN - Retorna todas as linhas da tabela da direita e as correspondentes da esquerda.

SELECT DISTINCT p.Nome
 FROM ItensPedidos  ip
 RIGHT JOIN  Produtos p
 ON p.ID = ip.IDProduto;

/*Retorna todos os registros da tabela de produtos que estão em algum registro da tabela de itensPedidos.*/


-- LEFT JOIN - Retorna todas as linhas da tabela da esquerda e as linhas correspondentes da tabela da direita.

SELECT C.Nome
 FROM Clientes c 
 LEFT JOIN Pedidos p 
 ON c.ID = p.IDCliente;

/*Retorna todos os registros da tabela de clientes que estão em algum registro da tabela de pedidos.*/

-- FULL JOIN - Combina as linhas de ambas as tabelas.


SELECT DISTINCT c.Nome, p.IDCliente 
FROM Clientes c 
FULL JOIN Pedidos p 
ON c.ID = p.IDCliente
/* Com esta consulta temos o resultado de todos os clientes que possuem ou não pedidos.*/