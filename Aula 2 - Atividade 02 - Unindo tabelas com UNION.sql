-- Aula 2 - Atividade 02 - Unindo tabelas com UNION

-- A primeira informação que buscaremos para as pessoas gestoras do Serenatto Café & Bistrô são dados dos nossos fornecedores e colaboradores. Buscaremos, então:

SELECT * FROM colaboradores 

SELECT * FROM fornecedores


-- Buscando o endereço

SELECT rua, bairro, cidade, estado, cep FROM colaboradores 

SELECT rua, bairro, cidade, estado, cep FROM fornecedores 


-- Utilizando o UNION

/*
Para retornar essas informações em uma única consulta, utilizaremos o recurso da linguagem SQL, o UNION. 
Com o UNION, podemos unir as duas consultas select e trazer os dados de forma distinta, ou seja, sem repetição.

Digitamos "UNION" entre ambos os selects.
*/

SELECT rua, bairro, cidade, estado, cep FROM colaboradores 
UNION
SELECT rua, bairro, cidade, estado, cep FROM fornecedores 


/*
No entanto, é necessário prestar atenção a um detalhe. O UNION retorna de forma distinta, ou seja, se houver valores repetidos, eles não serão incluídos. 
Por exemplo, temos uma informação relevante em nossa tabela de colaboradores. Para verificar, rodamos novamente o select somente de colaboradores.

Sabemos que dois colaboradores compartilham o mesmo endereço, pois trabalham na mesma empresa e economizam financeiramente compartilhando o mesmo local. 
No caso é a Rua das Flores, 210.

Ao executar essa consulta com UNION, a união dessas duas consultas resultará em apenas um único endereço. Se repassarmos essa informação às pessoas gestoras da forma como está,
elas enviarão um único mimo para o mesmo endereço. Isso pode gerar um problema, pois um dos colaboradores pode não receber seu mimo.

Conclusão
Como podemos resolver esse problema e obter todos os endereços dos nossos colaboradores? Descobriremos e entenderemos como resolver esse problema na sequência.
*/