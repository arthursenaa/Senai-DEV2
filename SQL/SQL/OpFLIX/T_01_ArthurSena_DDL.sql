create database T_OpFlix

use T_OpFlix

--DDL

create table TipoUsuario (
	Id_TipoUsuario		INT primary key identity
	,Tipo				varchar(255) not null unique
);

create table Usuario(
	Id_Usuario		int primary key identity
	,Email			varchar(255) not null unique
	,Senha			varchar(255) not null 
	,Nome			varchar(255) not null
	,Id_TipoUsuario	int foreign key references TipoUsuario(Id_TipoUsuario)
);

create table Genero(
	IdGenero		int primary key identity
	,Nome			varchar(255) not null 
);

create table Tipo(
	IdTipo			int primary key identity
	,Tipo			varchar(255) not null unique
)

create table Lancamento(
	IdLancamentos		INT primary key identity
	,Nome				varchar(255) not null
	,Sinopse			varchar(255) not null
	,Duracao			varchar(255) not null
	,DataLancamento		DateTime not  null
	,Plataforma			varchar(255)
	,Id_Tipo			int foreign key references Tipo(IdTipo)
	,Id_Genero			int foreign key references Genero(IdGenero)
);

create table Favorito(
	Id_Usuario		int foreign key references Usuario(Id_Usuario)
	,IdLancamento	int foreign key references Lancamento(IdLancamentos)
);