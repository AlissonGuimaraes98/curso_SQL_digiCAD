/*Exemplo 01: Listar os produtos da tabela Produtos onde dever� aparecer o C�digo do Produto, Nome do
	Produto, Pre�o Unit�rio e o Nome da Categoria:*/
-- EXEMPLOS DE JOIN'S

SELECT 
	P.pk_CodigoProduto,
	P.NomeProduto,
	P.PrecoUnitario,
	C.NomeCategoria,
	C.pk_CodigoCategoria
FROM 
	TBL_Produtos P
LEFT JOIN 
	TBL_Categorias C ON P.fk_CodigoCategoria = C.pk_CodigoCategoria;

/*Exemplo 02: Listar o n�mero de pedidos por Funcion�rio:*/
-- PRIMEIRO: VENDO QUANTIDADE DE PEDIDOS POR C�DIGO DE FUNCION�RIO
SELECT 
	fk_CodigoFuncionario,
	COUNT(pk_NumeroPedido)
FROM 
	TBL_Pedidos
GROUP BY 
	fk_CodigoFuncionario;

-- SEGUNDO: APLICANDO O JOIN
SELECT
	F.Nome,
	COUNT(P.fk_CodigoFuncionario) AS QTDE_PEDIDOS
FROM
	TBL_Funcionarios F
INNER JOIN 
	TBL_Pedidos P ON F.pk_CodigoFuncionario = P.fk_CodigoFuncionario
GROUP BY
	F.Nome
ORDER BY QTDE_PEDIDOS;

/*EXERC�CIO 03: LISTE OS NOMES DOS PRODUTOS, A QUANTIDADE EM ESTOQUE E A QUANTIDADE PEDIDA EM TODOS OS PEDIDOS*/
SELECT 
	 P.NomeProduto,
	 P.UnidadeEstoque,
	 SUM(D.Quantidade)	AS QTDE_VENDIDA
FROM 
	TBL_Produtos P
INNER JOIN 
	TBL_DetalhesPedidos D ON P.pk_CodigoProduto = D.fk_CodigoProduto
GROUP BY
	P.NomeProduto,
	P.UnidadeEstoque;

/* EXERC�CIO 04: ENCONTRE OS NOMES DAS TRANSPORTADORAS E O TOTAL DE FRETE COBRADO POR CADA UMA*/
SELECT 
	T.NomeEmpresa		AS TRANSPORTADORAS,
	SUM(P.Frete)		AS TOTAL_FRETE
FROM 
	TBL_Pedidos P
JOIN 
	TBL_Transportadoras T ON T.pk_CodigoTransportadora = P.fk_CodigoTransportadora
GROUP BY
	T.NomeEmpresa;


/* EXERC�CIO 05: LISTE OS NOMES DOS PRODTOS, O NOME DA CATEGORIA A QUE PERTENCEM E O NOME DA EMPRESA FORNECEDORA*/
SELECT
	P.NomeProduto		AS PRODUTOS,
	C.NomeCategoria		AS CATEGORIAS,
	F.NomeEmpresa		AS FORNECEDORES
FROM
	TBL_Produtos P
JOIN 
	TBL_Categorias C 
		ON P.fk_CodigoCategoria = C.pk_CodigoCategoria
JOIN
	TBL_Fornecedores F ON P.fk_CodigoFornecedor = F.pk_CodigoFornecedor;


/*EXERC�CIO 06: LISTE O NOME DOS FUNCION�RIOS E OS CARGOS DOS CONTATOS DOS CLIENTES PARA OS QUAIS ELES REALIZARAM PEDIDOS*/
SELECT
	UPPER(F.Nome + ' ' + F.Sobrenome) AS FUNCIONARIOS,
	C.NomeEmpresa AS EMPRESAS,
	C.CargoContato AS CARGOS
FROM
	TBL_Pedidos P
JOIN 
	TBL_Funcionarios F ON P.fk_CodigoFuncionario = F.pk_CodigoFuncionario
JOIN 
	TBL_Clientes C ON P.fk_CodigoCliente = C.pk_CodigoCliente;