CREATE DATABASE T_Gufos

USE T_Gufos

CREATE TABLE Categorias(
	IdCategoria		int primary key identity not null
	,Nome			varchar(255) not null unique 
);

create table Eventos(
	IdEventos		int primary key identity not null
	,Titulo			varchar(255) not null 
	,Descricao		text
	,DataEvento		datetime not null 
	,Ativo			bit not null  default(1)
	,Localizaçao	varchar(255) null 
	,IdCategoria	int foreign key references Categorias(IdCategoria)
);

create table Usuarios(
	IdUsuario int identity primary key not null
	,Nome		varchar(255) not null
	,Email		varchar(255) not null unique
	,Senha		varchar(255) not null
	,Permissao	varchar(255) not null 
);

create table Presencas(
	IdUsuario int foreign key references Usuarios(IdUsuario)
	,IdEventos int foreign key references Eventos(IdEventos)
);