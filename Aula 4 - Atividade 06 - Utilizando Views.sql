
-- Podemos aplicar diversos filtros normalmente. Por exemplo, podemos realizar uma consulta para buscar o nome das pessoas clientes.

SELECT nome FROM ViewValorTotalPedido;


-- Podemos também aplicar filtros. Para isso, podemos passar WHERE, o valor do campo, ValorTotalPedido e = 10.

SELECT nome FROM ViewValorTotalPedido
WHERE ValorTotalPedido = 10;


-- Podemos aplicar outro filtro, onde o valor seja maior que 10.

SELECT nome FROM ViewValorTotalPedido
WHERE ValorTotalPedido > 10;


-- Para filtrar ainda mais, ao invés de maior que 10, podemos colocar entre 10 e 14, utilizando o operador lógico AND.

SELECT nome FROM ViewValorTotalPedido
WHERE ValorTotalPedido > 10 AND ValorTotalPedido < 14;


/* 
Também podemos trabalhar com o campo de data. Lembre-se de que alteramos nosso comando SQL antes de criar nosso view 
para incluir o campo de data e hora. Para isso, passamos o strftime() e buscamos pelo mês.
*/

SELECT nome FROM ViewValorTotalPedido
WHERE strftime('%m', datahorapedido) = '08';


/*
Vamos remover ViewCliente, pois ela não está sendo útil para nós. Para deletar, ou "dropar", uma view do nosso banco de dados, 
basta clicar com o botão direito do mouse sobre e selecionar a opção DROP. É semelhante à exclusão de uma tabela, como se estivéssemos 
executamos o comando DROP VIEW ViewCliente.
*/

DROP VIEW ViewCliente;