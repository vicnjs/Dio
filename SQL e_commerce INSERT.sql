SHOW DATABASES;

USE e_commerce;

INSERT INTO Cliente (Fname, Mname, Lname, Bdate, CPF, Endereço) VALUES
					('Maria','j','Souza','2001-03-05','38983293812','CENTRO'),
                    ('Joao','F','Matos','1998-03-09','09867546791','BARCELONA'),
                    ('Carla','K','Lima','1998-09-12','8346726479','Campolim'),
                    ('Noel','E','SILVA','1995-08-03','87646723617','Saboo'),
                    ('Wallace','S','Nascimento','1975-03-06','16428490412','Joao Romao');
-- Nameproduto, Descproduto, Valproduto, Catproduto, Avaliação ,Tamanho
INSERT INTO Produto (Nameproduto, Descproduto, Valproduto, Catproduto, Avaliação, Tamanho) VALUES
					('Fone de ouvido','','49','Fones','5',''),
                    ('Torradeira','Torradeira eletrica','80','Eletrodomesticos','4','20cm'),
                    ('Smartphone','Xiaomi POCO X6','1200','Smartphonees','5','');

INSERT INTO Pedido (idpedidocliente,Statuspedido,Descpedido,Frete) VALUES
				   ('11','Confirmado','Pedido via APP','5'),
                   ('12','Cancelado','Pedido via site',NULL),
                   ('14','Enviado','Pedido via APP','5'),
                   ('11','Em processamento','Pedido via APP','12');
                   
SELECT * FROM Pedido;
                   
INSERT INTO Estoque (Localestoque, Quantidade) VALUES
					('São Paulo','17'),
                    ('Rio de Janeiro','35'),
                    ('Curitiba','57');
                    
                    
SELECT * FROM Estoque;

INSERT INTO Fornecedor (CNPJ, NomeFantasia, Endfornecedor, Contato) VALUES
					   ('56746527898763','Silvabrinquedos','Centro','16745676587'),
                       ('56478598645612','RMPeletronicos','Flora','13847264721'),
                       ('26754839067452','DESCKTOPS','Barcelona','16748298578'),
                       ('25478698988753','WASP','São Paulo','17438329271');
                       
SELECT * FROM Fornecedor;

INSERT INTO Terceiro_vendedor (CNPJ, CPF, NomeFantasia, Endterceiro, Contato) VALUES
							 ('56746457898763','898765672','brinquedomania','Centro','16895676587'),
							 ('56478598645612','857674653','pking','Flora','13890264721'),
							 ('89764674658900','857673564','polinma','Barcelona','16740988578'),
							 ('25478694588753','905878690','Wpor','São Paulo','17438378571');
                             
SELECT * FROM Terceiro_Vendedor;
