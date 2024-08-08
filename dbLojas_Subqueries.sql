/* Exercícios de Subqueries

Encontre o nome da empresa e o cargo dos funcinários que realizaram pedidos cujo
valor do frete maior que R$100
*/
-- PASSO 1: ENCONTRAR OS PEDIDOS CUJO VALOR DO FRETE SEJA MAIOR QUE R$100
SELECT 
	fk_CodigoCliente,
	Frete
FROM
	TBL_Pedidos
WHERE
	Frete > 100;

-- PASSO 2: IDENTIFICAR OS NOMES DOS CLIENTES QUE PAGARAM MAIS DE R$100 EM FRETE
SELECT 
	NomeEmpresa
FROM
	TBL_Clientes
WHERE
	pk_CodigoCliente
	IN(
		SELECT 
			DISTINCT 
				fk_CodigoCliente
		FROM
			TBL_Pedidos
		WHERE
			Frete > 100);

/* EXERCÍCIO 2 LISTE O NOME DOS PRODUTOS QUE POSSUEM UM PREÇO UNITPARIO MAIOR DO QUE A MÉDIA DE TODOS OS PRODUTOS*/
-- PASSO 1: CALCULAR A MÉDIA DE PREÇO DOS PRODUTOS
SELECT 
	AVG(PrecoUnitario)
FROM 
	TBL_Produtos;

-- PASSO 2: LISTAR OS PRODUTOS QUE POSSUEM PREÇO SUPERIOR À MÉDIA CALCULADA (SUBQUERY)
SELECT 
	NomeProduto,
	PrecoUnitario 
FROM 
	TBL_Produtos
WHERE
	PrecoUnitario > (SELECT AVG(PrecoUnitario)FROM TBL_Produtos)
ORDER BY
	PrecoUnitario ASC;

/* EXERCÍCIO 03 ENCONTRE O NOME DAS EMPRESAS E OS CARGOS DOS CONTATOS DE TODOS OS CLIENTES QUE NUNCA REALIZARAM PEDIDOS*/
SELECT
	NomeEmpresa AS CLIENTE,
	NomeContato AS CONTATO,
	CargoContato AS CARGO
FROM
	TBL_Clientes
WHERE
	pk_CodigoCliente NOT IN(SELECT DISTINCT fk_CodigoCliente FROM TBL_Pedidos);

/*EXERCÍO 4 LISTE O NOME DOS PRODUTOS QUE NUNCA FORAM PEDIDOS*/
SELECT 
	NomeProduto
FROM 
	TBL_Produtos
WHERE
	pk_CodigoProduto NOT IN(SELECT DISTINCT fk_CodigoProduto FROM TBL_DetalhesPedidos);

/*EXERCÍCIO 5 ENCONTRE OS FORNECEDORES QUE FORNECEM PRODUTOS EM QUANTIDADE MÉDIA MAIOR QUE 25 UNIDADES*/
-- PASSO 1: CALCULE A QTDE MÉDIA DE PRODUTOS VENDIDOS
-- PASSO 2: IDENTIFICAR O CÓDIGO DOS PRODUTOS CUJO A QTDE MÉDIA VENDIDA É MAIOR QUE 25
SELECT 
	fk_CodigoProduto
FROM 
	TBL_DetalhesPedidos
GROUP BY 
	fk_CodigoProduto
HAVING AVG(Quantidade) > 25;


-- PASSO 3: IDENTIFICAR O CÓDIGO DOS FORNECEDORES DESTES PRODUTOS
SELECT 
	fk_CodigoFornecedor
FROM 
	TBL_Produtos
WHERE
	pk_CodigoProduto IN(SELECT 
							fk_CodigoProduto 
						FROM 
							TBL_DetalhesPedidos 
						GROUP BY 
							fk_CodigoProduto 
						HAVING 
							AVG(Quantidade) > 25);

-- PASSO 4: LISTAR O NOME DAS EMPRESAS DOS FORNECEDORES
SELECT 
	NomeEmpresa
FROM 
	TBL_Fornecedores
WHERE
	pk_CodigoFornecedor IN(SELECT 
								fk_CodigoFornecedor
							FROM 
								TBL_Produtos
							WHERE
								pk_CodigoProduto IN(SELECT 
														fk_CodigoProduto 
													FROM 
														TBL_DetalhesPedidos 
													GROUP BY 
														fk_CodigoProduto 
													HAVING 
														AVG(Quantidade) > 25));