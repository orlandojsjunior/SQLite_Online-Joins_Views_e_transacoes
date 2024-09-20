-- Aula 2 - Atividade 10 - Subconsultas com HAVING

SELECT * FROM produtos

-- Buscando a média de preço

/* 
Qual informação buscamos? Inicialmente, desejamos saber a média de preço dos produtos. Podemos buscar isso usando a função de agregação AVG(),
que calcula a média dos preços. Aplicamos AVG() ao campo de preço.
*/

SELECT AVG(preco) FROM produtos

/*
Agora, com essa média de preço, vamos continuar elaborando uma consulta. Por quê? Porque as pessoas gestoras do Serenatto Café & Bistrô querem saber quais são os produtos que possuem o seu preço maior do que a média de preço de todos os produtos. Agora elaboramos uma consulta que nos retorne essa informação.

Buscaremos por SELECT nome, preco. Logo em seguida, pressionaremos "Enter" para formatar. Utilizaremos FROM em nossa tabela de produtos e agora incorporaremos outro recurso chamado HAVING.
*/

SELECT AVG(preco) FROM produtos

SELECT nome, preco
FROM produtos
HAVING

/*
Normalmente esses erros estão sendo retornados porque na nossa guia temos mais de uma consulta. E elas não estão separadas por ponto e vírgula. 
Como estamos batendo em teclas do nosso teclado, ou até selecionando e executando, sem selecionar, no caso, uma consulta específica, ele nos retorna esse erro.

Então, se tivéssemos com vírgula, ponto e vírgula, separando todas as consultas, ele teria executado. Mas, é por isso que é muito importante, 
quando vamos trabalhar com a SQLite Online separamos as nossas consultas por ponto e vírgula, ou para cada consulta criamos uma aba.

Vamos voltar o foco para a nossa consulta. Já buscamos a média dos nossos produtos e estamos elaborando uma segunda consulta que vai nos trazer as 
informações de qual é o nome e o preço do produto. Vamos até executá-la de novo, trazendo só o nome e o preço.

Mas não é isso que queremos. Desejamos buscar apenas os produtos onde o seu preço é maior do que a média de preço. Então, usamos HAVING. 
Porque o WHERE, que é o que estamos trabalhando até agora, ele trabalha com linhas simples.

Já o HAVING, ele trabalha com registros agregados, então valores que já foram agrupados, que é o caso, onde vamos ter na nossa tabela de preço 
esse agrupamento utilizando a função de agregação AVG().

Então HAVING, incluindo o campo de preço maior que. Agora, aplicamos novamente o recurso da subconsulta, e incorporamos essa subconsulta no HAVING.
*/

SELECT nome, 
    preco
FROM produtos
HAVING preco > (
        SELECT AVG (preco)
        FROM produtos
    )

/*
Executaremos, mas já antecipamos que ocorrerá um erro. E por quê? Porque estamos utilizando o HAVING, que lida com valores agregados, 
mas não estamos agregando nenhum valor neste caso.

Assim, usaremos o GROUP BY para agrupar o resultado pelo campo de preço e também pelo campo de nome e preço. Agruparemos pelos dois, presentes no nosso SELECT, 
então ele agrupará pelo nome e pelo preço.
*/

SELECT nome,
    preco
FROM produtos
GROUP BY nome,
    preco
HAVING preco > (
        SELECT AVG(preco)
        FROM produtos
    );


/*
Agora vamos executar clicando em "Run". E agora sim, então temos todos os produtos onde o seu preço é maior do que a média de preço de todos os produtos. 
Na parte inferior, temos uma tabela com os campos nome e preco.

Então, temos que o menor valor é o 5.5, já que a média de preço, se verificarmos aqui, é 5.33. Vamos arredondar.

Então, temos SELECT nome, preco FROM produtos, agrupando pelo nome e pelo preço. Estamos usando o HAVING ao invés do WHERE, já que estamos 
trabalhando com valores agregados. Agora não estamos buscando, estamos usando um operador de "maior que", um operador de comparação e também conseguimos trabalhar. 
E o melhor de tudo, estamos fazendo isso utilizando a mesma tabela na nossa consulta principal e também na nossa subconsulta.

Conhecemos como podemos trabalhar tanto com UNION como UNION ALL para unir as nossas tabelas que possuem campos com a mesma descrição, 
como também como podemos trabalhar com subconsultas para unir informações também de outras tabelas que necessariamente não precisam ter os campos iguais.
*/