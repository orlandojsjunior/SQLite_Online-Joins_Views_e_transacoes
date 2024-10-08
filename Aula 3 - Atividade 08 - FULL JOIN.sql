-- FULL JOIN

/*
Vamos trabalhar com mais um JOIN para realizar nossas consultas.

Já conhecemos o INNER JOIN, que retorna todos os dados onde há correspondência nas duas tabelas. Ou seja, uma pessoa cliente precisa 
ter feito um pedido e um pedido precisa ter uma pessoa cliente identificada nele para que essas informações sejam retornadas.

O RIGHT JOIN retorna todos os dados da tabela da direita e apenas aqueles que correspondem na tabela da esquerda. 
O LEFT JOIN faz algo bem semelhante ao RIGHT JOIN, só que retorna todas as informações da nossa tabela da esquerda.

No entanto, temos outro JOIN que retorna tudo isso junto, que é o FULL JOIN ou FULL OUTER JOIN. Com ele, obteremos um retorno de todas as informações, 
desde que haja uma correspondência nas duas tabelas.

Por exemplo, temos pedidos e clientes. Se executarmos uma consulta, ela retornará todos os clientes, independentemente de termos realizado um pedido ou não, 
e todos os pedidos, não importa se o pedido possui um cliente associado ou não. Vamos entender na prática como o FULL JOIN funciona.

Primeiro, vamos limpar nossa aba de consulta. Em seguida, executaremos a seguinte consulta: SELECT * FROM clientes. Nossa intenção é unir a tabela de 
clientes com a de pedidos. Então, faremos o seguinte:
*/

SELECT c.nome, p.id 
FROM clientes c
FULL JOIN pedidos p
ON c.id = p.idcliente;

/*
Aqui, nós estamos trazendo o nome e o ID de nossas pessoas clientes. Ele retornará todas as pessoas clientes que possuem pedido.

Podemos até aplicar um filtro de data.
*/

SELECT c.nome, p.id 
FROM clientes c
FULL JOIN pedidos p
ON c.id = p.idcliente
WHERE strftime('%m', p.datahorapedido) = '10';

/*
Ele continuará retornando o mesmo, mas para um determinado mês. Mas o que queremos saber é se existem clientes que não realizaram 
pedidos e se existem pedidos que não têm clientes associadas a eles. Podemos usar o nosso FULL JOIN para isso e retirar o filtro momentaneamente.

Ao final dos retornos, encontraremos os clientes "Paula Souza", "João Santos" e "Carla Ferreira", que não possuem pedidos. 
E temos alguns pedidos que não possuem clientes. Interessante, não é?

Os pedidos 17, 40, 74, 100, e assim por diante, não possuem pessoas clientes associadas a eles. É dessa forma que conseguimos 
trabalhar com o FULL JOIN. Ele retornará as informações das duas tabelas desde que haja essa correspondência.

E o que seria essa correspondência? Na nossa tabela de pessoas clientes nós temos o ID, na nossa tabela de pedidos nós temos o ID. 
Podemos até utilizar o IS NULL, como fizemos na nossa consulta anterior.

Podemos colocar, por exemplo, c.id e buscar apenas os pedidos que não possuem pessoas clientes.
*/

SELECT c.nome, p.id 
FROM clientes c
FULL JOIN pedidos p
ON c.id = p.idcliente
WHERE c.id IS NULL;

/*
Assim, teremos apenas os pedidos que não possuem pessoas clientes e podemos fazer o inverso, trazendo apenas as pessoas clientes que não possuem pedido.

Temos esses quatro JOINS que podemos utilizar para executar consultas e unir informações de tabelas distintas, isto é, de duas ou mais tabelas 
que existem na nossa base de dados que possuem relação entre si.

Outra possibilidade é aproveitar todas essas informações que reunimos e gerar diversos relatórios para trazer mais informações para a gestão do 
Serenatto Café Bistrô, de maneira que ela consiga tomar decisões baseadas nos dados.
*/