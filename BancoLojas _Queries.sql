-- EXERCICIO 1
SELECT	
	pk_CodigoFornecedor AS CODIGO, 
	NomeEmpresa AS EMPRESA, 
	NomeContato AS CONTATO, 
	Pais AS PAIS, 
	Telefone AS TELEFONE

FROM 
	TBL_Fornecedores
	
ORDER BY PAIS DESC;


-- EXERCICIO 2
SELECT 
	NomeEmpresa AS Clientes, Pais

FROM 
	TBL_Clientes
	
WHERE 
	Pais <> 'Alemanha' AND Pais <> 'Espanha';

	-- OU
SELECT 
	NomeEmpresa AS Clientes

FROM 
	TBL_Clientes
	
WHERE 
	Pais NOT IN ('Alemanha', 'Espanha');


-- EXERCICIO 3
SELECT 
	pk_NumeroPedido, 
	DataPedido 
	
FROM 
	TBL_Pedidos
	
WHERE 
	DataPedido >= '2017/05/01' AND DataPedido <= '2017/06/30';

	-- OU
SELECT 
	pk_NumeroPedido, 
	DataPedido 
	
FROM 
	TBL_Pedidos
	
WHERE 
	DataPedido BETWEEN '2017/05/01' AND '2017/06/30';