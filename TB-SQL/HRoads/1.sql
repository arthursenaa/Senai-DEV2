create database T_HROADS;

use T_HROADS;

create table Classes
(
	IdClasse	int primary key identity 
	,Nome		varchar (255) not null unique
);

create table Personagens
(
	IdPersonagem	INT PRIMARY KEY IDENTITY
	,Nome			varchar (255) not null unique
	,Capacidade_maxima_de_vida	INT not null
	,Capacidade_maxima_de_mana	int not null
	,DataAtualizacao	datetime not null
	,DataCriacao	datetime not null
	,IdClasse		int foreign key references Classes(IdClasse)
);

create table TipoHabilidades
(	
	IdTipoHabilidade	int primary key identity 
	,Nome				varchar (255) not null unique
);

create table Habilidades
(
	IdHabilidade	int primary key identity
	,Nome			varchar (255) not null
	,IdTipoHabilidade	int foreign key references TipoHabilidades(IdTipoHabilidade)
);

create table Classes_Habilidades
(
	IdClasse	int foreign key references Classes(IdClasse)
	,IdHabilidade	int foreign key references Habilidades(IdHabilidade)
);
