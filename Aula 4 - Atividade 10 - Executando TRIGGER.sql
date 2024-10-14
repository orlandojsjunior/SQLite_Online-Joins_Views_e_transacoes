/*
Agora, vamos inserir novos dados nas tabelas de pedidos e itenspedidos, já que a nossa trigger só é acionada quando 
inserirmos novos registros. Para isso, vamos abrir uma nova aba e executar os seguintes comandos de SELECT:
*/

SELECT * FROM FaturamentoDiario;

SELECT * FROM pedidos;

SELECT * FROM itenspedidos;


/*
Note que o último registro de FaturamentoDiario é do dia 06.10.2023, no valor de 58. Já nas tabelas pedidos e itenspedidos, 
o último registro é do ID 450. Vamos inserir um novo pedido na tabela pedidos, de ID 451, usando o comando de INSERT:
*/

INSERT INTO Pedidos(ID, IDCliente, DataHoraPedido, Status)
VALUES (451, 27, '2023-10-07 14:30:00', 'Em Andamento');


/*
Após executar essa inserção, podemos checar novamente a tabela de pedidos. Agora, o último registro de pedidos possui o ID 451. 
Já o último registro de FaturamentoDiario continua sendo do dia 06.10.2023, no valor de 58. Isso ocorre porque o gatilho só será 
acionado quando inserirmos em itenspedidos. Portanto, vamos fazer isso.
*/

INSERT INTO ItensPedidos(IDPedido, IDProduto, Quantidade, PrecoUnitario)
VALUES (451, 14, 1, 6.0),
         (451, 13, 1, 7.0);
         
/*
Após executar essa inserção, podemos checar a tabela itenspedidos. Agora, o último registro possui o ID 451. 
Já o último registro de FaturamentoDiario é do dia 07.10.2023, no valor de 13. Portanto, o nosso gatilho está funcionando.

Sempre que um novo pedido for inserido, automaticamente esse valor vai aparecer na nossa tabela de FaturamentoDiario, 
o que será muito interessante para ajudar nossos gestores, porque eles terão acesso a essa informação à mão.

Vamos inserir outro registro, primeiro em pedidos, depois em itenspedidos:
*/

INSERT INTO Pedidos (ID, IDCliente, DataHoraPedido, Status) 
VALUES (452, 28, '2023-10-07 14:35:00', 'Em Andamento');


INSERT INTO ItensPedidos (IDPedido, IDProduto, Quantidade, PrecoUnitario) 
VALUES (452, 10, 1, 5.0),
         (452, 31, 1, 12.50);
         

-- Feito isso, vamos para a nossa tabela de FaturamentoDiario. Ao final dela, temos, agora, o valor de 30.5.

SELECT * FROM FaturamentoDiario;


/*
Conhecemos diversos recursos da linguagem SQL que podemos utilizar para facilitar o dia a dia dos gestores, 
das pessoas que precisam tomar decisões dentro de um negócio. Agora que conseguimos calcular o faturamento diário do Serenatto Café e Bistrô, 
acreditamos que os gerentes desse empreendimento ficarão felizes por terem essa informação em mãos.

Além de buscar todas essas informações, precisamos saber montar as consultas e deixar os dados atualizados dentro das tabelas. 
É o que aprenderemos na sequência!
*/