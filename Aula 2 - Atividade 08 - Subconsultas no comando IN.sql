-- Aula 2 - Atividade 08 - Subconsultas no comando IN

SELECT nome, telefone 
FROM clientes 
WHERE ID = (
    SELECT idcliente 
    FROM pedidos 
    WHERE datahorapedido = '2023-01-02 08:15:00');

SELECT idcliente FROM pedidos WHERE datahorapedido = '2023-01-02 08:15:00'

/*
Até agora, criamos uma subconsulta que traz uma única informação, a informação da pessoa cliente que realizou o primeiro pedido, que é Ana Maria Silva.

Os gestores querem entrar em contato e agradar essa cliente, dando um mimo para incentivá-la a retornar ao estabelecimento, mesmo ela sendo uma cliente frequente. 
Isso é uma forma de cada vez mais agradar o cliente e incentivá-lo a frequentar o Serenatto Café & Bistrô.

Agora, ao invés de trazer um único registro de retorno, queremos trazer uma informação mais completa. Queremos buscar os clientes que realizaram pedidos em um mês específico,
 não apenas em uma única data e hora. Como faremos isso?

Excluímos o filtro (WHERE datahorapedido = '2023-01-02 08:15:00'), já temos a primeira consulta estruturada. Vamos buscar todos os nossos dados.
*/

SELECT * FROM pedidos

/*
Já conhecemos a estrutura da nossa tabela de pedidos, que tem o ID, ID do cliente, data e hora e status. 
Buscamos informações da tabela de clientes, porque queremos o nome dos nossos clientes, já que na tabela de pedidos só temos o ID. 
Assim, não saberemos o nome do cliente pela tabela de pedidos.
*/

SELECT * FROM pedidos

SELECT * FROM clientes


/*
Conhecemos a estrutura da tabela de clientes, mas a revisitamos para exibição na tela. Como mencionado, agora buscamos informações para um mês completo, 
não mais para uma única data. Continuamos utilizando consultas, mas necessitamos reestruturá-las.

Procuramos o ID do cliente, não mais para uma única data, mas para um mês completo. Como realizar isso? Desejamos extrair a informação do mês da data, e para isso,
 empregamos o recurso StrfTime. Com o StrfTime, podemos converter a data e extrair precisamente o que queremos.

A conversão é necessária porque trabalharemos com ela como se fosse uma cadeia de caracteres. Assim, aplicamos o StrfTime(), 
abrindo parênteses e passando a string como parâmetro, especificando exatamente o que desejamos extrair dessa data, que neste caso é o mês. 
Utilizamos %m para indicar que queremos extrair o mês desta data. Passamos vírgula e passamos o campo, que é datahorapedido. E após isso, passamos o igual e o valor, que é 01.
*/

SELECT idcliente FROM pedidos WHERE strftime('%m', datahorapedido) = '01' 

/*
Queremos que sejam retornados os IDs dos nossos clientes da tabela de pedidos, onde o mês seja igual a 01, ou janeiro. 
Verificamos se nossa consulta está funcionando clicando em "Run". Temos a coluna "idcliente" com o valores, 10, 3, 8 e assim por diante.

Agora, possuímos todos os IDs dos clientes que realizaram pedidos em janeiro. No entanto, passamos para a segunda etapa, que consiste em obter o nome desses clientes.
*/


-- Inserindo o nome dos clientes

SELECT nome, telefone 
FROM clientes 
WHERE ID = (
    SELECT idcliente 
    FROM pedidos 
    WHERE datahorapedido = '2023-01-02 08:15:00');



/*
Contudo, esse método só funciona ao buscar um único valor.

Vamos trazer apenas o nome dos nossos clientes e inserir no where no comando SELECT * FROM clientes. 
Poderíamos utilizar subconsultas no where ou passar a subconsulta como uma tabela no from. Podemos trabalhar de ambas as formas com subconsultas.

No entanto, optamos por continuar utilizando o filtro, passando o campo de ID e estabelecendo a condição de igual, semelhante à consulta anterior.
*/

SELECT nome
FROM clientes
WHERE id = (
    SELECT idcliente
    FROM pedidos
    WHERE strftime('%m', datahorapedido) = '01')


/*
Estamos buscando o nome da tabela de clientes, onde o ID do cliente seja retornado da nossa segunda consulta. 
Ou seja, os clientes que realizaram pedidos no mês de janeiro. Estamos retornando mais de um registro.

Ele não deu erro, mas ele só retornou a Ana Maria Silva. E já buscamos, já temos essa informação de que vários clientes realizaram pedidos. 
E é justamente o que mencionamos anteriormente. O que acontece? Com essa estrutura de ID =, ele só vai pegar o primeiro valor retornado, mesmo que tenhamos vários.

Como podemos resolver esse problema e trazer todos os clientes que realizaram pedidos no mês de janeiro? Podemos utilizar o IN.
*/

-- Usando o comando IN

/*
O IN é um operador que podemos utilizar. Neste caso, ele trará todos os operadores que estão dentro dessa consulta, ou seja, que estão retornados. 
Busquem o nome de todos os clientes onde estejam dentro dessa consulta, ou seja, estará sendo retornada nossa subconsulta. Onde temos o sinal de igual, inserimos o IN.
*/

SELECT nome
FROM clientes
WHERE id IN (
    SELECT idcliente
    FROM pedidos
    WHERE strftime('%m', datahorapedido) = '01');
