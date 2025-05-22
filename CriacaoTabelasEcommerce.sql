CREATE DATABASE Ecommerce;
USE Ecommerce;

create table Cliente
(
	IdCliente int auto_increment primary key,
    PrimeiroNome varchar(10) not null,
    NomeDoMeio varchar(45),
    UltimoNome varchar(45) not null,
    Cpf char(11) not null,
    Endereco varchar(45) not null,
    DataNascimento date not null,
    IdPagamento int,
    constraint unique_CpfCliente unique (Cpf),
    constraint fk_Cliente_Pagamento foreign key (IdPagamento) references Pagamento(IdPagamento)
);

create table Pagamento
(
	IdPagamento int auto_increment primary key,
    NomeCartao varchar(45),
    NumeroCartao char(16),
	DataValidade char(4),
    CodigoSeguranca char(3),
    FormaPagamento enum('Débito', 'Crédito', 'Boleto', 'Pix')
);

create table Pedido
(
	IdPedido int auto_increment primary key,
    StatusPedido enum('Em andamento','Processando','Enviado','Entregue') default 'Processando',
    Descricao varchar(255),
	Frete float not null default 10,
    IdCliente int,
    constraint fk_Pedido_Cliente foreign key (IdCliente) references Cliente(IdCliente)
);

create table Produto
(
	IdProduto int auto_increment primary key,
    Categoria enum('Eletrônico','Roupa','Móvel','Brinquedo','Alimento') not null,
    Descricao varchar(45) not null,
    Avaliacao float,
    Valor float
);

create table Estoque
(
	IdEstoque int auto_increment primary key,
    LocalEstoque varchar(45) not null,
    Quantidade int default 0
);

create table Fornecedor
(
	IdFornecedor int auto_increment primary key,
    RazaoSocial varchar(255) not null,
    Cnpj char(14) not null,
    Contato char(11) not null,
    constraint unique_RazaoSocialFornecedor unique (RazaoSocial),
    constraint unique_CnpjFornecedor unique (Cnpj)
);

create table VendedorTerceirizado
(
	IdVendedorTerceirizado int auto_increment primary key,
    RazaoSocial varchar(255) not null,
    Cnpj char(14) not null,
    Endereco varchar(45) not null,
    Contato char(11) not null,
    constraint unique_RazaoSocialVendedorTerceirizado unique (RazaoSocial),
    constraint unique_CnpjVendedorTerceirizado unique (Cnpj)
);

create table RelacaoProdutoPedido
(
	IdRelacaoProdutoPedido int auto_increment primary key,
    StatusRelacaoPP enum('Disponível', 'Sem estoque'),
	Quantidade int not null,
    IdProduto int,
    IdPedido int,
    constraint fk_RelacaoProdutoPedido_Produto foreign key (IdProduto) references Produto(IdProduto),
    constraint fk_RelacaoProdutoPedido_Pedido foreign key (IdPedido) references Pedido(IdPedido)
);

create table RelacaoProdutoFornecedor
(
	IdRelacaoProdutoFornecedor int auto_increment primary key,
    IdProduto int,
    IdFornecedor int,
    constraint fk_RelacaoProdutoFornecedor_Produto foreign key (IdProduto) references Produto(IdProduto),
    constraint fk_RelacaoProdutoFornecedor_Fornecedor foreign key (IdFornecedor) references Fornecedor(IdFornecedor)
);

create table RelacaoProdutoEstoque
(
	IdRelacaoProdutoEstoque int auto_increment primary key,
    IdProduto int,
    IdEstoque int,
    constraint fk_RelacaoProdutoEstoque_Produto foreign key (IdProduto) references Produto(IdProduto),
    constraint fk_RelacaoProdutoEstoque_Estoque foreign key (IdEstoque) references Estoque(IdEstoque)
);

create table RelacaoProdutoVendedorTerceirizado
(
	IdRelacaoProdutoEstoque int auto_increment primary key,
    IdProduto int,
    IdVendedorTerceirizado int,
    constraint fk_RelacaoProdutoVendedorTerceirizado_Produto foreign key (IdProduto) references Produto(IdProduto),
    constraint fk_RelacaoProdutoVendedorTerceirizado_VendedorTerceirizado foreign key (IdVendedorTerceirizado) references VendedorTerceirizado(IdVendedorTerceirizado)
);