USE Ecommerce;

-- Parte 1: Criando índices em Banco de Dados  
CREATE INDEX idx_descricao ON Produto(Descricao) USING BTREE; -- Busca por produto. Exemplo: Smartphone 128GB  
CREATE INDEX idx_categoria ON Produto(Categoria) USING BTREE; -- Busca por categoria. Exemplo: Eletrônico
CREATE INDEX idx_status ON Pedido(StatusPedido) USING BTREE; -- Busca por status do pedido. Exemplo: Enviado

-- Parte 2: Utilização de procedures para manipulação de dados em Banco de Dados 
-- Criar uma procedure que possua as instruções de inserção, remoção e atualização de dados no banco de dados. As instruções devem estar dentro de estruturas condicionais (como CASE ou IF).
-- Além das variáveis de recebimento das informações, a procedure deverá possuir uma variável de controle. Essa variável de controle irá determinar a ação a ser executada. Ex: opção 1 – select, 2 – update, 3 – delete.  

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
drop procedure ProcedureInsertDadosCliente;
DELIMITER \\
CREATE PROCEDURE ProcedureInsertDadosCliente(
	IN NomeProcedure VARCHAR(50),
    IN EmailProcedure VARCHAR(50),
    IN SenhaProcedure VARCHAR(50)
)
BEGIN
	IF (LENGTH(SenhaProcedure) < 10 AND LENGTH(SenhaProcedure) > 7) THEN 
		INSERT INTO Cliente(Nome, Email, Senha, DataCadastro) VALUES(NomeProcedure, EmailProcedure, md5(SenhaProcedure), now());
        SELECT * FROM Cliente;
	ELSE
		SELECT 'Forneça outra senha' AS Message_error;
	END IF;
END \\
DELIMITER ;

CALL ProcedureInsertDadosCliente('Barbara','barbara@email.com','123456789');
