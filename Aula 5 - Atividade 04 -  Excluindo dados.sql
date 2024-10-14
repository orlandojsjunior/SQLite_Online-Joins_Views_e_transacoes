-- Removendo dados não usados

SELECT * FROM colaboradores;


-- Vamos realizar essa exclusão, aplicando o filtro com o ID 3, correspondente a Pedro Almeida.

SELECT * FROM colaboradores WHERE id =3;


-- Usando o delete para remover uma pessoa colaboradora.

DELETE FROM colaboradores WHERE id =3;


-- Removendo informações da tabela clientes.

SELECT * FROM clientes;

SELECT * FROM clientes WHERE ID = 27;

SELECT * FROM pedidos WHERE idcliente = 27;


/*
Ao consultar nossa tabela de pedidos, identificamos o ID 27, correspondente ao cliente Paulo, e seu único pedido registrado, 
identificado como 451 conforme observamos na coluna "id". Podemos também validar essa informação na seção de itens pedidos, 
onde encontramos o mesmo ID.
*/

SELECT * FROM itenspedidos WHERE idpedido = 451;

DELETE FROM clientes WHERE id = 27;


-- Verificando as alterações. 

SELECT * FROM clientes WHERE ID = 27;

SELECT * FROM pedidos WHERE idcliente = 27;

SELECT * FROM itenspedidos WHERE idpedido = 451;


/*
Se buscarmos todos os dados de colaboradores com SELECT * FROM clientes, não encontraremos mais Paulo Sousa. Do id 26 pula para o 28. 
Ao buscarmos em pedidos com o comando SELECT * FROM pedidos, observamos que não temos mais o pedido 451 na coluna "id". Também perdemos 
as informações em itenspedidos, ao executarmos o comando select observamos que não temos mais o id 451.

Isso acontece porque estabelecemos uma relação que resultou que ao removermos o cliente, foi removido todos os dados de pedidos e itenspedidos. 
Isso porque ao criar a tabela de clientes e configurar a chave estrangeira com o comando ON DELETE CASCADE, decidimos que, ao excluir um cliente 
da tabela de clientes, todos os registros relacionados a ele também seriam removidos. Foi exatamente o que ocorreu.

A exclusão do cliente com ID 27 resultou na remoção automática de seus pedidos, incluindo os itens associados, tudo de uma só vez.

Isso não representaria um problema se precisássemos manter, como é o caso, os registros de vendas dos nossos clientes. Por quê? Porque isso é 
importante para o faturamento. É essencial estruturar nossas tabelas de maneira cuidadosa no momento da criação e compreender quais recursos 
fazem sentido utilizar ou não.

O Delete Cascade, foi realmente vantajoso para manter esse faturamento atualizado? Não foi. A partir do momento em que excluímos nosso cliente, 
perdemos os dados de pedidos e itens pedidos, essenciais para as pessoas gestoras acompanharem o faturamento.

Embora o dinheiro tenha entrado em caixa e esteja registrado, não está presente em nosso banco de dados. Neste caso, o Delete Cascade não é muito vantajoso.

Precisamos ter muito cuidado ao utilizar o Delete Cascade ou outras restrições ao criar nossas tabelas. Dessa forma, quando o banco de dados 
estiver em produção, evitaremos contratempos que possam prejudicar a empresa com a qual estamos colaborando.

Já realizamos a exclusão. Demonstramos como o Delete Cascade funciona. É um recurso bastante interessante. No entanto, é importante ter cautela 
ao utilizar tanto o Delete quanto o Update.
*/

-- Atualizando o status.

SELECT * FROM pedidos;

SELECT * FROM pedidos WHERE status = 'Em Andamento';


/*
Se observarmos nosso primeiro pedido do mês de janeiro, assim como vários outros, ainda estão em andamento. Eles desejam atualizar essa informação, 
alterando o status dos pedidos em andamento para serem concluídos.
*/


-- UPDATE Pedidos SET Status = 'Concluído'

/*
Poderia executar, atualizando realmente os status dos meus pedidos. Contudo, isso afetaria todos eles. Por quê? Porque não estamos aplicando 
uma cláusula WHERE para filtrar. Isso representaria um grande problema.
*/

-- Conclusão

/*
Contudo, há outra maneira de garantir uma camada adicional de segurança para os dados, além do WHERE, durante a manipulação do banco de dados, 
utilizando o Delete e o Update?
*/

