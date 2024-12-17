-- Criação do banco de dados para o cenario de E-commerce.

create database E_commerce;
use E_commerce;

CREATE TABLE Cliente(
	idcliente INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Mname VARCHAR(1),
    Lname VARCHAR(20),
    Bdate DATE NOT NULL,
    CPF CHAR(11) NOT NULL,
    Endereço VARCHAR(50),
    CONSTRAINT CPF_client UNIQUE(CPF)
);
DESC Cliente;

ALTER TABLE Cliente AUTO_INCREMENT=1;

CREATE TABLE Produto(
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Nameproduto VARCHAR(30) NOT NULL,
    Descproduto VARCHAR(30),
    Valproduto VARCHAR(10) NOT NULL,
    Catproduto VARCHAR(20) NOT NULL,
    Avaliação FLOAT DEFAULT 0,
    Tamanho VARCHAR(10) 
);
DESC Produto;

CREATE TABLE Pagamento(
	idpagamento INT PRIMARY KEY NOT NULL,
    Tipodepagamento ENUM ('Boleto','Cartão de credito','Cartao de debito','Dois cartoes','Pix')
);

DESC Pagamento;

CREATE TABLE Formadepagamento(
	idcliente INT,
    idpagamento INT,
    CONSTRAINT fk_pagamentocliente FOREIGN KEY (idcliente) REFERENCES Cliente (idcliente),
    CONSTRAINT fk_formapagamento FOREIGN KEY (idpagamento) REFERENCES Pagamento (idpagamento)
);

DESC Formadepagamento;

CREATE TABLE Pedido(
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idpedidocliente INT,
    Statuspedido ENUM ('Confirmado','Cancelado','Enviado','Em processamento','Entregue') DEFAULT 'Em processamento',
    Descpedido VARCHAR (255),
    Frete FLOAT DEFAULT 0,
    CONSTRAINT fk_pedidocliente FOREIGN KEY (idpedidocliente) REFERENCES Cliente (idcliente)
);

DESC Pedido;

CREATE TABLE Estoque(
	idestoque INT AUTO_INCREMENT PRIMARY KEY,
    Localestoque VARCHAR(255) NOT NULL,
    Quantidade INT NOT NULL DEFAULT 0
);

DESC Estoque;

CREATE TABLE produto_em_estoque(
	idproduto INT,
    idestoque INT,
    Quantidade INT NOT NULL DEFAULT 0,
    Pstatus ENUM ('Disponivel','Sem estoque') DEFAULT 'Disponivel',
    CONSTRAINT fk_produto_estoque FOREIGN KEY (idproduto) REFERENCES Produto (idproduto),
    CONSTRAINT fk_estoque_produto FOREIGN KEY (idestoque) REFERENCES Estoque (idestoque)
);

DESC produto_em_estoque;

CREATE TABLE Fornecedor(
	idfornecedor INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ CHAR(15) NOT NULL,
    Nomefantasia VARCHAR(40) NOT NULL,
    Endfornecedor VARCHAR(255),
    Contato CHAR(11) NOT NULL,
    CONSTRAINT unique_fornecedor UNIQUE (CNPJ)
);

DESC Fornecedor;

CREATE TABLE Produto_fornecedor (
	idproduto INT,
    idfornecedor INT,
    Quantidade INT NOT NULL DEFAULT 1,
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (idproduto) REFERENCES Produto (idproduto),
    CONSTRAINT fk_Fornecdor_produto FOREIGN KEY (idfornecedor) REFERENCES Fornecedor (idfornecedor)
);

DESC Produto_fornecedor;

CREATE TABLE Terceiro_vendedor(
	idterceiro INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ CHAR(15) NOT NULL,
    CPF CHAR(9) NOT NULL,
    Nomefantasia VARCHAR(40) NOT NULL,
    Endterceiro VARCHAR(255),
    Contato CHAR(11) NOT NULL,
    CONSTRAINT unique_CNPJ_terceiro UNIQUE (CNPJ),
    CONSTRAINT unique_CPF_terceiro UNIQUE (CPF)
);


DESC Terceiro_vendedor;

CREATE TABLE Produto_por_vendedor(
	idproduto INT,
    idterceiro INT,
    Quantidade INT NOT NULL DEFAULT 1,
    CONSTRAINT fk_produto_terceiro FOREIGN KEY (idproduto) REFERENCES Produto (idproduto),
    CONSTRAINT fk_terceiro_produto FOREIGN KEY (idterceiro) REFERENCES Terceiro_vendedor (idterceiro)
);

DESC Produto_por_vendedor;
