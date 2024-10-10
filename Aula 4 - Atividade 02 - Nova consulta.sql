/*
Ao tentar obter o faturamento, coletamos informações dos clientes, dos pedidos e dos produtos, mas queríamos realmente o valor do faturamento. 
Observamos, então, que não tínhamos um campo que calcule o valor total dos pedidos. Surgiu, então, o desafio: será que existe a possibilidade de 
calcular esse valor sem a necessidade de modificar a estrutura de nossas tabelas? Sim, temos essa possibilidade. Agora, utilizando todos os conhecimentos 
que adquirimos, vamos criar essa consulta.

Se preferir, você pode pausar este vídeo, tentar criar a consulta que calcula o valor total do pedido e depois acompanhar como vamos desenvolvê-la!

Primeiro, renomeamos nossas abas anteriores: a de inner e right join foram nomeadas como "INNER e RIGHT JOIN.sql", e a de left e full join como "LEFT e FULL JOIN.
sql". Agora, vamos criar uma nova aba onde desenvolveremos essa consulta.

O primeiro passo é buscar na nossa tabela de pedidos e constatar que não temos nada que referencia o valor total do pedido. 
Podemos conferir também em itenspedidos, onde temos apenas a quantidade e o preço unitário.
*/

SELECT * FROM pedidos;

SELECT * FROM itenspedidos;


/*
Como desejamos o valor total do pedido e precisamos da quantidade e do preço unitário, temo s que unir essas duas tabelas utilizando o join. P
ara isso, vamos escrever SELECT * FROM pedidos e usar o join. Quando especificamos apenas join, significa que estamos usando o inner join. 
Vamos juntá-la com itenspedidos e uni-las pelo campo id.

Em seguida, vamos selecionar os campos específicos usando p.id, que é o ID do pedido, ip.quantidade, que é a quantidade de itens pedidos, e ip.precounitario, 
que é o preço de itens pedidos. Este último campo, precounitario, só existe na tabela itenspedidos, mas é importante passarmos a identificação da tabela ip 
como uma boa prática.
*/

SELECT p.id, ip.quantidade, ip.precounitario
FROM pedidos p
JOIN itenspedidos ip
ON p.id = ip.idpedido;


/*
Vamos confirmar o preço de nossos produtos. Temos a quantidade e o preço unitário, mas será que esse preço unitário é o preço da unidade, que veio 
diretamente da tabela de produtos, ou já é da quantidade de unidades, multiplicado pela quantidade de unidades que estamos informando do produto? 
Vamos descobrir agora.

Para isso, faremos mais um join, desta vez com a nossa tabela de produtos. Vamos unir essa tabela usando o ID do produto e buscar o ID do produtos 
em itenspedidos. O campo que queremos é o preço, então precisamos passar pr.preco para o SELECT.
*/

SELECT p.id, ip.quantidade, ip.precounitario, pr.preco
FROM pedidos p
JOIN itenspedidos ip ON p.id = ip.idpedido
JOIN produtos pr ON pr.id = ip.idproduto;


/*
Nas primeiras linhas já conseguimos identificar que o preço unitário tem uma multiplicação. Portanto, temos a quantidade e o preço unitário já calculados. 
Isso facilita um pouco o nosso trabalho.

Para tornar a visualização mais simples, vamos inverter a ordem das colunas precounitario e preco.
*/

SELECT p.id, ip.quantidade, pr.preco, ip.precounitario 
FROM pedidos p
JOIN itenspedidos ip ON p.id = ip.idpedido
JOIN produtos pr ON pr.id = ip.idproduto;

/*
Já temos o valor multiplicado, mas não precisamos exibir a quantidade e nem o preço que vem da nossa tabela de produtos. 
O que queremos, agora, são os dados do cliente que fez determinado pedido.

Pensando nisso, faremos uma modificação. Primeiro, vamos remover o join que fizemos com o produto. Em seguida, pegamos a tabela 
de clientes e fazemos um join com c.id e p.idcliente. No SELECT, incluímos o campo c.nome, que corresponde ao nome do cliente.
*/

SELECT p.id, c.nome, ip.precounitario 
FROM clientes c
JOIN pedidos p ON c.id = p.idcliente
JOIN itenspedidos ip ON p.id = ip.idpedido;


/*
O preço unitário corresponde ao valor já multiplicado, mas precisamos, agora, unir esses valores, ou seja, somá-los. Para isso, usaremos a 
função de agregação, soma, o SUM.

Então, em SELECT, vamos passar o SUM() de ip.precounitario. Como estamos usando o SUM, automaticamente sabemos que precisamos agrupar esse valor, ou seja, 
usar o groupBy. Isso, porque, ao invés de nossas linhas separadas, queremos agrupar esse valor por id. Portanto, usamos GROUP BY e passamos p.id e c.nome.
*/

SELECT p.id, c.nome, SUM(ip.precounitario)
FROM clientes c
JOIN pedidos p ON c.id = p.idcliente
JOIN itenspedidos ip ON p.id = ip.idpedido
GROUP BY p.id, c.nome;


/*
Conseguimos buscar exatamente a informação que precisávamos. Podemos até colocar um alias informando que SUM(ip.precounitario) corresponde a ValorTotalPedido.
*/

SELECT p.id, c.nome, SUM(ip.precounitario) AS Valor_Total_Pedido
FROM clientes c
JOIN pedidos p ON c.id = p.idcliente
JOIN itenspedidos ip ON p.id = ip.idpedido
GROUP BY p.id, c.nome;

/*
Essa consulta que calcula o valor total dos pedidos será executada com muita frequência. Isso, porque, não temos esse campo fisicamente 
criado na nossa tabela. Pensando nisso, será que existe uma forma de simplificar o trabalho dos gestores e o nosso ao criar uma forma de armazenar 
essa consulta diretamente em nosso banco de dados?
*/