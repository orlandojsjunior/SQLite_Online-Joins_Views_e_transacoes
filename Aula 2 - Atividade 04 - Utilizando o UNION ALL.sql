-- Aula 2 - Atividade 04 Utilizando o UNION ALL

-- Utilizando a cláusula where

/*
Ao modificar nosso select, retiramos a restrição para que todos os campos sejam retornados e aplicamos um filtro. 
Colocamos o where para que a rua seja igual a, clicamos duas vezes em "Rua das Flores - 210". Ao abrir a linha do registro, 
podemos copiar essas informações do campo "Rua". Fechamos a janela, colamos a informação e executamos clicando em "Run".
*/

SELECT * FROM colaboradores WHERE rua = 'Rua das flores - 210'

/*
Obtemos como retorno a tabela com o id, nome, cargo, data de contratação, telefone, e-mail, rua, bairro, cidade, Estado e cep.

Notamos que João Pereira e Antônio Artur compartilham o mesmo endereço. Como mencionado anteriormente, isso é benéfico, 
principalmente em termos de gastos financeiros, pois proporciona economia ao dividir as despesas entre os dois.

No entanto, da maneira como estamos executando, temos apenas um único endereço para os dois colaboradores que compartilham o mesmo endereço. 
Essa é a forma incorreta de obter essa informação neste cenário.
*/

-- Usando o UNION ALL

/*
Utilizaremos outro recurso da linguagem SQL para resolver esse problema. Na verdade, é o mesmo recurso, o UNION, mas em vez de UNION, 
colocaremos UNION ALL, ou seja, ele unirá e retornará todos os valores.
*/

SELECT rua, bairro, cidade, estado, cep FROM colaboradores 
UNION ALL
SELECT rua, bairro, cidade, estado, cep FROM fornecedores 

/*
Podemos executar isso e, como resultado, agora temos todos os endereços, incluindo Rua das Flores, Centro, São Paulo, SP, e o mesmo CEP. 
Agora, temos todas as informações conforme desejado, os endereços de todos os colaboradores.

O UNION retornará essas informações de maneira distinta, ou seja, não haverá repetição de valores. 
No entanto, ao utilizarmos o UNION ALL, temos a possibilidade de retornar valores repetidos em nossa consulta.
*/

-- Inserindo o nome na consulta

/*
Agora possuímos as informações de endereço, mas também devemos incluir outra informação importante: o nome. 
Como saber a qual endereço pertence? A quem pertence? É uma pessoa colaboradora ou uma pessoa fornecedora? 
A mensagem precisa conter o nome, ser bem direcionada: "Olá! Estamos felizes com a sua colaboração. Estamos te enviando um mimo".

Seria interessante ter o nome também das nossas pessoas colaboradoras e fornecedoras. Adicionamos o nome à nossa consulta:
*/

SELECT nome, rua, bairro, cidade, estado, cep FROM colaboradores 
UNION ALL
SELECT nome, rua, bairro, cidade, estado, cep FROM fornecedores 


-- Entendendo o funcionamento o UNION e UNION ALL

/*
Por que conseguimos unir duas tabelas com campos que não têm nenhum tipo de ligação em comum utilizando o UNION e o UNION ALL? 
O UNION opera exatamente dessa forma, onde temos tabelas que não precisam ter nenhum tipo de relação entre si, 
mas os campos que buscamos devem ter a mesma descrição. Foi o que ocorreu aqui.

Ao observar, notamos que possuímos os campos nome, rua, bairro, cidade, estado e CEP. Todos esses campos têm a mesma descrição, 
exatamente iguais. Por isso, não é necessário ter nenhum tipo de relacionamento entre as tabelas.

Se tivermos duas tabelas que possuem o mesmo campo, com a mesma descrição, podemos utilizar o UNION e o UNION ALL para realizar essa união. 
Ao realizar essa união, obtemos como retorno essas informações nos mesmos campos. É por isso que é importante que as tabelas tenham a mesma descrição.
*/

