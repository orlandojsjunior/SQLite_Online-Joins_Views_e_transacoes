SELECT * FROM produtos;

-- Vamos usar o comando Insert para adicionar ao catálogo da Serenatto Café e Bistrô a lasanha à bolonhesa.

INSERT INTO Produtos (
    ID, 
    Nome,  
    Descricao,                  
    Preco, 
    Categoria
)
VALUES 
    (31, 'Lasanha à Bolonhesa', 'Deliciosa lasanha caseira com molho bolonhesa', 12.50, 'Almoço');


SELECT * FROM produtos
WHERE nome = 'Lasanha à Bolonhesa'; -- Verificando o resultado


-- Identificar quais produtos foram ou não vendidos.

SELECT * FROM produtos;

SELECT * FROM itenspedidos;

/*
Selecionamos e temos como retorno o id do pedido, o id do produto, quantidade e preço unitário. O que precisamos exatamente é o nosso idproduto. 
Para executar essa nossa nova consulta, vamos utilizar uma nova cláusula JOIN, a cláusula RIGHT JOIN. 
Com ela, vamos trazer todos os registros da nossa tabela da direita e apenas aqueles que corresponderem na tabela da esquerda.

Neste caso, se usássemos INNER JOIN, nosso produto não apareceria, mesmo estando na tabela de produtos.

Mas, ao que se referem as tabelas da direita e esquerda? Antes do RIGHT JOIN, nossa cláusula, temos uma tabela itenspedidos.
*/


SELECT *
FROM itenspedidos 
RIGHT JOIN produtos;


/*
Após a cláusula JOIN, temos outra chamada produtos. Assim, considerarmos a tabela da esquerda como a que vem antes da nossa cláusula JOIN, neste caso,
 itenspedidos, e a tabela da direita como a que vem após a cláusula JOIN, que é a nossa tabela de produtos. Dessa forma, identificamos esquerda e direita.

Vamos trazer todos os produtos e apenas as linhas que corresponderem à nossa tabela de itenspedidos. 
Se o retorno for vazio, significa que o produto não tem vendas. É isso que vamos identificar agora. Vamos buscar o nome do nosso produto e o id do produto.
*/


SELECT pr.nome, ip.idproduto, ip.idpedido
FROM itenspedidos ip
RIGHT JOIN produtos pr
ON pr.id = ip.idproduto;
 
/*
Ele nos traz todas as informações, porque vai trazer todos os itens. Trará o id do produto e o id do pedido ao qual esse item pertence. 
No final, temos a informação exata: o nome da lasanha à bolonhesa, porque ela veio da tabela de produtos, 
mas se observarmos as informações que vêm de itenspedidos, há a indicação de "NULL", porque a lasanha à bolonhesa não existe na nossa tabela de itenspedidos.

Temos todas as informações da tabela da direita e apenas as que correspondem à tabela da esquerda.

Já sabíamos que a lasanha à bolonhesa não estaria em itenspedidos, porque ela não tinha sido vendida ainda, mas, 
será que conseguimos aplicar o filtro que já utilizamos anteriormente em clientes, quando fizemos as subconsultas, 
para saber se há produtos que não foram vendidos em um determinado mês?

A resposta é sim, mas, agora, vamos usar um recurso que já conhecemos: as subconsultas. 
O motivo é que a data e a hora do nosso pedido estão em outra tabela, de pedidos.
*/

SELECT * FROM pedidos;


/*
Precisamos também trazer a nossa tabela de pedidos para a nossa junção. Vamos usar a subconsulta. 
Vamos montá-la agora para entendermos. Vamos fazer essa junção como outra tabela. O primeiro passo é abrir e fechar parênteses e informar um novo SELECT.
*/

SELECT * FROM pedidos;

SELECT pr.nome,  ip.idproduto,  ip.idpedido 
FROM
    (SELECT * 
      FROM )
itenspedidos ip

RIGHT JOIN produtos pr
ON pr.id = ip.idproduto;

-- Vamos trazer pedidos e usar o INNER JOIN, que também podemos chamar de JOIN. Em seguida, passaremos ON p.id = ip.idpedidos.

SELECT * FROM pedidos

SELECT pr.nome,  ip.idproduto,  ip.idpedido 
FROM(
    (SELECT * 
      FROM pedidos p
      JOIN itenspedidos ip
      ON p.id = ip.idpedidos)

RIGHT JOIN produtos pr
ON pr.id = ip.idproduto;


-- Como queremos uma informação específica, aplicaremos o WHERE, especificando exatamente os campos que queremos trazer ip.id pedido, e ip.id produto`.

SELECT pr.nome,  ip.idproduto,  ip.idpedido 
FROM(
    SELECT *
    FROM pedidos p
    JOIN itenspedidos ip 
    ON p.id = ip.idpedido
    WHERE strftime('%m', p.DataHoraPedido) = '10' ) 
        
RIGHT JOIN produtos pr
ON pr.id =  x.idproduto;


/*
Executado o código, obteremos exatamente isso: idpedido e idproduto. Agora, vamos fazer a junção com a nossa tabela de produtos. 
Vamos dar o nome de x para a subconsulta. E onde antes referenciávamos a tabela de itenspedidos, 
vamos referenciar com a nossa tabela montada através das subconsultas.
*/

SELECT pr.nome,  x.idproduto,  x.idpedido 
FROM(
    SELECT ip.idpedido, ip.idproduto
    FROM pedidos p
    JOIN itenspedidos ip 
    ON p.id = ip.idpedido
    WHERE strftime('%m', p.DataHoraPedido) = '10' ) x
RIGHT JOIN produtos pr
ON pr.id =  x.idproduto;

/*
Agora, podemos executar toda a nossa consulta. Obtemos apenas os produtos do mês 10 (outubro). 
Com a consulta, conseguimos saber que além da lasanha à bolonhesa, temos o omelete, o muffin e o croissant de amêndoa não foram pedidos no mês de outubro.

Dessa forma, criamos uma consulta que facilita o trabalho da gestão, possibilitando, por exemplo, 
que consigam identificar por que determinado produto não foi vendido em um determinado mês.
*/