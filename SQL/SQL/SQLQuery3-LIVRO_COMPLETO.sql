CREATE DATABASE T_Livros

USE T_Livros

CREATE TABLE Generos
(
	IdGENERO	INT PRIMARY KEY IDENTITY
	,Nome		VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Generos (Nome) VALUES	('ROMANCE'),('INFANTIL'),('TERROR');

SELECT *
	FROM Generos

CREATE TABLE Autores
(
	IdAutores	INT PRIMARY KEY IDENTITY
	,NOME		VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Autores(NOME) VALUES	('John Green'),('Ruth Rocha'),('Stephen King');
--selecionar autores
SELECT * FROM Autores AS A

CREATE TABLE Livros
(
	IdLivros	INT PRIMARY KEY IDENTITY
	,IdAutores	INT FOREIGN KEY REFERENCES Autores(IdAutores)
	,Titulo		VARCHAR(120) NOT NULL
	,IdGenero	INT FOREIGN KEY REFERENCES Generos(IdGENERO)
);
INSERT INTO Livros ( Titulo,IdAutores ,IdGenero) VALUES ('A Culpa É das Estrelas', 1 , 1)
														,('CORES' ,2 ,2)
														,('IT', 3,3);
SELECT * FROM Livros AS L

SELECT *
	FROM Livros AS L
--selecionar livro e autor
SELECT  Livros.Titulo ,Autores.NOME AS Autor 
	FROM Livros
	LEFT JOIN Autores
	ON Autores.IdAutores = Livros.IdAutores
--selecionar livro e genero
SELECT  Livros.Titulo , Generos.Nome AS Genero
	FROM Livros
	LEFT JOIN Generos
	ON Generos.IdGENERO = Livros.IdGenero
--Selecionar tudo
SELECT  Livros.Titulo ,Autores.NOME AS Autor , Generos.Nome AS Genero
	FROM Livros
	LEFT JOIN Autores
	ON Autores.IdAutores = Livros.IdAutores
	LEFT JOIN Generos
	ON Generos.IdGENERO = Livros.IdGenero

ALTER TABLE Livros ADD Sinopse VARCHAR(100) DEFAULT('SEM SINOPSE');

SELECT  Livros.Titulo ,Autores.NOME AS Autor , Generos.Nome AS Genero
	FROM Livros
	LEFT JOIN Autores
	ON Autores.IdAutores = Livros.IdAutores
	LEFT JOIN Generos
	ON Generos.IdGENERO = Livros.IdGenero													
