-- comentários
-- a linha abaixo cria um banco de dados
create database dboficinamecanica;
-- a linha abaixo escolhe o banco de dados
use dboficinamecanica;
-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(20) not null unique,
senha varchar(15) not null
);
-- alterar o tamanho do login
ALTER TABLE tbusuarios MODIFY COLUMN login VARCHAR(100);
-- o comando abaixo descreve a tabela
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- Create -> insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'Mauricio Picirillo','975370139','mauriciopicirillo','Picirillo@2024');
-- a linha abaixo exibe os dados da tabela (CRUD)
-- read  -> select
select * from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Administrador','99999-9999','admin','Picirillo@2024');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Teste','99999-9999','teste','teste');

-- a linha abaixo modifica dados na tabela (CRUD)
-- update -> update
update tbusuarios set fone='88888-8888' where iduser=2;

-- a linha abaixo apaga um registro da tabela (CRUD)
-- delete -> delete
delete from tbusuarios where iduser=3;

-- a linha abaixo ira criar a tabela de clientes
create	table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(150) not null,
cpfcli varchar(15),
fonecli varchar(50) not null,
endcli varchar(150),
numerocli varchar(15),
bairrocli varchar(150),
cidadecli varchar(150),
estadocli varchar(2),
cepcli varchar(50)
); 

describe tbclientes;

insert into tbclientes(nomecli,cpfcli,fonecli,endcli,numerocli,bairrocli,cidadecli,estadocli,cepcli)
values('Mauricio','999.999.999-01','99999-9999','Avenida das Acacias','14','centro','Sumaré','RJ','99999-999')

select * from tbclientes;

create table tbos(
idos int primary key auto_increment,
data_os timestamp default current_timestamp,
veiculo varchar(150) not null,
placa varchar(50) not null,
marca varchar(50) not null,
versao varchar(50) not null,
ano varchar(50) not null,
motor varchar(50) not null,
cor varchar(50) not null,
defeito varchar(150) not null,
servico varchar(150),
mecanico varchar(50),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos(veiculo,placa,marca,versao,ano,motor,cor,defeito,servico,mecanico,valor,idcli)
values('Gol','KBX-8690','VW','CLI','1996','1,6','Branco','Barulho na roda dianteira','Troca da Omocinetica','Ricardo',260.00,1);

select * from tbos;

-- o código abaixo traz informações de duas tabelas
select 
O.idos,veiculo,placa,defeito,servico,mecanico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);