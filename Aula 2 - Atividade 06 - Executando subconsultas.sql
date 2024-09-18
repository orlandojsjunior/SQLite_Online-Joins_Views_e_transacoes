-- Aula 2 - Atividade 06 - Executando subconsultas

/*
Buscamos agora informações sobre pedidos e clientes, mais especificamente, compreendendo quem foi o primeiro cliente a fazer um pedido
no Serenatto Café e Bistrô neste ano, em 2023. Inicialmente, extraímos as informações dos clientes com SELECT * FROM clientes.
*/

SELECT * FROM clientes

SELECT * FROM pedidos


/*
Para encontrar a pessoa cliente que fez o primeiro pedido, realizamos um select apenas no campo de ID do cliente e buscamos a pessoa cliente com o ID 10. 
No where, filtramos pela data e hora do primeiro pedido, copiando esses valores da linha correspondente ao ID 1 e colando-os na condição de igualdade. 
Para isso, damos um duplo clique na primeira linha da coluna "datahorapedido" e copiamos o conteúdo do campo "datahorapedido".
*/

SELECT idcliente FROM pedidos WHERE datahorapedido = '2023-01-02 08:15:00'


-- Capturando o nome do cliente

/*
Como podemos trazer essa informação? As pessoas gerentes querem ter essa informação para entrar em contato com a Ana Maria, saber da experiência dela, 
enviar um mimo, dar um brinde a ela. "Olá, Ana Maria, como você foi a nossa primeira cliente do ano de 2023, você pode vir aqui que você vai ter um café 
gratuito". Um pequeno brinde para a pessoa cliente retornar para o estabelecimento.

Precisamos dos clientes que possuem apenas o nome dela e o telefone, um dado igualmente importante. Buscamos o telefone da pessoa cliente, 
combinando essas duas consultas, pois nome e telefone estão em clientes, enquanto as informações do pedido, como ID e data, estão em pedidos.
*/

SELECT nome, telefone FROM clientes

SELECT idcliente FROM pedidos WHERE datahorapedido = '2023-01-02 08:15:00'

/*
Na primeira consulta, que traz nome e telefone da tabela de clientes, aplicamos um filtro WHERE. Incluímos o campo de ID, 
pois pretendemos passar esse ID no filtro da comparação, que faz parte da nossa segunda consulta. Podemos copiá-la e colar após o sinal de igual.

Nesta segunda consulta, buscamos o ID da pessoa cliente na tabela de pedidos que fez o pedido em 2 de janeiro de 2023.
*/

SELECT nome, telefone 
FROM clientes 
WHERE ID = (
    SELECT idcliente 
    FROM pedidos 
    WHERE datahorapedido = '2023-01-02 08:15:00');