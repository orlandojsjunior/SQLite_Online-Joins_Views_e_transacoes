/*
Geralmente, a cláusula WHERE é empregada para aplicar filtros durante deleções ou atualizações, manipulando apenas o dado específico desejado. 
No entanto, e se atualizarmos sem usar a cláusula WHERE, ou se o computador travar no meio do processo, causando uma falha na execução? 
Mesmo ao usar o filtro, existe a possibilidade de execução inadequada.
*/

-- Entendendo as transações.

/*
Podemos adicionar uma camada adicional de segurança por meio de transações. As transações são como abrir um bloco no SQLite Online, 
permitindo a execução de vários comandos, como DELETE e UPDATE. Se um desses comandos falhar, todos os outros também falharão, 
consolidando vários comandos em um único bloco.

Suponhamos que realizamos um UPDATE:
*/

-- UPDATE Pedidos SET Status = 'Concluído'

/*
Se não desejarmos a confirmação deste comando, nenhum dos outros também será confirmado, pois decidimos que todos serão 
concluídos com sucesso ou todos falharão. Como confirmamos?

Podemos iniciar a transação e utilizar o COMMIT para confirmar a execução física desses comandos no banco de dados, ou realizar o ROLLBACK, 
revertendo assim todas as execuções e manipulações. Portanto, uma transação é uma única unidade de comandos a serem executados.

Para compreender melhor o funcionamento das transações, realizamos na prática. 

Iniciamos a transação com o BEGIN, que, traduzindo para o português, significa "início". Ao executar este comando, iniciamos um bloco, criando, assim, 
uma aba virtual.

Podemos executar diversos comandos enquanto o BEGIN TRANSACTION estiver ativo. Esses comandos serão aplicados exclusivamente nesse único bloco, 
sendo executados somente na aba "SQLite.db.8". Tomemos, por exemplo, um UPDATE e um SELECT.
*/


BEGIN TRANSACTION;

SELECT * FROM clientes;

SELECT * FROM pedidos;

UPDATE pedidos SET Status = 'Concluído';

DELETE FROM clientes;


-- Revertendo a informação

-- Como estamos dentro de um bloco de transação, podemos utilizar o ROLLBACK. Com o ROLLBACK, todos esses dois comandos que executamos, serão revertidos.

ROLLBACK;

SELECT * FROM clientes;

SELECT * FROM pedidos;

/*
Executamos o comando acima. Logo após, executamos em clientes rodando o comandos: SELECT * FROM clientes. 
Observem que temos como retorno todos os clientes de volta na base de dados.

Ao executarmos o comando SELECT * FROM Pedidos, obtemos novamente o status "entregue", "andamento", etc.

Vamos executar a atualização dos nossos pedidos, modificando o status para "concluído" quando este estiver definido como "em andamento". 
Antes disso, iniciamos nossa transação com BEGIN TRANSACTION e procedemos com a atualização e validação dos pedidos.
*/

BEGIN TRANSACTION;

UPDATE Pedidos SET Status = 'Concluído' WHERE status = 'Em Andamento';

/*
Executamos o select na tabela de Pedidos. Agora, obtemos como retorno apenas com o status como entregue ou concluído. 
No entanto, se efetuarmos um ROLLBACK e consultarmos os pedidos (SELECT * FROM Pedidos), os status retornarão a ser em andamento, 
concluído e entregue. Mesmo ao utilizar o WHERE, mantemos a opção de reverter.

Mas não é essa a nossa intenção; desejamos atualizar agora usando o filtro. Iniciamos novamente a transação rodando o 
BEGIN TRANSACTION, procedemos com a atualização dos status (UPDATE Pedidos SET Status = 'Concluído' WHERE status = 'Em Andamento'), 
verificamos se estão corretos rodando o SELECT * FROM Pedidos.

Por fim, utilizamos o COMMIT; para confirmar que desejamos que essas ações, neste caso, limitadas ao UPDATE, sejam confirmadas 
fisicamente no nosso banco de dados.
*/

COMMIT;

/*
As transações são um outro recurso, como já mencionamos anteriormente, uma camada a mais de segurança quando formos atualizar os nossos dados, 
manipular como atualizar ou até deletar.
*/