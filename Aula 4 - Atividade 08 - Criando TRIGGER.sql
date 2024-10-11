-- Vamos usar o JOIN, e colocar os IDs de ambas as tabelas.

SELECT * FROM pedidos;

SELECT * FROM itenspedidos;

SELECT *
FROM pedidos p
JOIN itenspedidos ip
ON p.id = ip.idpedido;


/*
Com DATE, extraímos de datahorapedido apenas a data, e damos o alias de Dia. Precisamos do preço unitário, então, ip.precounitario. Sabemos que precisamos somar esse campo, 
porque já temos o valor por produto, naquele pedido específico, então, só precisamos somar esse valor. Sendo assim, vamos dar um SUM() em ip.precounitario e colocar um alias de FaturamentoDiario.
*/

SELECT DATE (datahorapedido) AS Dia, SUM(ip.precounitario) AS FaturamentoDiario
FROM pedidos p
JOIN itenspedidos ip
ON p.id = ip.idpedido;

/*
Ao executar a consulta, obtemos como resultado a data e o faturamento diário, que na realidade não está diário, 
está o faturamento total de todas as vendas.

Isso ocorreu porque não indicamos que queríamos agrupar essa soma pelas datas. Faremos isso agora.

Então, ao final, depois de ON, passamos GROUP BY, indicando que essa soma deve ser agrupada por Dia. 
Podemos, inclusive, fazer a ordenação utilizando o ORDER BY também por Dia.
*/

SELECT DATE (datahorapedido) AS Dia, SUM(ip.precounitario) AS FaturamentoDiario
FROM pedidos p
JOIN itenspedidos ip
ON p.id = ip.idpedido
GROUP BY Dia
ORDER BY Dia;


/*
Para facilitar, poderíamos usar uma view, que criaria uma tabela virtual que armazenaria esse resultado nesse formato, 
com o dia e o faturamento diário. Sempre que chamássemos essa view, teríamos esse resultado. Mas será que existe uma forma 
mais simples e automática de fazer o cálculo do nosso faturamento diário e armazenar em uma tabela física? Isso facilitaria 
o acesso dos nossos gestores a essa informação. A resposta é sim, temos essa possibilidade.

Para isso, podemos usar Trigger (gatilho), um procedimento armazenado que é acionado através de alguma ação. É utilizado 
justamente para automatizar algumas etapas, como a inserção, exclusão ou atualização de dados. Pode ser utilizado justamente para, 
por exemplo, calcular um valor e inserir de forma automática em uma tabela.

Vamos utilizar esse recurso, Trigger, para facilitar ainda mais o nosso trabalho. Quando começarmos a criar todo o processo e acionar o nosso gatilho, 
você entenderá melhor como funciona esse recurso.

O primeiro passo é criar a nossa tabela. Portanto, vamos criar uma nova tabela de faturamento diário com o seguinte comando:
*/

CREATE TABLE FaturamentoDiario (
    Dia DATE,
    FaturamentoTotal DECIMAL(10, 2)
);

/*
Agora, podemos criar o Trigger. Para isso, usamos o comando CREATE TRIGGER e passamos um nome. Vamos chamar de CalculaFaturamentoDiario.

Em seguida, informamos quando deve ser acionado, no caso, AFTER INSERT ON itenspedidos. Ou seja, após o comando INSERT na tabela 
de itens pedidos. Na sequência, passamos a informação FOR EACH ROW, indicando que isso deve acontecer para cada linha da tabela.

Agora, abrimos um bloco de código com BEGIN, onde colocaremos o SELECT, e o fechamos com END.
*/

CREATE TRIGGER CalculaFaturamentoDiario
AFTER INSERT ON itenspedidos
FOR EACH ROW
BEGIN


END

/*
Antes de trazer a nossa consulta, seria interessante validar se ela realmente está funcionando. Então, vamos fazer um INSERT 
na nossa tabela de faturamento diário para importar os valores totais dos pedidos que já existem na nossa base de dados. 
Para isso, podemos usar o SELECT no INSERT, da seguinte forma:
*/

INSERT INTO FaturamentoDiario (Dia, FaturamentoTotal)
SELECT DATE(datahorapedido) AS Dia, SUM(ip.precounitario) AS FaturamentoDiario
FROM pedidos p
JOIN itenspedidos ip
ON p.id = ip.idpedido
GROUP BY Dia
ORDER BY Dia;

-- Dessa forma, os valores virão do comando que busca o dia e o faturamento diário, fazendo o cálculo.

-- Ao executar, não tivemos nenhum erro. Para nos certificar, vamos executar SELECT * FROM FaturamentoDiario.

SELECT * FROM FaturamentoDiario;


CREATE TRIGGER CalculaFaturamentoDiario
AFTER INSERT ON itenspedidos
FOR EACH ROW
BEGIN
DELETE FROM FaturamentoDiario;
INSERT INTO FaturamentoDiario (Dia, FaturamentoTotal)
SELECT DATE(datahorapedido) AS Dia, SUM(ip.precounitario) AS FaturamentoDiario
FROM pedidos p
JOIN itenspedidos ip
ON p.id = ip.idpedido
GROUP BY Dia
ORDER BY Dia;
END;

