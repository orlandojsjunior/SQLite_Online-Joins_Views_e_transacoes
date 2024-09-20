-- Aula 3 - Atividade 02 - INNER JOIN

/*
Já buscamos informações de colaboradores e fornecedores, assim como informações mais específicas, como a quantidade de clientes que realizaram pedidos em um mês, 
e também descobrimos os produtos que têm o preço maior do que a média de todos os produtos juntos. Agora, vamos pesquisar outras informações em nossa base de dados.

Também queremos informações de outra tabela, a tabela de pedidos. Precisamos das informações que existem nas duas tabelas: o nome, que está na tabela de clientes, 
e da tabela de pedidos, queremos o ID do pedido, a data e hora. Ou seja, queremos identificar, pelo nome, qual cliente realizou cada pedido em nossa tabela, 
não especificamente de um mês, mas de todos os pedidos.

Já sabemos que entre clientes e pedidos há uma ligação, logo, usando essa relação, conseguiremos unir essas tabelas e trazer as informações que precisamos. 
Para isso, vamos utilizar uma nova cláusula, a cláusula JOIN. Com o JOIN, realizamos junções entre colunas de tabelas distintas. Neste caso específico, 
usaremos a cláusula INNER JOIN.
*/

SELECT * FROM clientes 

SELECT * FROM pedidos 

SELECT * 
FROM clientes c 
INNER JOIN pedidos p 

/*
A diferença entre JOIN e "Subconsultas" é:

 - Em "Subconsultas", consultamos dados da mesma tabela e usamos o id de clientes e pedidos, mas em nenhum momento criamos uma obrigatoriedade de que esses campos 
existissem para que conseguíssemos trazer as informações da tabela.

- No JOIN , precisamos que os campos que fazem a relação entre as duas tabelas existam, obrigatoriamente. Isso é necessário porque queremos que o JOIN nos traga o nome dos clientes, 
onde o ID que está na tabela de clientes seja igual ao ID que está na tabela de pedidos.
Portanto, com o INNER JOIN, retornamos apenas os pedidos e os clientes que correspondem. Se houver um pedido sem cliente, ele não retorna, e se o cliente não tiver pedido, ele também não retorna.

Vamos executar a consulta:
*/

SELECT * 
FROM clientes c 
INNER JOIN pedidos p 
ON c.id = p.idcliente;

/*
O retorno contém todos os dados dos clientes e todos os dados de pedidos. Agora, queremos algumas informações mais específicas: o nome do cliente, que está na tabela de pedidos,
o ID do pedido, a data e hora que esse pedido foi feito. Não referenciamos e vamos testar se vai funcionar.
*/

SELECT nome, id, p.datahorapedido 
FROM clientes c 
INNER JOIN pedidos p 
ON c.id = p.idcliente;

/*
O código não foi executado. Ao trabalhar com JOIN, é importante sempre referenciar os campos, ou seja, indicar de qual tabela cada campo virá. No nosso caso, 
sabemos que o campo "nome" só existe na tabela de clientes, logo, podemos referenciá-lo como c.nome.

Também sabemos que "data" e "hora" só existem na tabela de pedidos, mas vamos referenciá-las como p.datahorapedido.
*/

SELECT c.nome, p.id, p.datahorapedido 
FROM clientes c 
INNER JOIN pedidos p 
ON c.id = p.idcliente;