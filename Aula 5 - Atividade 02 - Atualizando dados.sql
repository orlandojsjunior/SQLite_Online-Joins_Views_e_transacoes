-- Aula 5 - Atividade 02 - Atualizando dados

/*
Nesta aula, atualizaremos as informações para garantir sua integridade e alinhamento com a realidade. Não é suficiente apenas buscar os dados; 
é imperativo que estejam em conformidade com o mundo real.

Para isso, no SQL Online, selecionamos a primeira aba "SQLite.db" (aba padrão). Nela, iremos atualizar as informações da tabela de produto. 
Primeiro, rodamos o select para visualizar os dados
*/

SELECT * FROM produtos;


/*
Precisamos atualizar algumas informações, incluindo preço e descrição. No entanto, antes de usar o comando update para realizar essas atualizações, 
é crucial compreender um ponto essencial sobre o SQLite online: ele não valida as chaves estrangeiras.

Tomemos, por exemplo, a tabela de pedidos do lado esquerdo, que contém o campo idcliente. Ao adicionar um pedido e especificar o idcliente, é necessário 
que esse ID exista na tabela de clientes. Entretanto, o SQLite online não realiza essa validação. Já tivemos casos em que conseguimos inserir pedidos sem 
que estivessem vinculados a um cliente existente, indicando a falta de validação da chave estrangeira.
*/

-- Essa é uma característica intrínseca do SQLite online, de seus parâmetros e de sua configuração padrão.

-- É necessário indicar explicitamente que desejamos validar essa chave estrangeira, essa ligação. E como isso pode ser feito? Através do pragma.

-- Usando o pragma

/*
O pragma é uma funcionalidade exclusiva do SQLite online. Se por acaso estiver presente, não está relacionado à linguagem SQL, sendo uma configuração 
específica do próprio SGBD, sujeita a alterações conforme a versão do SQLite online que estamos utilizando.

Por meio desse pragma, podemos modificar as configurações do nosso SQLite online. Informamos a ele que desejamos validar nossas chaves estrangeiras, 
estabelecendo foreign_keys = ON.
*/

PRAGMA foreign_keys = ON;


/*
Ao executar esse comando clicando em "Run", como retorno ele confirma a execução na parte inferior. A partir deste ponto, nossas chaves 
estrangeiras estão sendo validadas.

Vocês podem estar se questionando: por que abordar esse aspecto agora? Por que não no início, durante a inserção dos dados? Este é um ponto importante. 
Aqui, estamos focados no aprendizado, buscando compreender e dominar o uso da linguagem SQL e de seus recursos. Contudo, é essencial não apenas conhecer 
a linguagem SQL, mas também entender o SGBD que estamos utilizando.

No contexto do SQLite Online, se estivéssemos implementando em um ambiente de produção sem prévia pesquisa, já teríamos todos os dados importados em 
osso banco de dados e realizado diversas consultas, o que poderia acarretar problemas. Como mencionado, esse cenário não é exclusivo do SQLite Online.

Por exemplo, ao utilizar o MySQL Workbench, que é o client do MySQL, é necessário fornecer uma cláusula where ao executar os comandos update e delete, 
mesmo que seja intencional. Para contornar isso, é preciso acessar as configurações e modificar o parâmetro para permitir a execução do update sem a 
cláusula where. Cada Sistema de Gerenciamento de Banco de Dados (SGBD) possui suas peculiaridades.

Essa é a razão pela qual é fundamental possuirmos um conhecimento aprofundado sobre o SGBD que estamos utilizando e avaliar se ele atende efetivamente 
às necessidades do nosso projeto. Agora que ativamos a validação das chaves estrangeiras, podemos prosseguir com a atualização dos nossos dados.
*/

-- Atualizando os dados

/*
Atualizaremos os dados, mais especificamente, o preço de um produto inserido recentemente. Para isso, no comando select usamos o where e modificaremos 
o id para 31, correspondente ao nosso último produto inserido.
*/

SELECT * FROM produtos WHERE id = 31;

-- Ao rodarmos clicando em "Run", observamos que esse produto é a Lasanha à Bolonhesa. Agora, o preço não será mais R$12,50, mas sim R$13.

-- Atualizando o preço

-- Utilizaremos o UPDATE produtos para setar o valor do campo de preço para R$13. Em seguida, aplicamos o filtro com o WHERE.

UPDATE produtos SET preco = 13.0 WHERE id = 31;


/*
O que aconteceria sem o filtro? O preço de todos os produtos seria atualizado para R$13, o que não desejamos. Executamos o comando 
selecionando-o por completo e clicando em "Run". Como retorno temos uma confirmação da execução.

Para visualizar se deu certo, rodamos:
*/

SELECT * FROM produtos WHERE id = 31;

-- Agora, na coluna "preco" consta o valor R$13.

-- Usando o like
/*
Além da atualização da lasanha, também modificaremos outro produto. Rodamos o select para visualizar as informações:
*/

SELECT * FROM produtos WHERE id = 31;


/*
Possuímos diversas informações, incluindo o Croissant, que possui duas variantes: chocolate e amêndoas. Se buscarmos apenas pelo nome, 
não conseguiremos distinguir entre eles.

Podemos buscar pelo nome utilizando o like. Com essa abordagem, conseguimos especificar trechos exatos de strings para comparação. 
Informamos que desejamos trazer apenas os produtos cujo nome comece com "croissant".
*/

SELECT * FROM produtos WHERE nome LIKE 'croissant%';

/*
Notamos que o croissant de amêndoa possui a mesma descrição do chocolate, algo que precisamos modificar.

Procedemos com a atualização dessa informação, ajustando a descrição para "croissant recheado com amêndoas" no produto de id 28. 
Usaremos o UPDATE produtos SET descricao informando o id que desejamos alterar a descrição desejada para substituir a anterior.
*/

UPDATE produtos SET descricao = 'Crossaint recheado com amêndoas.' WHERE id = 28;

SELECT * FROM produtos WHERE nome LIKE 'croissant%'