use T_Gufos

insert into Usuarios (Nome, Email,Senha ,Permissao)
values ('Rayssa','rayssa@gmail.com','r123456','Aluno')

insert into Usuarios (Nome, Email,Senha ,Permissao)
values ('Claiton','c.y@gmail.com','c123456','ADMINISTRADOR')

select * from Usuarios;

insert into Categorias(Nome) values('Jogos'),('Meetup'),('Futebol');

select * from Categorias order by IdCategoria asc

insert into Eventos(Titulo, Descricao,DataEvento ,Ativo, Localiza�ao, IdCategoria)
values ('Campeonato de Ping-Pong','Campeonato entre as turmas de tec. redes e dev',GETDATE() , 1, 'Alameda Bar�o de Limeira, 539',1);

select * from Eventos;

insert into Eventos(Titulo, Descricao,DataEvento ,Ativo, Localiza�ao, IdCategoria)
values ('futebol no terra�o','Nudes','2019-08-06T18:00:00' , 1, 'Alameda Bar�o de Limeira, 539',2);

select * from Categorias
select * from Usuarios
select * from Eventos

insert into Presencas(IdEventos ,IdUsuario) values (1,2),(1,1),(2,2)

update Eventos set IdCategoria = 3 where IdEventos = 3