/* EXERCICIO 1 Listar o Código, Nome da Empresa, Nome do Contato, Pais e Telefone da tabela Tbl_Fornecedores,
banco de dados db_Loja, e classificar em ordem crescente por Pais.*/
USE dbLojas;
SELECT	
	pk_CodigoFornecedor		AS CODIGO, 
	NomeEmpresa				AS EMPRESA, 
	NomeContato				AS CONTATO, 
	Pais					AS PAIS, 
	Telefone				AS TELEFONE
FROM 
	TBL_Fornecedores
ORDER BY 
	PAIS DESC;

-- EXERCICIO 2 Listar todos os clientes da tabela clientes cujo país não seja “Alemanha” ou “ Espanha”
SELECT 
	NomeEmpresa				AS CLIENTES, 
	Pais					AS PAIS
FROM 
	TBL_Clientes
WHERE 
	Pais <> 'Alemanha' AND Pais <> 'Espanha';
	-- OU
SELECT 
	NomeEmpresa				AS Clientes,
	Pais					AS PAIS
FROM 
	TBL_Clientes
WHERE 
	Pais NOT IN ('Alemanha', 'Espanha');

-- EXERCICIO 3 Listar todos os pedidos da tabela pedidos cujo data do pedido esteja entre 01/06/2017 e 30/06/2017:
SELECT 
	pk_NumeroPedido			AS PEDIDO, 
	DataPedido
FROM 
	TBL_Pedidos
WHERE 
	DataPedido >= '2017/06/01' AND DataPedido <= '2017/06/30';
	-- OU
SELECT 
	pk_NumeroPedido			AS PEDIDO, 
	DataPedido 
FROM 
	TBL_Pedidos
WHERE 
	DataPedido BETWEEN '2017/06/01' AND '2017/06/30';

-- EXERCICIO 4 Listar todos os produtos da tabela produtos cujo preço esteja entre R$ 20,00 e R$ 50,00.
SELECT 
	NomeProduto				AS PRODUTO,
	PrecoUnitario			AS PRECO
FROM 
	TBL_Produtos
WHERE
	PrecoUnitario BETWEEN 20.00 AND 50.00;

-- EXERCICIO 5 Listar todos os produtos da tabela produtos cuja categoria seja 2, 4 ou 6.
SELECT 
	NomeProduto				AS PRODUTO,
	fk_CodigoCategoria		AS CATEGORIA
FROM 
	TBL_Produtos
WHERE
	fk_CodigoCategoria IN (2, 4, 6);

-- EXERCICIO 6 Listar todos os clientes da tabela clientes cujo nom e do contato inicie com as letras “B”, “F” ou “S”.
SELECT 
	NomeEmpresa				AS EMPRESA,
	NomeContato				AS CONTATO
FROM 
	TBL_Clientes
WHERE
	NomeContato LIKE '[B, F, S]%';
	-- OU
SELECT 
	NomeEmpresa				AS EMPRESA,
	NomeContato				AS CONTATO
FROM 
	TBL_Clientes
WHERE
	NomeContato LIKE 'B%' OR
	NomeContato LIKE 'F%' OR
	NomeContato LIKE 'S%'; 

-- EXERCICIO 7 Listar todos os clientes da tabela clientes cujo nom e do contato inicie com as letras entre “M” e “R”.
SELECT 
	NomeEmpresa				AS EMPRESA,
	NomeContato				AS CONTATO
FROM 
	TBL_Clientes
WHERE
	NomeContato LIKE '[M-R]%';

-- EXERCICIO 8 Retornar os nomes e preços dos cinco primeiros produtos da tabela de produtos.
-- OS 5 MAIS CAROS
SELECT TOP 5 
	NomeProduto				AS PRODUTO,
	PrecoUnitario			AS PRECO
FROM 
	TBL_Produtos
ORDER BY PrecoUnitario DESC;

-- OS 5 MAIS BARATOS
SELECT TOP 5 
	NomeProduto				AS PRODUTO,
	PrecoUnitario			AS PRECO
FROM 
	TBL_Produtos
ORDER BY PrecoUnitario ASC;

-- EXERCICIO 9 Selecionar os Cargos da tabela de Funcionários, porém exibir apenas os registros distintos sem repetições.
SELECT 
	DISTINCT(Cargo) AS CARGOS
FROM 
	TBL_Funcionarios
ORDER BY Cargo DESC;