create table Cliente(
id_cliente int primary key auto_increment,
nome varchar(15),
telefone varchar(15),
nascimento date,
genero enum('M', 'F')
);
desc cliente;
select * from cliente;
select nome, genero from cliente order by nome;
insert into Cliente values('1', 'nelo', '924425701', '2000-01-14', 'M'), (default, 'manuel', '949964495', '1999-05-24', 'M');
insert into Cliente values( default,'Anuelsio', '949964495', '2021-07-15', 'M'), (default,'Sky', '927011472', '2025-10-24', 'F');
insert into Cliente values( '7','Anuelsio', '949000044', '2021-07-15', 'M'), (default,'Sky', '927011472', '2025-10-24', 'F'),
( default,'Carolina', '924425701', '2021-07-15', 'M'), (default,'Sky', '927011472', '2025-10-24', 'F'),
( default,'Anuelsio', '949964495', '2021-07-15', 'M'), (default,'Emanuel', '927011472', '2001-01-14', 'M');
update Cliente set nome = 'Manuel' where id_cliente = '2'; /*limit 1;   */
/*delete from cliente where id_cliente= '2';
truncate cliente;*/

create table Fornecedor(
id_fornecedor int primary key auto_increment not null,
nome varchar(15),
telefone varchar(15),
cidade varchar(20)
);
desc fornecedor;
select * from fornecedor;
insert into fornecedor values('1', 'capitango', '946635949', 'luanda'), (default, 'theodor', '948314220', 'moxico');
insert into fornecedor values(default, 'Lurdes', '946635949', 'Moxico'), (default, 'Carol', '948314220', 'moxico'),
(default, 'Mimosa', '94600949', 'Kwanza Sul'), (default, 'Sambita', '948313440', 'Kwanza Sul'),
 (default, 'Lurdes', '946635949', 'Moxico'), (default, 'Carol', '948314220', 'moxico');

create table Venda(
id_venda int primary key auto_increment not null,
valor double,
desconto double,
datta date,
id_cliente int not null,
foreign key(id_cliente) references Cliente (id_cliente)
);
desc venda;
select * from venda;
insert into venda values('1', '2000', '1000', '2025-04-08', default), (default, '300000', '1000', '2025-04-11', default);
insert into venda values('3', '40000', '700', '2024-04-08', '3'), (default, '50000', '100', '2025-09-18', default), 
(default, '80000', '100', '2025-07-08', default), (default, '30000', '100', '2025-04-11', default), 
(default, '20000', '1000', '2025-04-08', default), (default, '3000', '100', '2023-08-19', default);
alter table Venda add id_cliente int;
alter table Venda add constraint id_cliente foreign key(id_cliente) references Cliente(id_cliente) on delete cascade;


create table Venda_Produto(
id_vp int primary key auto_increment not null
);
alter table Venda_Produto add id_venda int;
alter table Venda_Produto add id_produto int;
alter table Venda_Produto add constraint id_venda foreign key(id_venda) references Venda(id_venda) on delete cascade;
alter table Venda_Produto add constraint id_produto foreign key(id_produto) references Produto(id_produto) on delete cascade;
desc venda_produto;

create table Produto(
id_produto int primary key auto_increment not null,
nome varchar(15),
valor decimal,
qtd decimal
);
desc produto;
select * from produto;
select * from produto where nome = 'computador'; /*selecionar linha*/
insert into produto values('1', 'computador', '200000', '2'), (default, 'computador', '200000', '5');
insert into produto values(default, 'Impressora', '2.000', '2', default), (default, 'Cabo Rj45', '5.000', '5', default),
(default, 'Rotiador', '6.000', '4', default), (default, 'Mouse', '5.000', '5', default),(default, 'Teclado', '10.000', '7', default),
 (default, 'SSD', '30.000', '5', default),(default, 'HD', '20.000', '2', default), (default, 'Pendrive', '5.000', '3', default);
alter table Produto add id_fornecedor int;
alter table Produto add constraint fk_produto_fornecedor foreign key(id_fornecedor) references fornecedor(id_fornecedor) on delete cascade;
