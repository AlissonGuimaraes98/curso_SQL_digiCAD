/*EXEMPLOS DE APLICAÇÕES HAVING E SUBQUERIES*/
--EXEMPLO 1
SELECT
	PaisDestino				AS PAISES,
	SUM(Frete)				AS VALOR_TOTAL_FRETE
FROM
	TBL_Pedidos
WHERE
	PaisDestino IN ('Alemanha', 'Brasil')
GROUP BY
	PaisDestino;

	-- OU

SELECT
	PaisDestino				AS PAISES,
	SUM(Frete)				AS VALOR_TOTAL_FRETE
FROM
	TBL_Pedidos
GROUP BY
	PaisDestino
HAVING
	PaisDestino IN ('Alemanha', 'Brasil');

-- OUTRO EXEMPLO HAVING
-- LISTAR OS PAÍSES QUE TEM MAIS DE 100 PEDIDOS
SELECT
	PaisDestino				AS PAISES,
	COUNT(pk_NumeroPedido)	AS QTDE_TOTAL
FROM
	TBL_Pedidos
GROUP BY
	PaisDestino
HAVING COUNT(pk_NumeroPedido) > 100;

/*Exemplo 02: Maior e Menor valor de Freto tabela pedidos por país 
	cujo total dos fretes seja maior que R$ 5.000,00:
*/
SELECT
	PaisDestino				AS PAISES,
	MAX(Frete)				AS MAIOR_FRETE,
	MIN(Frete)				AS MENOR_FRETE,
	SUM(Frete)				AS VALOR_TOTAL
FROM
	TBL_Pedidos
GROUP BY
	PaisDestino
HAVING
	SUM(Frete) > 5000
ORDER BY 
	VALOR_TOTAL DESC;