/*
Mão na massa: encontrando clientes sem pedidos:


Você é um(a) gerente de uma loja online e deseja identificar os clientes que fizeram pedidos e aqueles que ainda não fizeram nenhum pedido em sua loja. 
Você tem duas tabelas em seu banco de dados: "Clientes" e "Pedidos". A tabela "Clientes" contém informações sobre os clientes, enquanto a tabela "Pedidos" registra informações sobre os pedidos feitos por esses clientes. Seu desafio é encontrar os clientes que não fizeram pedidos em sua loja.

Tabela "Clientes":

ID (chave primária)
Nome
Email
Tabela "Pedidos":

ID (chave primária)
IDcliente (chave estrangeira)
DataPedido

Seu desafio é criar uma consulta SQL que retorne o nome dos clientes que ainda não fizeram pedidos em sua loja.
*/

SELECT Nome as 'Clientes sem pedidos na loja'
FROM Clientes
WHERE ID NOT IN (SELECT IDcliente FROM Pedidos);



