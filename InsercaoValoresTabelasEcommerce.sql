USE Ecommerce;

INSERT INTO Cliente(PrimeiroNome, NomeDoMeio, UltimoNome, Cpf, Endereco, DataNascimento, IdPagamento) 
	VALUES('Barbara', 'Barbosa de Oliveira', 'Moura', 12345678910, 'Estrada do Monteiro', '1997-03-13', 1),
		  ('Edson', 'Maia da Costa', 'Moura', 12345678911, 'Estrada do Monteiro', '1995-03-16', 2),
          ('Mayara', 'Barbosa', 'de Oliveira', 12345678912, 'Estrada do Magarça', '2003-10-10', 3),
          ('Márcia', 'Barbosa Lima', 'de Oliveira', 12345678913, 'Estrada do Magarça', '1960-10-07', 4),
          ('Inacio', 'Batista', 'de Oliveira', 12345678914, 'Estrada do Magarça', '1960-01-15', 5),
          ('Carolina', 'Maia da Costa', 'Moura', 12345678915, 'Centro', '1980-02-09', 6),
          ('Eliane', 'Maia da Costa', 'Moura', 12345678916, 'Estrada do Campinho', '1960-08-13', 7),
          ('Juliana', 'Silva', 'Costa', 15267942641, 'Madureira', '1990-02-10', 8),
		  ('Marcos', 'Carvalho', 'Rocha', 26598875631, 'Centro', '1987-04-11', 9),
          ('Vanessa', 'Santana', 'Nunes', 66549832795, 'Madureira', '1990-11-07', 10);
          
INSERT INTO Pagamento(NomeCartao, NumeroCartao, DataValidade, CodigoSeguranca, FormaPagamento)  
	VALUES('Barbara	Barbosa de Oliveira	Moura', '4532758392014567', '1227', '123', 'Crédito'),  
	      ('Edson Maia da Costa	Moura', '5368974123654789', '1126', '456', 'Pix'),  
		  ('Mayara Barbosa de Oliveira', '6011325987452369', '0528', '789', 'Crédito'),  
          ('Márcia Barbosa Lima de Oliveira', '375987654321789', '0925', '321', 'Pix'),   
          ('Inacio Batista de Oliveira', '4556789012345678', '0729', '654', 'Débito'),  
          ('Carolina Maia da Costa Moura', '6011987654321234', '0326', '987', 'Boleto'),  
          ('Eliane Maia da Costa Moura', '4916123456789012', '0427', '159', 'Crédito'),
          ('Juliana Silva Costa', '6011765432109876', '0828', '357', 'Pix'),
          ('Marcos Carvalho Rocha', '4539123456787890', '0129', '258', 'Crédito'),
          ('Vanessa Santana Nunes', '5364987612348765', '0627', '951', 'Débito');
          
INSERT INTO Pedido(StatusPedido, Descricao, Frete, IdCliente)
	VALUES('Em andamento', 'Pedido de eletrônicos', 15.99, 2),
		  ('Processando', 'Pedido de roupas femininas', 10.50, 3),
		  ('Enviado', 'Pedido de roupa', 5.75, 6), 
		  ('Entregue', 'Pedido de acessórios', 8.90, 1), 
		  ('Em andamento', 'Pedido de alimentos perecíveis', 12.30, 4),
		  ('Processando', 'Pedido de móveis pequenos', 20.00, 9), 
		  ('Enviado', 'Pedido de brinquedos infantis', 7.80, 10), 
		  ('Entregue', 'Pedido de alimentos perecíveis', 3.45, 5),
		  ('Em andamento', 'Pedido de material de escritório', 9.99, 7),
		  ('Processando', 'Pedido de brinquedos', 14.25, 8);

INSERT INTO Produto(Categoria, Descricao, Avaliacao, Valor)
	VALUES('Eletrônico', 'Smartphone 128GB', 4.7, 2599.99),
		  ('Roupa', 'Camiseta de algodão', 4.5, 59.90),
          ('Móvel', 'Mesa de escritório', 4.2, 399.99),
		  ('Brinquedo', 'Carrinho de controle remoto', 4.8, 199.99),
		  ('Alimento', 'Chocolate meio amargo 70%', 4.9, 12.50), 
		  ('Eletrônico', 'Fone Bluetooth', 4.6, 349.90),
		  ('Roupa', 'Jaqueta de couro sintético', 4.3, 199.99),
		  ('Móvel', 'Cadeira gamer', 4.7, 1299.99), 
		  ('Brinquedo', 'Boneca articulada', 4.5, 89.90),
		  ('Alimento', 'Cereal matinal integral', 4.1, 15.75);
          
