CREATE DATABASE eleicao;

USE eleicao;
-- criando tabela cargo
CREATE TABLE cargo(
	pk_codigo_cargo		INT PRIMARY KEY,
	nome_cargo			VARCHAR(30) NOT NULL UNIQUE,
	salario				DECIMAL(5,2) NOT NULL DEFAULT 17000.00,
	numero_vagas		INT NOT NULL
);

-- criando a tabela partido
CREATE TABLE partido(
	pk_codigo_partido	INT PRIMARY KEY,
	sigla				CHAR(5) NOT NULL UNIQUE,
	nome_partido		VARCHAR(40) NOT NULL UNIQUE,
	numero_partido		INT NOT NULL UNIQUE
);

-- criando a tabela candidato
CREATE TABLE candidato(
	pk_numero_candidato	INT PRIMARY KEY,
	nome_candidato		VARCHAR(40) UNIQUE NOT NULL,
	fk_codigo_cargo		INT NOT NULL,
	fk_codigo_partido	INT NOT NULL

	FOREIGN KEY(fk_codigo_cargo) REFERENCES cargo (pk_codigo_cargo),
	FOREIGN KEY(fk_codigo_partido) REFERENCES partido (pk_codigo_partido)
);

-- criando a tabela eleitor
CREATE TABLE eleitor(
	pk_titulo_eleitor	VARCHAR(30) PRIMARY KEY,
	zona_eleitoral		CHAR NOT NULL,
	sessao_eleitoral	CHAR NOT NULL ,
	nome_eleitor		VARCHAR(40) NOT NULL
);

-- criando a tabela voto
CREATE TABLE voto(
	fk_titulo_eleitor	VARCHAR(30) UNIQUE NOT NULL,
	fk_numero_candidato INT NOT NULL,
	pk_idVoto			INT PRIMARY KEY

	FOREIGN KEY (fk_titulo_eleitor) REFERENCES eleitor(pk_titulo_eleitor),
	FOREIGN KEY (fk_numero_candidato) REFERENCES candidato(pk_numero_candidato)

);
