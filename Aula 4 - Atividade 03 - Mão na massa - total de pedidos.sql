-- Mão na massa: total de pedidos

/*
Utilizando as tabelas de clientes, pedidos e itensPedidos do Serenatto, crie uma consulta que busque o total dos pedidos feitos por cada cliente. 
A tabela "Clientes" contém informações sobre os clientes, enquanto a tabela "Pedidos" registra informações sobre os pedidos feitos por esses clientes. 
Em ItensPedidos, você encontra as informações de quantidade vendida de cada produto e o preço unitário.

Seu desafio é criar uma consulta SQL que retorne o nome de cada cliente e o valor total dos pedidos que cada um deles comprou.
*/


-- Selecionando todas as tabelas

SELECT *
FROM clientes c
INNER JOIN Pedidos p 
ON c.id = p.idcliente
INNER JOIN itenspedidos ip
On P.id = ip.idpedido;


-- Buscando os campos necessários

SELECT c.nome, ip.precounitario
FROM clientes c
INNER JOIN Pedidos p 
ON c.ID = p.idcliente
INNER JOIN itensPedidos ip
On P.id = ip.idpedido;


-- Retornando o nome de cada cliente e o valor total dos pedidos

SELECT c.nome AS Nome_Cliente, SUM(ip.precounitario) AS Total_dos_Pedidos
FROM clientes c
INNER JOIN Pedidos p 
ON c.ID = p.idcliente
INNER JOIN itensPedidos ip
On P.id = ip.idpedido
GROUP BY c.Nome;



