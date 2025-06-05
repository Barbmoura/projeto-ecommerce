-- Parte 1: Criando índices em Banco de Dados  
USE Ecommerce;
CREATE INDEX idx_descricao ON Produto(Descricao) USING BTREE; -- Busca por produto. Exemplo: Smartphone 128GB  
CREATE INDEX idx_categoria ON Produto(Categoria) USING BTREE; -- Busca por categoria. Exemplo: Eletrônico
CREATE INDEX idx_status ON Pedido(StatusPedido) USING BTREE; -- Busca por status do pedido. Exemplo: Enviado

-- Parte 2: Utilização de procedures para manipulação de dados em Banco de Dados 
CREATE DATABASE Usuario;
USE Usuario;

CREATE TABLE Cliente(
	Id INT AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Senha VARCHAR(60) NOT NULL,
    DataCadastro DATETIME,
    CONSTRAINT pk_IdCliente PRIMARY KEY (Id),
    CONSTRAINT unique_NomeCliente UNIQUE (Nome)
);

DELIMITER \\
CREATE PROCEDURE ProcedureInsertDadosCliente(
	IN NomeProcedure VARCHAR(50),
    IN EmailProcedure VARCHAR(50),
    IN SenhaProcedure VARCHAR(50)
)
BEGIN
	IF (LENGTH(SenhaProcedure) < 10 AND LENGTH(SenhaProcedure) > 7) THEN 
		INSERT INTO Cliente(Nome, Email, Senha, DataCadastro) VALUES(NomeProcedure, EmailProcedure, MD5(SenhaProcedure), NOW());
        SELECT * FROM Cliente;
	ELSE
		SELECT 'Forneça outra senha' AS Message_error;
	END IF;
END \\
DELIMITER ;

CALL ProcedureInsertDadosCliente('Barbara','barbara@email.com','123456789');