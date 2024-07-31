-- criação do banco de dados DBLOJAS
CREATE DATABASE dbLojas;

USE dbLojas;

-- criação das tabelas
CREATE TABLE TBL_Clientes(
	pk_CodigoCliente		VARCHAR(5) PRIMARY KEY,
	NomeEmpresa				VARCHAR(40) NOT NULL,
	NomeContato				VARCHAR(30),
	CargoContato			VARCHAR(30),
	Endereco				VARCHAR(60),
	Cidade					VARCHAR(15),
	Regiao					VARCHAR(15),
	CEP						VARCHAR(10),
	Pais					VARCHAR(15),
	Telefone				VARCHAR(24),
	Fax						VARCHAR(24)
);

CREATE TABLE TBL_Funcionarios(
	pk_CodigoFuncionario	INT PRIMARY KEY,
	Sobrenome				VARCHAR(30) NOT NULL,
	Nome					VARCHAR(30) NOT NULL,
	Cargo					VARCHAR(30),
	Tratamento				VARCHAR(25),
	DataNascimento			DATE,
	DataContratacao			DATE,
	Endereco				VARCHAR(60),
	Cidade					VARCHAR(15),
	Regiao					VARCHAR(15),
	CEP						VARCHAR(10),
	Pais					VARCHAR(15),
	TelefoneResidencial		VARCHAR(24),
	Ramal					VARCHAR(4),
	Observacoes				VARCHAR(255)
);

CREATE TABLE TBL_Fornecedores(
	pk_CodigoFornecedor		INT PRIMARY KEY,
	NomeEmpresa				VARCHAR(40) NOT NULL,
	NomeContato				VARCHAR(30),
	CargoContato			VARCHAR(30),
	Endereco				VARCHAR(60),
	Cidade					VARCHAR(15),
	Regiao					VARCHAR(15),
	CEP						VARCHAR(10),
	Pais					VARCHAR(15),
	Telefone				VARCHAR(24),
	Fax						VARCHAR(24)
);

CREATE TABLE TBL_Transportadoras(
	pk_CodigoTransportadora INT PRIMARY KEY,
	NomeEmpresa				VARCHAR(40) NOT NULL,
	Telefone				VARCHAR(24)
);

CREATE TABLE TBL_Categorias(
	pk_CodigoCategoria		INT PRIMARY KEY,
	NomeCategoria			VARCHAR(15) NOT NULL,
	Descricao				VARCHAR(300)
);

CREATE TABLE TBL_Produtos(
	pk_CodigoProduto		INT PRIMARY KEY,
	NomeProduto				VARCHAR(40) NOT NULL,
	fk_CodigoFornecedor		INT,
	fk_CodigoCategoria		INT,
	QuantidadeUnidade		VARCHAR(25),
	PrecoUnitario			MONEY,
	UnidadeEstoque			SMALLINT,
	UnidadesPedidas			SMALLINT,
	NivelReposicao			SMALLINT,
	Descontinuado			BIT NOT NULL

	FOREIGN KEY(fk_CodigoFornecedor) REFERENCES TBL_Fornecedores(pk_CodigoFornecedor),
	FOREIGN KEY(fk_CodigoCategoria) REFERENCES TBL_Categorias(pk_CodigoCategoria)
);

CREATE TABLE TBL_Pedidos(
	pk_NumeroPedido			INT PRIMARY KEY,
	fk_CodigoCliente		VARCHAR(5),
	fk_CodigoFuncionario	INT,
	DataPedido				DATE,
	DataEntrega				DATE,
	DataEnvio				DATE,
	fk_CodigoTransportadora INT,
	Frete					MONEY,
	NomeDestinatario		VARCHAR(60),
	EnderecoDestinatario	VARCHAR(60),
	CidadeDestino			VARCHAR(15),
	RegiaoDestino			VARCHAR(15),
	CEPDestino				VARCHAR(10),
	PaisDestino				VARCHAR(15)

	FOREIGN KEY(fk_CodigoCliente) REFERENCES TBL_Clientes(pk_CodigoCliente),
	FOREIGN KEY(fk_CodigoFuncionario) REFERENCES TBL_Funcionarios(pk_CodigoFuncionario),
	FOREIGN KEY(fk_CodigoTransportadora) REFERENCES TBL_Transportadoras(pk_CodigoTransportadora)
);

CREATE TABLE TBL_DetalhesPedidos(
	pk_idDetalhes INT PRIMARY KEY IDENTITY(1,1),
	fk_NumeroPedido	INT NOT NULL,
	fk_CodigoProduto INT NOT NULL,
	PrecoUnitario MONEY NOT NULL,
	Quantidade SMALLINT NOT NULL,
	Desconto REAL NOT NULL

	FOREIGN KEY(fk_NumeroPedido) REFERENCES TBL_Pedidos(pk_NumeroPedido),
	FOREIGN KEY(fk_CodigoProduto) REFERENCES TBL_Produtos(pk_CodigoProduto)
);