-- EXERCÍCIOS PARTE 05 DBLOJAS
/* 1. Criar uma lista com os nomes completos dos funcionários em letras maiúsculas.
UPPER = Uppercase - Letra Maiúscula
*/
SELECT 
	UPPER(Nome + ' ' + Sobrenome) AS NOME_COMPLETO
FROM 
	TBL_Funcionarios;

-- OU LOWER = Lowercase - Letra Minúscula
SELECT 
	LOWER(Nome + ' ' + Sobrenome) AS NOME_COMPLETO
FROM 
	TBL_Funcionarios;

/*2. A quantidade de Pedidos emitidos na tabela Pedidos.

*/
SELECT 
	COUNT(pk_NumeroPedido) AS QTDE_PEDIDO
FROM 
	TBL_Pedidos;

/*3. A quantidade de países cadastrados na tabela Pedidos sem repetição.
*/
SELECT 
	COUNT(DISTINCT(PaisDestino)) AS PAISES 
FROM 
	TBL_Pedidos;

/*4. A soma dos valores de frete de todos os pedidos emitidos para o país Brasil.
*/
SELECT 
	PaisDestino			AS PAIS,
	SUM(Frete)			AS FRETE_TOTAL
FROM 
	TBL_Pedidos
WHERE
	PaisDestino = 'Brasil'
GROUP BY 
	PaisDestino;

/*5. Quantidade de pedidos emitidos entre as data de 01-09-2015 a 30-09-2016.
*/
SELECT 
	COUNT(pk_NumeroPedido) AS PEDIDO
FROM 
	TBL_Pedidos
WHERE
	DataPedido BETWEEN '2015-09-01' AND '2016-09-30';

/*6. Quantidade de clientes da tabela clientes cujo país seja Argentina.
*/
SELECT 
	Pais					AS PAIS,
	COUNT(NomeEmpresa)		AS QUANTIDADE
FROM 
	TBL_Clientes
WHERE
	Pais = 'Argentina'
GROUP BY 
	Pais;