INSERT INTO RelacaoProdutoPedido(StatusRelacaoPP, Quantidade, IdProduto, IdPedido)
	VALUES('Disponível', 5, 1, 1),
		  ('Sem estoque', 0, 2, 2),
		  ('Disponível', 12, 3, 7),
		  ('Disponível', 8, 4, 6),
		  ('Sem estoque', 0, 5, 10),
		  ('Disponível', 20, 6, 3),
		  ('Disponível', 3, 7, 4),
		  ('Sem estoque', 0, 8, 5),
		  ('Disponível', 15, 9, 8),
		  ('Disponível', 7, 10, 9);

INSERT INTO Estoque(LocalEstoque, Quantidade) 
	VALUES('Rio de Janeiro', 5000),
		  ('São Paulo', 10000),
          ('Manaus', 700),
          ('Minas Gerais', 8000),
          ('Bahia', 800),
          ('Goiás', 5800),
          ('Espírito Santo', 4000),
          ('Paraná', 7000),
          ('Espírito Santo', 2500),
          ('Rio Grande do Sul', 300);

INSERT INTO RelacaoProdutoEstoque(IdProduto, IdEstoque)
	VALUES(1, 1),
		  (3, 2),
		  (4, 3),
		  (2, 4),
		  (6, 5),
		  (8, 6),
		  (9, 7),
		  (10, 8),
		  (5, 9),
		  (7, 10);

INSERT INTO Fornecedor(RazaoSocial, Cnpj, Contato) 
	VALUES('Tudo Eletrônicos LTDA', '12345678910123', '32658792156'),
		  ('Gamer Show LTDA', '12345678918123', '15625849735'),
          ('Raiz Delicada LTDA', '12345678610123', '62549873268'),
          ('Móveis Dália LTDA', '12345678970123', '26548973268'),
          ('Kids.com LTDA', '12345678980123', '26589741235'),
          ('Essência & Estilo LTDA', '12345678910125', '26589715496'),
          ('Toque Final LTDA', '12345678910523', '32564164597'),
          ('Distribuidora XYZ S/A', '98765432000100', '21998765432'),
		  ('Alimentos Boa Mesa ME', '11222333000144', '31987654321'),
		  ('Tech Soluções Ltda', '55666777000188', '41976543210');

INSERT INTO RelacaoProdutoFornecedor(IdProduto, IdFornecedor)
	VALUES(6, 1),
		  (8, 2),
		  (9, 3),
		  (3, 4),
		  (4, 5),
		  (7, 6),
		  (2, 7),
		  (5, 8),
		  (10, 9),
		  (1, 10);

INSERT INTO VendedorTerceirizado(RazaoSocial, Cnpj, Endereco, Contato) 
	VALUES('Tech Solutions Ltda', '12345678000195', 'Av. Paulista, 1000', '11987654321'),
		  ('Moda & Estilo Ltda', '98765432000132', 'Rua das Rosas, 200', '21999887766'),
		  ('Moveis Premium SA', '45612378000144', 'Alameda Santos, 300', '31988776655'),
		  ('Brinquedos Alegres ME', '74185296000111', 'Rua das Crianças, 50', '41977665544'),
		  ('Doces Delícias EPP', '36925814700012', 'Praça Central, 25', '51966554433'),
		  ('Eletrônicos Top LTDA', '85274196300017', 'Rua dos Gadgets, 99', '11955443322'),
		  ('Roupas Fashion ME', '75315948600016', 'Av. da Moda, 88', '21944332211'),
		  ('Super Alimentos SA', '14725836900014', 'Rua da Feira, 150', '31933221100'),
		  ('Games & Tecnologia Ltda', '95175385200019', 'Av. dos Jogos, 45', '41922110099'),
		  ('Decoração Chic LTDA', '25896314700013', 'Rua do Design, 77', '51911009988');

INSERT INTO RelacaoProdutoVendedorTerceirizado(IdProduto, IdVendedorTerceirizado)
	VALUES(1, 1),
		  (2, 2),
		  (3, 3),
		  (4, 4),
		  (5, 5),
		  (6, 6),
		  (7, 7),
		  (10, 8),
		  (8, 9),
		  (9, 10);